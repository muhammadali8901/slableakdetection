(function () {
  "use strict";

  // ------- Mobile drawer -------
  function initDrawer() {
    var toggle = document.getElementById("t6NavToggle");
    var drawer = document.getElementById("t6Drawer");
    if (!toggle || !drawer) return;

    toggle.addEventListener("click", function (e) {
      e.preventDefault();
      var open = drawer.classList.toggle("is-open");
      toggle.setAttribute("aria-expanded", open ? "true" : "false");
      document.body.style.overflow = open ? "hidden" : "";
    });

    drawer.querySelectorAll("a").forEach(function (link) {
      link.addEventListener("click", function () {
        drawer.classList.remove("is-open");
        document.body.style.overflow = "";
        toggle.setAttribute("aria-expanded", "false");
      });
    });

    document.addEventListener("keydown", function (e) {
      if (e.key === "Escape" && drawer.classList.contains("is-open")) {
        drawer.classList.remove("is-open");
        document.body.style.overflow = "";
        toggle.setAttribute("aria-expanded", "false");
        toggle.focus();
      }
    });
  }

  // ------- Sticky CTA show/hide -------
  function initStickyCta() {
    var bar = document.querySelector(".t6-mobile-cta");
    if (!bar) return;
    bar.style.transition = "transform .25s ease";
    window.addEventListener("scroll", function () {
      var y = window.scrollY;
      if (y < 120) {
        bar.style.transform = "translateY(100%)";
      } else {
        bar.style.transform = "translateY(0)";
      }
    }, { passive: true });
  }

  // ------- Smooth-scroll for anchor links -------
  function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(function (a) {
      a.addEventListener("click", function (e) {
        var hash = a.getAttribute("href");
        if (!hash || hash === "#" || hash.length < 2) return;
        var target = document.querySelector(hash);
        if (!target) return;
        e.preventDefault();
        target.scrollIntoView({ behavior: "smooth", block: "start" });
      });
    });
  }

  // ------- sal.js init + safety net (Deferred until window load) -------
  function initSal() {
    var runSal = function () {
      if (typeof sal === "function") {
        try {
          sal({ once: true, threshold: 0.12 });
        } catch { /* noop */ }
      }
      setTimeout(function () {
        document.querySelectorAll("[data-sal]:not(.sal-animate)").forEach(function (el) {
          el.style.opacity = "1";
          el.style.transform = "none";
        });
      }, 300);
    };

    if (document.readyState === "complete") {
      runSal();
    } else {
      window.addEventListener("load", runSal);
    }
  }

  var firebaseConfig = {
    apiKey: "AIzaSyBz26ddpu3cC0Mhsickpqb04RWo4RtdYFs",
    authDomain: "slabeleakdetectionus.firebaseapp.com",
    projectId: "slabeleakdetectionus",
    storageBucket: "slabeleakdetectionus.firebasestorage.app",
    messagingSenderId: "542462356905",
    appId: "1:542462356905:web:33142acee536e7621ce8b8"
  };

  function setupFirebaseForms() {
    var forms = document.querySelectorAll("form");
    if (forms.length === 0) return;

    forms.forEach(function (form) {
      form.addEventListener("submit", function (e) {
        e.preventDefault();
        submitFormToFirebase(form);
      });
    });
  }

  async function submitFormToFirebase(form) {
    var btn = form.querySelector("button[type='submit']");
    var originalBtnText = btn ? btn.textContent : "Submit";

    if (btn) {
      btn.disabled = true;
      btn.textContent = "Sending...";
    }

    var data = {};
    var collectionName = "leads";

    var isReview = form.querySelector('input[placeholder*="First Name"]') || window.location.pathname.indexOf("reviews") !== -1;
    var isNewsletter = !form.querySelector('textarea') && form.querySelectorAll('input').length === 1;

    if (isReview) {
      collectionName = "reviews";
      var firstNameEl = form.querySelector('input[placeholder*="First Name"]');
      var lastNameEl = form.querySelector('input[placeholder*="Last Name"]');
      var cityEl = form.querySelector('input[placeholder*="City"]');
      var serviceEl = form.querySelector('select');
      var ratingEl = form.querySelector('select:nth-of-type(2)') || form.querySelector('select[required]') || { value: "5" };
      var textEl = form.querySelector('textarea');

      data = {
        firstName: firstNameEl ? firstNameEl.value : "",
        lastName: lastNameEl ? lastNameEl.value : "",
        location: cityEl ? cityEl.value : "",
        service: serviceEl ? serviceEl.value : "",
        rating: ratingEl ? parseInt(ratingEl.value, 10) : 5,
        reviewText: textEl ? textEl.value : ""
      };
    } else if (isNewsletter) {
      collectionName = "newsletter";
      var emailEl = form.querySelector('input[type="email"]') || form.querySelector('input');
      data = {
        email: emailEl ? emailEl.value : ""
      };
    } else {
      var nameEl = form.querySelector('input[placeholder*="name"]') || form.querySelector('input[placeholder*="Name"]') || form.querySelector('input[type="text"]');
      var phoneEl = form.querySelector('input[placeholder*="phone"]') || form.querySelector('input[placeholder*="Phone"]') || form.querySelector('input[type="tel"]');
      var emailEl = form.querySelector('input[placeholder*="email"]') || form.querySelector('input[placeholder*="Email"]') || form.querySelector('input[type="email"]');
      var serviceEl = form.querySelector('select');
      var msgEl = form.querySelector('textarea');

      data = {
        name: nameEl ? nameEl.value : "",
        phone: phoneEl ? phoneEl.value : "",
        email: emailEl ? emailEl.value : "",
        service: serviceEl ? serviceEl.value : "",
        message: msgEl ? msgEl.value : "",
        sourceUrl: window.location.pathname
      };
    }

    try {
      // Dynamically import lightweight modular SDKs on submission
      const { initializeApp } = await import("https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js");
      const { getFirestore, collection, addDoc, serverTimestamp } = await import("https://www.gstatic.com/firebasejs/10.8.0/firebase-firestore-lite.js");

      const app = initializeApp(firebaseConfig);
      const db = getFirestore(app);

      // Append server timestamp
      data.submittedAt = serverTimestamp();

      await addDoc(collection(db, collectionName), data);

      if (btn) {
        btn.disabled = false;
        btn.textContent = originalBtnText;
      }
      form.reset();

      if (isReview) {
        alert("Thank you for your feedback! It will be reviewed and published shortly.");
      } else if (isNewsletter) {
        alert("Thanks - you're on the list.");
      } else {
        alert("Thanks - we will be in touch shortly.");
      }
    } catch (error) {
      console.error("Firebase write error: ", error);
      if (btn) {
        btn.disabled = false;
        btn.textContent = originalBtnText;
      }
      alert("Thanks - we will be in touch shortly.");
      form.reset();
    }
  }

  function init() {
    initDrawer();
    initStickyCta();
    initSmoothScroll();
    initSal();
    setupFirebaseForms();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
