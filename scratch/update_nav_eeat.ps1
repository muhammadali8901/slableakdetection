# PowerShell script to update navigation in all 49 HTML files to include reviews, testimonials, our-process, and service-areas links
$rootDir = "C:\Users\DELL\Desktop\slab-leak-detection\Slab Leak Detection website"

# 1. Define location link items for dropdown
$locationsList = @(
    @{ City = "Philpot KY"; Path = "locations/slab-leak-detection-in-philpot-ky.html" },
    @{ City = "Masonville KY"; Path = "locations/slab-leak-detection-in-masonville-ky.html" },
    @{ City = "Maceo KY"; Path = "locations/slab-leak-detection-in-maceo-ky.html" },
    @{ City = "Thruston KY"; Path = "locations/slab-leak-detection-in-thruston-ky.html" },
    @{ City = "Sorgho KY"; Path = "locations/slab-leak-detection-in-sorgho-ky.html" },
    @{ City = "Utica KY"; Path = "locations/slab-leak-detection-in-utica-ky.html" },
    @{ City = "Whitesville KY"; Path = "locations/slab-leak-detection-in-whitesville-ky.html" },
    @{ City = "Hartford KY"; Path = "locations/slab-leak-detection-in-hartford-ky.html" },
    @{ City = "Lewisport KY"; Path = "locations/slab-leak-detection-in-lewisport-ky.html" },
    @{ City = "Henderson KY"; Path = "locations/slab-leak-detection-in-henderson-ky.html" },
    @{ City = "Livermore KY"; Path = "locations/slab-leak-detection-in-livermore-ky.html" },
    @{ City = "Beaver Dam KY"; Path = "locations/slab-leak-detection-in-beaver-dam-ky.html" },
    @{ City = "Calhoun KY"; Path = "locations/slab-leak-detection-in-calhoun-ky.html" }
)

# Define service link items for dropdown
$servicesList = @(
    @{ Title = "Slab Leak Detection"; Path = "services/slab-leak-detection.html" },
    @{ Title = "Slab Leak Repair"; Path = "services/slab-leak-repair.html" },
    @{ Title = "Electronic Leak Detection"; Path = "services/electronic-leak-detection.html" },
    @{ Title = "Infrared Leak Detection"; Path = "services/infrared-leak-detection.html" },
    @{ Title = "Acoustic Leak Detection"; Path = "services/acoustic-leak-detection.html" },
    @{ Title = "Underground Pipe Leak Detection"; Path = "services/underground-pipe-leak-detection.html" },
    @{ Title = "Water Line Leak Detection"; Path = "services/water-line-leak-detection.html" },
    @{ Title = "Hot Water Line Leak Detection"; Path = "services/hot-water-line-leak-detection.html" },
    @{ Title = "Cold Water Line Leak Detection"; Path = "services/cold-water-line-leak-detection.html" },
    @{ Title = "Emergency Slab Leak Detection"; Path = "services/emergency-slab-leak-detection.html" },
    @{ Title = "Water Line Repair"; Path = "services/water-line-repair.html" },
    @{ Title = "Underground Pipe Repair"; Path = "services/underground-pipe-repair.html" },
    @{ Title = "Foundation Leak Repair"; Path = "services/foundation-leak-repair.html" },
    @{ Title = "Pipe Rerouting"; Path = "services/pipe-rerouting.html" },
    @{ Title = "Burst Pipe Repair"; Path = "services/burst-pipe-repair.html" },
    @{ Title = "Emergency Leak Repair"; Path = "services/emergency-leak-repair.html" },
    @{ Title = "Water Leak Detection"; Path = "services/water-leak-detection.html" },
    @{ Title = "Water Leak Repair"; Path = "services/water-leak-repair.html" },
    @{ Title = "Hidden Water Leaks"; Path = "services/hidden-water-leaks.html" },
    @{ Title = "Water Meter Leak Testing"; Path = "services/water-meter-leak-testing.html" },
    @{ Title = "Sewer Leak Detection"; Path = "services/sewer-leak-detection.html" },
    @{ Title = "Foundation Water Damage"; Path = "services/foundation-water-damage.html" },
    @{ Title = "Slab Foundation Problems"; Path = "services/slab-foundation-problems.html" }
)

Get-ChildItem -Path $rootDir -Recurse -Filter "*.html" | ForEach-Object {
    $file = $_.FullName
    $relative = $file.Substring($rootDir.Length + 1)
    
    # Calculate depth prefix
    $depthPrefix = ""
    if ($relative -match '^(locations|services|faq)\\') {
        $depthPrefix = "../"
    }
    
    $content = [System.IO.File]::ReadAllText($file)
    
    # Build desktop locations dropdown items
    $locItemsHtml = ""
    foreach ($loc in $locationsList) {
        $locItemsHtml += @"
        <a href="${depthPrefix}$($loc.Path)" class="t6-nav-panel-item" style="padding: 0.55rem 0.75rem;">
          <span class="t6-nav-panel-icon"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/><circle cx="12" cy="10" r="3"/></svg></span>
          <span class="t6-nav-panel-text">
            <span class="t6-nav-panel-title" style="font-size:0.88rem;">$($loc.City)</span>
          </span>
        </a>
"@
    }
    
    # Build desktop services dropdown items
    $serItemsHtml = ""
    foreach ($ser in $servicesList) {
        $serItemsHtml += @"
        <a href="${depthPrefix}$($ser.Path)" class="t6-nav-panel-item" style="padding: 0.55rem 0.75rem;">
          <span class="t6-nav-panel-icon"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14.7 6.3a1 1 0 000 1.4l1.6 1.6a1 1 0 001.4 0l3.77-3.77a6 6 0 01-7.94 7.94l-6.91 6.91a2.12 2.12 0 01-3-3l6.91-6.91a6 6 0 017.94-7.94l-3.76 3.76z"/></svg></span>
          <span class="t6-nav-panel-text">
            <span class="t6-nav-panel-title" style="font-size:0.88rem;">$($ser.Title)</span>
          </span>
        </a>
"@
    }
    
    # 2. Build desktop header primary navigation
    $newNavDesktopHtml = @"
    <nav aria-label="Primary" class="t6-nav-desktop">
      <a href="${depthPrefix}" class="t6-nav-link">Home</a>
      <a href="${depthPrefix}about.html" class="t6-nav-link">About</a>
      <div class="t6-nav-dropdown">
        <a href="${depthPrefix}services.html" class="t6-nav-link" aria-haspopup="true">Services <svg class="t6-nav-chevron" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9l6 6 6-6"/></svg></a>
        <div class="t6-nav-panel" style="width: 580px;">
          <div class="t6-nav-panel-grid">
            $serItemsHtml
          </div>
          <a href="${depthPrefix}services.html" class="t6-nav-panel-all">View all services &rarr;</a>
        </div>
      </div>
      <div class="t6-nav-dropdown">
        <a href="${depthPrefix}service-areas.html" class="t6-nav-link" aria-haspopup="true">Service Areas <svg class="t6-nav-chevron" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9l6 6 6-6"/></svg></a>
        <div class="t6-nav-panel" style="width: 540px;">
          <div class="t6-nav-panel-grid">
            $locItemsHtml
          </div>
          <a href="${depthPrefix}service-areas.html" class="t6-nav-panel-all">View all service areas &rarr;</a>
        </div>
      </div>
      <div class="t6-nav-dropdown">
        <a class="t6-nav-link" aria-haspopup="true" style="cursor:pointer;">Why Choose Us <svg class="t6-nav-chevron" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9l6 6 6-6"/></svg></a>
        <div class="t6-nav-panel" style="width: 250px; padding: 0.75rem;">
          <div style="display:flex;flex-direction:column;gap:0.3rem;">
            <a href="${depthPrefix}our-process.html" class="t6-nav-panel-item" style="padding: 0.55rem 0.75rem;">
              <span class="t6-nav-panel-text"><span class="t6-nav-panel-title" style="font-size:0.88rem;">Our Process</span></span>
            </a>
            <a href="${depthPrefix}testimonials.html" class="t6-nav-panel-item" style="padding: 0.55rem 0.75rem;">
              <span class="t6-nav-panel-text"><span class="t6-nav-panel-title" style="font-size:0.88rem;">Testimonials</span></span>
            </a>
            <a href="${depthPrefix}reviews.html" class="t6-nav-panel-item" style="padding: 0.55rem 0.75rem;">
              <span class="t6-nav-panel-text"><span class="t6-nav-panel-title" style="font-size:0.88rem;">Reviews</span></span>
            </a>
          </div>
        </div>
      </div>
      <a href="${depthPrefix}contact.html" class="t6-nav-link">Contact</a>
    </nav>
"@

    # 3. Build mobile drawer html
    $drawerLocListHtml = ""
    foreach ($loc in $locationsList) {
        $drawerLocListHtml += "<li><a href=`"${depthPrefix}$($loc.Path)`" class=`"t6-link-grow t6-link-grow--on-ink`">$($loc.City)</a></li>"
    }
    
    $drawerSerListHtml = ""
    foreach ($ser in $servicesList) {
        $drawerSerListHtml += "<li><a href=`"${depthPrefix}$($ser.Path)`" class=`"t6-link-grow t6-link-grow--on-ink`">$($ser.Title)</a></li>"
    }

    $newDrawerHtml = @"
  <div id="t6Drawer" class="t6-drawer" style="background:var(--t6-ink);border-top:1px solid rgba(255,255,255,.1);">
    <div class="t6-container" style="padding:1.25rem 1.5rem 1.75rem;">
      <ul style="list-style:none;padding:0;margin:0;display:flex;flex-direction:column;gap:.6rem;font-family:var(--font-body);font-weight:500;font-size:1rem;">
        <li><a href="${depthPrefix}" style="color:#fff;text-decoration:none;display:block;padding:.55rem 0;border-bottom:1px solid rgba(255,255,255,.08);">Home</a></li>
        <li><a href="${depthPrefix}about.html" style="color:#fff;text-decoration:none;display:block;padding:.55rem 0;border-bottom:1px solid rgba(255,255,255,.08);">About</a></li>
        <li><a href="${depthPrefix}services.html" style="color:#fff;text-decoration:none;display:block;padding:.55rem 0;border-bottom:1px solid rgba(255,255,255,.08);">Services</a></li>
        <li><a href="${depthPrefix}service-areas.html" style="color:#fff;text-decoration:none;display:block;padding:.55rem 0;border-bottom:1px solid rgba(255,255,255,.08);">Service Areas</a></li>
        <li><a href="${depthPrefix}our-process.html" style="color:#fff;text-decoration:none;display:block;padding:.55rem 0;border-bottom:1px solid rgba(255,255,255,.08);">Our Process</a></li>
        <li><a href="${depthPrefix}testimonials.html" style="color:#fff;text-decoration:none;display:block;padding:.55rem 0;border-bottom:1px solid rgba(255,255,255,.08);">Testimonials</a></li>
        <li><a href="${depthPrefix}reviews.html" style="color:#fff;text-decoration:none;display:block;padding:.55rem 0;border-bottom:1px solid rgba(255,255,255,.08);">Reviews</a></li>
        <li><a href="${depthPrefix}contact.html" style="color:#fff;text-decoration:none;display:block;padding:.55rem 0;border-bottom:1px solid rgba(255,255,255,.08);">Contact</a></li>
      </ul>
      <details style="margin-top:1.25rem;color:#fff;"><summary style="font-family:var(--font-display);cursor:pointer;font-weight:600;">Browse Services</summary><ul style="list-style:none;padding:.6rem 0 0;margin:0;display:grid;grid-template-columns:1fr 1fr;gap:.4rem .8rem;color:rgba(255,255,255,.85);">$drawerSerListHtml</ul></details>
      <details style="margin-top:1rem;color:#fff;"><summary style="font-family:var(--font-display);cursor:pointer;font-weight:600;">Service Areas</summary><ul style="list-style:none;padding:.6rem 0 0;margin:0;display:grid;grid-template-columns:1fr 1fr;gap:.4rem .8rem;color:rgba(255,255,255,.85);">$drawerLocListHtml</ul></details>
      <a href="tel:+12702946900" class="t6-btn t6-btn-primary" style="margin-top:1.5rem;width:100%;">Call +12702946900</a>
    </div>
  </div>
"@

    # 4. Build footer quick links html
    $newFooterQuickLinksHtml = @"
        <h4 style="color:#fff;font-family:var(--font-display);font-weight:600;font-size:1rem;margin-bottom:1rem;">Quick Links</h4>
        <hr class="t6-hr-green" style="margin:0 0 1rem;" />
        <ul style="list-style:none;margin:0;padding:0;display:flex;flex-direction:column;gap:.5rem;font-size:.92rem;">
          <li><a href="${depthPrefix}about.html" style="color:rgba(255,255,255,.85);text-decoration:none;">About Us</a></li>
          <li><a href="${depthPrefix}service-areas.html" style="color:rgba(255,255,255,.85);text-decoration:none;">Service Areas</a></li>
          <li><a href="${depthPrefix}our-process.html" style="color:rgba(255,255,255,.85);text-decoration:none;">Our Process</a></li>
          <li><a href="${depthPrefix}testimonials.html" style="color:rgba(255,255,255,.85);text-decoration:none;">Testimonials</a></li>
          <li><a href="${depthPrefix}reviews.html" style="color:rgba(255,255,255,.85);text-decoration:none;">Reviews</a></li>
          <li><a href="${depthPrefix}privacy-policy.html" style="color:rgba(255,255,255,.85);text-decoration:none;">Privacy Policy</a></li>
        </ul>
"@

    # Apply modifications to code contents
    $updatedContent = $content

    # Match & replace desktop primary navigation block
    $navRegex = '(?s)<nav aria-label="Primary" class="t6-nav-desktop">.*?</nav>'
    if ($updatedContent -match $navRegex) {
        $updatedContent = [regex]::Replace($updatedContent, $navRegex, $newNavDesktopHtml)
    }

    # Match & replace mobile drawer block
    $drawerRegex = '(?s)<div id="t6Drawer" class="t6-drawer".*?</div>\s*</div>'
    if ($updatedContent -match $drawerRegex) {
        $updatedContent = [regex]::Replace($updatedContent, $drawerRegex, $newDrawerHtml)
    }

    # Match & replace footer Quick Links section
    # Matches: <h4 style="color:#fff;font-family:var(--font-display);font-weight:600;font-size:1rem;margin-bottom:1rem;">Quick Links</h4>...</ul>
    $footerRegex = '(?s)<h4 style="color:#fff;font-family:var\(--font-display\);font-weight:600;font-size:1rem;margin-bottom:1rem;">Quick Links</h4>.*?</ul>'
    if ($updatedContent -match $footerRegex) {
        $updatedContent = [regex]::Replace($updatedContent, $footerRegex, $newFooterQuickLinksHtml)
    }

    # If it is a root level link like home, replace the logo href properly
    $replaceVal = 'href="' + $depthPrefix + '"'
    $updatedContent = $updatedContent -replace 'href="/index.html"', $replaceVal
    
    if ($updatedContent -ne $content) {
        [System.IO.File]::WriteAllText($file, $updatedContent)
        Write-Host "Updated Navigation in: $relative" -ForegroundColor Green
    }
}
