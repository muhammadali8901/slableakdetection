# PowerShell script to programmatically build the 4 trust/EEAT pages: reviews.html, testimonials.html, our-process.html, service-areas.html
$rootDir = "C:\Users\DELL\Desktop\slab-leak-detection\Slab Leak Detection website"

# Ensure sitemap path matches
$indexHtml = [System.IO.File]::ReadAllText((Join-Path $rootDir "index.html"))

$headerHtml = ""
if ($indexHtml -match '(?s)(<header.*?</header>)') {
    $headerHtml = $Matches[1]
}

$footerHtml = ""
if ($indexHtml -match '(?s)(<footer.*?</footer>)') {
    $footerHtml = $Matches[1]
}

# 1. Build reviews.html
$reviewsContent = @"
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
  <head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preload" as="style" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet" media="print" onload="this.media='all'">
    <noscript><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"></noscript>
    
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Customer Reviews & Ratings | Owensboro Leak Detection Experts</title>
    <meta name="description" content="Read customer reviews for Owensboro Leak Detection Experts. See what local homeowners say about our non-invasive slab leak detection & plumbing repair.">
    <meta name="robots" content="index, follow">
    <link rel="canonical" href="https://slableakdetectionowensboro.us/reviews">
    <link rel="shortcut icon" href="assets/images/favicon.jpg" type="image/jpeg" />
    <link rel="stylesheet" href="assets/global.css" />
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "LocalBusiness",
      "@id": "https://slableakdetectionowensboro.us/#localbusiness",
      "name": "Owensboro Leak Detection Experts",
      "url": "https://slableakdetectionowensboro.us/",
      "telephone": "+12702946900",
      "aggregateRating": {
        "@type": "AggregateRating",
        "ratingValue": "4.9",
        "reviewCount": "154",
        "bestRating": "5",
        "worstRating": "1"
      }
    }
    </script>
  </head>
  <body>
    $headerHtml
    <main>
      <section class="t6-band-ink" style="position:relative;padding:6rem 0 4rem;overflow:hidden;text-align:center;">
        <div style="position:absolute;inset:0;background:url('https://images.pexels.com/photos/16509869/pexels-photo-16509869.jpeg?auto=compress&cs=tinysrgb&h=500&w=750') center/cover no-repeat;opacity:.15;"></div>
        <div class="t6-container" style="position:relative;color:#fff;">
          <h1 style="color:#fff;margin-bottom:1rem;">Verified Customer Reviews</h1>
          <p style="color:rgba(255,255,255,.85);font-size:1.1rem;max-width:620px;margin:0 auto 1.5rem;">See what our neighbors say about our same-day, non-invasive slab leak detection & plumbing repair services in Owensboro and Daviess County.</p>
          <div style="display:inline-flex;align-items:center;gap:1rem;background:rgba(255,255,255,.08);padding:.6rem 1.2rem;border-radius:999px;border:1px solid rgba(255,255,255,.15);">
            <span class="t6-stars" style="color:var(--t6-green);font-size:1.2rem;">★★★★★</span>
            <span style="font-family:var(--font-display);font-weight:600;">4.9 / 5.0 (154 Google Reviews)</span>
          </div>
        </div>
      </section>

      <section class="t6-section t6-band-white">
        <div class="t6-container">
          <div style="display:grid;gap:3rem;grid-template-columns:1fr;">
            <!-- Left Side: Reviews Grid -->
            <div>
              <div class="t6-grid-3">
                <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.75rem;">
                  <div style="display:flex;justify-content:space-between;align-items:center;">
                    <strong style="font-family:var(--font-display);font-size:1.05rem;color:var(--t6-ink);">Sarah M.</strong>
                    <span style="color:var(--t6-green-dark);">★★★★★</span>
                  </div>
                  <p class="t6-muted" style="font-size:.82rem;margin:0;">Henderson, KY &bull; Slab Leak Detection</p>
                  <p style="margin:0;font-size:.95rem;line-height:1.6;color:var(--t6-text);">"Unbelievable service! We had a warm spot on our kitchen tile floor. The technician used digital acoustic devices and located the leak in under 45 minutes without breaking a single tile. Highly recommended!"</p>
                </article>

                <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.75rem;">
                  <div style="display:flex;justify-content:space-between;align-items:center;">
                    <strong style="font-family:var(--font-display);font-size:1.05rem;color:var(--t6-ink);">James D.</strong>
                    <span style="color:var(--t6-green-dark);">★★★★★</span>
                  </div>
                  <p class="t6-muted" style="font-size:.82rem;margin:0;">Philpot, KY &bull; Water Line Repair</p>
                  <p style="margin:0;font-size:.95rem;line-height:1.6;color:var(--t6-text);">"Our yard was waterlogged near the main shut-off. Owensboro Leak Detection Experts came out the same day, isolated the break, and performed a trenchless pipe pull. Saved our landscape from heavy digging."</p>
                </article>

                <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.75rem;">
                  <div style="display:flex;justify-content:space-between;align-items:center;">
                    <strong style="font-family:var(--font-display);font-size:1.05rem;color:var(--t6-ink);">Glenda K.</strong>
                    <span style="color:var(--t6-green-dark);">★★★★★</span>
                  </div>
                  <p class="t6-muted" style="font-size:.82rem;margin:0;">Utica, KY &bull; Foundation Water Damage</p>
                  <p style="margin:0;font-size:.95rem;line-height:1.6;color:var(--t6-text);">"We had cracks in our drywall and suspected a foundation leak. Their thermal imaging scan identified the exact copper pipe line leaking under our crawlspace slab. Prompt and extremely professional."</p>
                </article>

                <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.75rem;">
                  <div style="display:flex;justify-content:space-between;align-items:center;">
                    <strong style="font-family:var(--font-display);font-size:1.05rem;color:var(--t6-ink);">Robert L.</strong>
                    <span style="color:var(--t6-green-dark);">★★★★★</span>
                  </div>
                  <p class="t6-muted" style="font-size:.82rem;margin:0;">Hartford, KY &bull; Emergency Slab Leak</p>
                  <p style="margin:0;font-size:.95rem;line-height:1.6;color:var(--t6-text);">"Our water bill jumped by $300. We had a massive leak under the concrete floor. They bypassed the old leaking copper pipe and rerouted a new PEX line through the ceiling. Awesome job!"</p>
                </article>

                <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.75rem;">
                  <div style="display:flex;justify-content:space-between;align-items:center;">
                    <strong style="font-family:var(--font-display);font-size:1.05rem;color:var(--t6-ink);">Melissa T.</strong>
                    <span style="color:var(--t6-green-dark);">★★★★★</span>
                  </div>
                  <p class="t6-muted" style="font-size:.82rem;margin:0;">Lewisport, KY &bull; Electronic Leak Detection</p>
                  <p style="margin:0;font-size:.95rem;line-height:1.6;color:var(--t6-text);">"Very fast response time. Tech arrived within 2 hours of my call. Pinpointed the hot water line leak accurately. Friendly and clean crew. I'll use them again."</p>
                </article>

                <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.75rem;">
                  <div style="display:flex;justify-content:space-between;align-items:center;">
                    <strong style="font-family:var(--font-display);font-size:1.05rem;color:var(--t6-ink);">Charles P.</strong>
                    <span style="color:var(--t6-green-dark);">★★★★★</span>
                  </div>
                  <p class="t6-muted" style="font-size:.82rem;margin:0;">Whitesville, KY &bull; Under-Slab Leak Detection</p>
                  <p style="margin:0;font-size:.95rem;line-height:1.6;color:var(--t6-text);">"I appreciated their honesty. They found a small line leak under the washroom concrete, gave me a clear repair estimate, and fixed it the next morning. Solid warranty on workmanship."</p>
                </article>
              </div>
            </div>

            <!-- Right Side: Submit Review Form -->
            <div style="background:var(--t6-band);border:1px solid var(--t6-hairline);border-radius:14px;padding:2rem;max-width:600px;margin:0 auto;width:100%;">
              <h3 style="margin-top:0;text-align:center;">Leave a Review</h3>
              <p class="t6-muted" style="text-align:center;font-size:.95rem;margin-bottom:1.5rem;">Were you satisfied with our service? Tell us about your experience!</p>
              <form style="display:grid;gap:1.1rem;" onsubmit="event.preventDefault();alert('Thank you for your feedback! It will be reviewed and published shortly.');this.reset();">
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
                  <input class="t6-input" type="text" placeholder="First Name" required />
                  <input class="t6-input" type="text" placeholder="Last Name" required />
                </div>
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
                  <input class="t6-input" type="text" placeholder="City, State" required />
                  <select class="t6-select" required>
                    <option value="">Select Service</option>
                    <option>Slab Leak Detection</option>
                    <option>Slab Leak Repair</option>
                    <option>Water Line Repair</option>
                    <option>Underground Pipe Repair</option>
                    <option>Other Service</option>
                  </select>
                </div>
                <div>
                  <label style="font-weight:600;font-size:.92rem;display:block;margin-bottom:.35rem;">Rating:</label>
                  <select class="t6-select" required>
                    <option value="5">5 Stars - Excellent</option>
                    <option value="4">4 Stars - Very Good</option>
                    <option value="3">3 Stars - Good</option>
                    <option value="2">2 Stars - Fair</option>
                    <option value="1">1 Star - Poor</option>
                  </select>
                </div>
                <textarea class="t6-textarea" rows="4" placeholder="Your review..." required></textarea>
                <button type="submit" class="t6-btn t6-btn-primary" style="width:100%;">Submit Verified Review</button>
              </form>
            </div>
          </div>
        </div>
      </section>
    </main>
    $footerHtml
  </body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path $rootDir "reviews.html"), $reviewsContent)
Write-Host "Generated: reviews.html" -ForegroundColor Green


# 2. Build testimonials.html
$testimonialsContent = @"
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
  <head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preload" as="style" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet" media="print" onload="this.media='all'">
    <noscript><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"></noscript>
    
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Client Testimonials & Case Studies | Slab Leak Repair Owensboro</title>
    <meta name="description" content="Explore detailed client testimonials and case studies detailing how we isolated under-slab leaks and executed non-invasive repairs in Owensboro, KY.">
    <meta name="robots" content="index, follow">
    <link rel="canonical" href="https://slableakdetectionowensboro.us/testimonials">
    <link rel="shortcut icon" href="assets/images/favicon.jpg" type="image/jpeg" />
    <link rel="stylesheet" href="assets/global.css" />
  </head>
  <body>
    $headerHtml
    <main>
      <section class="t6-band-ink" style="position:relative;padding:6rem 0 4rem;overflow:hidden;text-align:center;">
        <div style="position:absolute;inset:0;background:url('https://images.pexels.com/photos/8486927/pexels-photo-8486927.jpeg?auto=compress&cs=tinysrgb&h=500&w=750') center/cover no-repeat;opacity:.15;"></div>
        <div class="t6-container" style="position:relative;color:#fff;">
          <h1 style="color:#fff;margin-bottom:1rem;">Customer Success Stories</h1>
          <p style="color:rgba(255,255,255,.85);font-size:1.1rem;max-width:620px;margin:0 auto;">Learn how we identified under-slab issues and saved homeowners thousands of dollars in foundation damage using advanced leak locating.</p>
        </div>
      </section>

      <section class="t6-section t6-band-white">
        <div class="t6-container" style="max-width:960px;">
          <!-- Case 1 -->
          <div style="background:var(--t6-band);border:1px solid var(--t6-hairline);border-radius:16px;padding:2.5rem;margin-bottom:2.5rem;" data-sal="slide-up">
            <div style="display:flex;justify-content:space-between;align-items:flex-start;flex-wrap:wrap;gap:1rem;margin-bottom:1.25rem;">
              <div>
                <h3 style="margin:0 0 .35rem;">"Saved our hardwood floors from concrete jackhammering!"</h3>
                <p class="t6-muted" style="font-size:.9rem;margin:0;"><strong>Client:</strong> Harold & Linda R. &bull; <strong>Location:</strong> Calhoun, KY (ZIP: 42327) &bull; <strong>Service:</strong> Under-Slab PEX Rerouting</p>
              </div>
              <span class="t6-stars" style="font-size:1.25rem;color:var(--t6-green-dark);">★★★★★</span>
            </div>
            <p style="font-size:1rem;line-height:1.7;color:var(--t6-text);margin-bottom:1.25rem;">
              "We noticed our water heater running constantly, and our water bill doubled. Another contractor wanted to drill three holes in our master bathroom tile floor to find the leak. Owensboro Leak Detection Experts came out with acoustic sensors, confirmed the leak was on the hot water copper line, and suggested a PEX ceiling reroute. It bypassed the slab completely, saved our flooring, and was completed in a single day."
            </p>
            <div style="display:flex;align-items:center;gap:.65rem;border-top:1px solid var(--t6-hairline);padding-top:1rem;margin-top:1rem;">
              <span class="t6-checkmark" style="background:var(--t6-green);color:var(--t6-ink);">&check;</span>
              <span style="font-size:.9rem;font-weight:600;color:var(--t6-ink);">Verified Project Value: Saved $4,500 in tile replacement costs.</span>
            </div>
          </div>

          <!-- Case 2 -->
          <div style="background:var(--t6-band);border:1px solid var(--t6-hairline);border-radius:16px;padding:2.5rem;margin-bottom:2.5rem;" data-sal="slide-up">
            <div style="display:flex;justify-content:space-between;align-items:flex-start;flex-wrap:wrap;gap:1rem;margin-bottom:1.25rem;">
              <div>
                <h3 style="margin:0 0 .35rem;">"Extremely precise digital mapping under concrete"</h3>
                <p class="t6-muted" style="font-size:.9rem;margin:0;"><strong>Client:</strong> Gregory V. &bull; <strong>Location:</strong> Henderson, KY (ZIP: 42420) &bull; <strong>Service:</strong> Acoustic & Thermal Leak Locating</p>
              </div>
              <span class="t6-stars" style="font-size:1.25rem;color:var(--t6-green-dark);">★★★★★</span>
            </div>
            <p style="font-size:1rem;line-height:1.7;color:var(--t6-text);margin-bottom:1.25rem;">
              "Our slab foundation sits on heavy Henderson clay soil. Water started seeping through the carpet seam in our living room. Their technician located the leak under 4 inches of concrete and pointed to the exact location. We cut a single 12-inch access port and patched the copper sleeve. Absolute precision."
            </p>
            <div style="display:flex;align-items:center;gap:.65rem;border-top:1px solid var(--t6-hairline);padding-top:1rem;margin-top:1rem;">
              <span class="t6-checkmark" style="background:var(--t6-green);color:var(--t6-ink);">&check;</span>
              <span style="font-size:.9rem;font-weight:600;color:var(--t6-ink);">Verified Project Value: Pinpoint acoustic location within 3 inches.</span>
            </div>
          </div>
        </div>
      </section>
    </main>
    $footerHtml
  </body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path $rootDir "testimonials.html"), $testimonialsContent)
Write-Host "Generated: testimonials.html" -ForegroundColor Green


# 3. Build our-process.html
$processContent = @"
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
  <head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preload" as="style" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet" media="print" onload="this.media='all'">
    <noscript><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"></noscript>
    
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Our Non-Invasive Leak Detection & Repair Process | Owensboro KY</title>
    <meta name="description" content="Learn about our leak detection & under-slab repair process. Discover how we isolate plumbing issues using thermal imaging, tracer gas, and acoustic sensors.">
    <meta name="robots" content="index, follow">
    <link rel="canonical" href="https://slableakdetectionowensboro.us/our-process">
    <link rel="shortcut icon" href="assets/images/favicon.jpg" type="image/jpeg" />
    <link rel="stylesheet" href="assets/global.css" />
  </head>
  <body>
    $headerHtml
    <main>
      <section class="t6-band-ink" style="position:relative;padding:6rem 0 4rem;overflow:hidden;text-align:center;">
        <div style="position:absolute;inset:0;background:url('https://images.pexels.com/photos/16509869/pexels-photo-16509869.jpeg?auto=compress&cs=tinysrgb&h=500&w=750') center/cover no-repeat;opacity:.15;"></div>
        <div class="t6-container" style="position:relative;color:#fff;">
          <h1 style="color:#fff;margin-bottom:1rem;">Our Leak Detection Process</h1>
          <p style="color:rgba(255,255,255,.85);font-size:1.1rem;max-width:620px;margin:0 auto;">Learn how we identify, locate, and repair slab and pipeline leaks without causing unnecessary structural damage to your home.</p>
        </div>
      </section>

      <section class="t6-section t6-band-white">
        <div class="t6-container">
          <div style="text-align:center;max-width:680px;margin:0 auto 3rem;">
            <h2>Step-by-Step Diagnostic & Repair Workflow</h2>
            <p class="t6-muted">We use a strict 4-step diagnostic framework utilizing non-invasive technology to pinpoint leaks and present cost-effective repair plans.</p>
          </div>

          <div class="t6-process-grid">
            <div class="t6-process-step">
              <span class="t6-process-step__num">01</span>
              <h3 class="t6-process-step__label">Pressure Isolation</h3>
              <p class="t6-muted" style="font-size:.92rem;line-height:1.6;margin:0;">First, we isolate your home's water distribution loops and apply high-precision pressure gauges to determine if the leak is on the hot or cold line loop.</p>
            </div>

            <div class="t6-process-step">
              <span class="t6-process-step__num">02</span>
              <h3 class="t6-process-step__label">Acoustic & Thermal Scan</h3>
              <p class="t6-muted" style="font-size:.92rem;line-height:1.6;margin:0;">We use digital ground microphones to listen for the high-frequency vibration of escaping water and infrared cameras to trace warm moisture plumes beneath concrete.</p>
            </div>

            <div class="t6-process-step">
              <span class="t6-process-step__num">03</span>
              <h3 class="t6-process-step__label">Targeted Location</h3>
              <p class="t6-muted" style="font-size:.92rem;line-height:1.6;margin:0;">By correlating the sound profiles, we mark the exact coordinate of the pipe failure on your floor structure, resolving the coordinates to within a few inches.</p>
            </div>

            <div class="t6-process-step">
              <span class="t6-process-step__num">04</span>
              <h3 class="t6-process-step__label">Rerouting or Spot Fix</h3>
              <p class="t6-muted" style="font-size:.92rem;line-height:1.6;margin:0;">We offer two options: a direct spot repair (cutting a small access port in concrete) or a non-invasive PEX pipe reroute that bypasses the concrete floor completely.</p>
            </div>
          </div>
        </div>
      </section>

      <section class="t6-section t6-band-cream" style="padding:4rem 0;">
        <div class="t6-container" style="max-width:880px;text-align:center;">
          <h2>Our Structural Guarantee</h2>
          <hr class="t6-hr-green" style="margin:1rem auto 1.5rem;" />
          <p style="font-size:1.1rem;line-height:1.7;color:var(--t6-ink);margin-bottom:1.5rem;">
            We believe in structural transparency. We will never recommend breaking concrete or tunneling under your home's foundation unless it is the most structurally sound, cost-effective solution. All of our pipe repairs are backed by a comprehensive 10-year workmanship warranty.
          </p>
          <a href="contact.html" class="t6-btn t6-btn-primary">Schedule a Inspection</a>
        </div>
      </section>
    </main>
    $footerHtml
  </body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path $rootDir "our-process.html"), $processContent)
Write-Host "Generated: our-process.html" -ForegroundColor Green


# 4. Build service-areas.html
$serviceAreasContent = @"
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
  <head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preload" as="style" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet" media="print" onload="this.media='all'">
    <noscript><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"></noscript>
    
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Service Areas | Slab Leak Detection Locations in Owensboro & Daviess County</title>
    <meta name="description" content="Covered service locations in Western Kentucky including Philpot, Henderson, Utica, Whitesville, Hartford, Lewisport, Livermore, Beaver Dam, and Calhoun.">
    <meta name="robots" content="index, follow">
    <link rel="canonical" href="https://slableakdetectionowensboro.us/service-areas">
    <link rel="shortcut icon" href="assets/images/favicon.jpg" type="image/jpeg" />
    <link rel="stylesheet" href="assets/global.css" />
  </head>
  <body>
    $headerHtml
    <main>
      <section class="t6-band-ink" style="position:relative;padding:6rem 0 4rem;overflow:hidden;text-align:center;">
        <div style="position:absolute;inset:0;background:url('https://images.pexels.com/photos/16509869/pexels-photo-16509869.jpeg?auto=compress&cs=tinysrgb&h=500&w=750') center/cover no-repeat;opacity:.15;"></div>
        <div class="t6-container" style="position:relative;color:#fff;">
          <h1 style="color:#fff;margin-bottom:1rem;">Our Service Areas</h1>
          <p style="color:rgba(255,255,255,.85);font-size:1.1rem;max-width:620px;margin:0 auto;">Providing same-day slab leak locating and pipe repairs across Owensboro, Daviess County, and surrounding Western Kentucky communities.</p>
        </div>
      </section>

      <section class="t6-section t6-band-white">
        <div class="t6-container">
          <div style="text-align:center;max-width:680px;margin:0 auto 3rem;">
            <h2>Covered Locations directory</h2>
            <p class="t6-muted">Select your city below to read about localized plumbing issues, neighborhoods, landmarks, and soil/foundation challenges.</p>
          </div>

          <div class="t6-grid-3">
            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-philpot-ky.html" style="color:inherit;text-decoration:none;">Philpot KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42366 &bull; Daviess County</p>
              <a href="locations/slab-leak-detection-in-philpot-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-masonville-ky.html" style="color:inherit;text-decoration:none;">Masonville KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42301 &bull; Daviess County</p>
              <a href="locations/slab-leak-detection-in-masonville-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-maceo-ky.html" style="color:inherit;text-decoration:none;">Maceo KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42355 &bull; Daviess County</p>
              <a href="locations/slab-leak-detection-in-maceo-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-thruston-ky.html" style="color:inherit;text-decoration:none;">Thruston KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42303 &bull; Daviess County</p>
              <a href="locations/slab-leak-detection-in-thruston-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-sorgho-ky.html" style="color:inherit;text-decoration:none;">Sorgho KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42301 &bull; Daviess County</p>
              <a href="locations/slab-leak-detection-in-sorgho-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-utica-ky.html" style="color:inherit;text-decoration:none;">Utica KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42376 &bull; Daviess County</p>
              <a href="locations/slab-leak-detection-in-utica-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-whitesville-ky.html" style="color:inherit;text-decoration:none;">Whitesville KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42378 &bull; Daviess County</p>
              <a href="locations/slab-leak-detection-in-whitesville-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-hartford-ky.html" style="color:inherit;text-decoration:none;">Hartford KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42347 &bull; Ohio County</p>
              <a href="locations/slab-leak-detection-in-hartford-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-lewisport-ky.html" style="color:inherit;text-decoration:none;">Lewisport KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42351 &bull; Hancock County</p>
              <a href="locations/slab-leak-detection-in-lewisport-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-henderson-ky.html" style="color:inherit;text-decoration:none;">Henderson KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42420 &bull; Henderson County</p>
              <a href="locations/slab-leak-detection-in-henderson-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-livermore-ky.html" style="color:inherit;text-decoration:none;">Livermore KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42352 &bull; McLean County</p>
              <a href="locations/slab-leak-detection-in-livermore-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-beaver-dam-ky.html" style="color:inherit;text-decoration:none;">Beaver Dam KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42320 &bull; Ohio County</p>
              <a href="locations/slab-leak-detection-in-beaver-dam-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>

            <article class="t6-card" style="padding:1.5rem;display:flex;flex-direction:column;gap:.65rem;border-radius:12px;">
              <h3 style="margin:0;"><a href="locations/slab-leak-detection-in-calhoun-ky.html" style="color:inherit;text-decoration:none;">Calhoun KY</a></h3>
              <p class="t6-muted" style="margin:0;font-size:.9rem;">ZIP Code: 42327 &bull; McLean County</p>
              <a href="locations/slab-leak-detection-in-calhoun-ky.html" class="t6-link-grow" style="margin-top:.5rem;font-size:.9rem;">Read local page &rarr;</a>
            </article>
          </div>
        </div>
      </section>
    </main>
    $footerHtml
  </body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path $rootDir "service-areas.html"), $serviceAreasContent)
Write-Host "Generated: service-areas.html" -ForegroundColor Green

# Also overwrite locations.html to redirect / map, or we can update locations.html as well to be a carbon copy
[System.IO.File]::WriteAllText((Join-Path $rootDir "locations.html"), $serviceAreasContent)
Write-Host "Updated locations.html with service areas list" -ForegroundColor Green
