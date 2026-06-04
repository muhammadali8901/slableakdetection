# PowerShell script to inject conversion rate optimization (CRO) elements in all 23 service pages in services/ directory
$rootDir = "C:\Users\DELL\Desktop\slab-leak-detection\Slab Leak Detection website"
$servicesDir = Join-Path $rootDir "services"

$files = Get-ChildItem -Path $servicesDir -Filter "*.html"

foreach ($file in $files) {
    $filePath = $file.FullName
    $content = [System.IO.File]::ReadAllText($filePath)
    $updatedContent = $content
    
    # Calculate depth prefix (for files in services/ it is "../")
    $depthPrefix = "../"
    
    # 1. Define trust strip HTML
    $trustStripHtml = @"
    <section class="t6-trust-strip" aria-label="Why customers trust us" style="background:#fff;border-top:1px solid var(--t6-hairline);border-bottom:1px solid var(--t6-hairline);padding:1.5rem 0;">
      <div class="t6-container">
        <div class="t6-trust-strip__grid" style="display:grid;grid-template-columns:repeat(2,1fr);gap:1rem;">
          <div class="t6-trust-item" style="display:flex;align-items:center;gap:.75rem;">
            <span class="t6-trust-item__icon" style="width:40px;height:40px;border-radius:10px;background:var(--t6-green-soft);color:var(--t6-ink);display:flex;align-items:center;justify-content:center;flex-shrink:0;"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/></svg></span>
            <div>
              <div style="font-size:.72rem;color:var(--t6-muted);text-transform:uppercase;font-weight:600;letter-spacing:0.05em;">Licensed & Bonded</div>
              <div style="font-size:.95rem;font-weight:700;color:var(--t6-ink);">Daviess County Pros</div>
            </div>
          </div>
          <div class="t6-trust-item" style="display:flex;align-items:center;gap:.75rem;">
            <span class="t6-trust-item__icon" style="width:40px;height:40px;border-radius:10px;background:var(--t6-green-soft);color:var(--t6-ink);display:flex;align-items:center;justify-content:center;flex-shrink:0;"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg></span>
            <div>
              <div style="font-size:.72rem;color:var(--t6-muted);text-transform:uppercase;font-weight:600;letter-spacing:0.05em;">Fully Insured</div>
              <div style="font-size:.95rem;font-weight:700;color:var(--t6-ink);">Full Liability Coverage</div>
            </div>
          </div>
          <div class="t6-trust-item" style="display:flex;align-items:center;gap:.75rem;">
            <span class="t6-trust-item__icon" style="width:40px;height:40px;border-radius:10px;background:var(--t6-green-soft);color:var(--t6-ink);display:flex;align-items:center;justify-content:center;flex-shrink:0;"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg></span>
            <div>
              <div style="font-size:.72rem;color:var(--t6-muted);text-transform:uppercase;font-weight:600;letter-spacing:0.05em;">24/7 Response</div>
              <div style="font-size:.95rem;font-weight:700;color:var(--t6-ink);">Same-Day Service</div>
            </div>
          </div>
          <div class="t6-trust-item" style="display:flex;align-items:center;gap:.75rem;">
            <span class="t6-trust-item__icon" style="width:40px;height:40px;border-radius:10px;background:var(--t6-green-soft);color:var(--t6-ink);display:flex;align-items:center;justify-content:center;flex-shrink:0;"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 11.5a8.38 8.38 0 01-.9 3.8 8.5 8.5 0 01-7.6 4.7 8.38 8.38 0 01-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 01-.9-3.8 8.5 8.5 0 014.7-7.6 8.38 8.38 0 013.8-.9h.5a8.48 8.48 0 018 8v.5z"/></svg></span>
            <div>
              <div style="font-size:.72rem;color:var(--t6-muted);text-transform:uppercase;font-weight:600;letter-spacing:0.05em;">Work Warranty</div>
              <div style="font-size:.95rem;font-weight:700;color:var(--t6-ink);">10-Year Workmanship</div>
            </div>
          </div>
        </div>
      </div>
    </section>
"@

    # 2. Define quote form HTML
    $quoteFormHtml = @"
      <section class="t6-section t6-band-white" style="border-top: 1px solid var(--t6-hairline); padding: 4.5rem 0;">
        <div class="t6-container" style="max-width: 620px; margin: 0 auto;">
          <h2 style="text-align: center; margin-bottom: 0.5rem;">Request a Free Estimate</h2>
          <p class="t6-muted" style="text-align: center; margin-bottom: 2rem;">Need pricing? Contact us and a certified leak technician will contact you in under 15 minutes.</p>
          <form action="#" method="post" style="display:grid;gap:1.1rem;" onsubmit="event.preventDefault();alert('Thanks &mdash; we will be in touch shortly.');this.reset();">
            <div style="display:grid;gap:1.1rem;grid-template-columns:1fr 1fr;">
              <input class="t6-input" type="text" name="name" placeholder="Your name" required />
              <input class="t6-input" type="tel" name="phone" placeholder="Phone number" required />
            </div>
            <input class="t6-input" type="email" name="email" placeholder="Email address" />
            <textarea class="t6-textarea" name="message" rows="4" placeholder="Tell us about your leak issue (e.g., warm floor spot, wet yard, high bill)..." required></textarea>
            <button type="submit" class="t6-btn t6-btn-primary" style="width: 100%;">Submit Estimate Request</button>
          </form>
        </div>
      </section>
"@

    # 3. Inject trust strip right after header
    if ($updatedContent -match '</header>') {
        # Check if already has a trust strip to avoid double injection
        if (-not ($updatedContent.Contains('aria-label="Why customers trust us"'))) {
            $updatedContent = $updatedContent -replace '</header>', "</header>`n$trustStripHtml"
        }
    }
    
    # 4. Inject quote form right before bottom green CTA section
    if ($updatedContent -match '<section class="t6-band-green"') {
        if (-not ($updatedContent.Contains("Request a Free Estimate"))) {
            $updatedContent = $updatedContent -replace '<section class="t6-band-green"', ($quoteFormHtml + "`n      <section class=`"t6-band-green`"")
        }
    }
    
    # 5. Optimize hero buttons to emphasize phone call and conversion CTA
    $oldButtonsRegex = '(?s)<div style="display:flex;gap:1rem;flex-wrap:wrap;margin-top:1.5rem;">\s*<a href="tel:\+12702946900" class="t6-btn t6-btn-primary".*?>.*?</a>\s*<a href="(?:\.\./)?contact\.html" class="t6-btn t6-btn-ghost-on-ink".*?>.*?</a>\s*</div>'
    $newButtonsHtml = @"
            <div style="display:flex;gap:1rem;flex-wrap:wrap;margin-top:1.5rem;align-items:center;">
              <a href="tel:+12702946900" class="t6-btn t6-btn-primary" style="font-size:1.02rem;padding:1rem 1.85rem;">Call 24/7: +1 (270) 294-6900</a>
              <a href="${depthPrefix}contact.html" class="t6-btn t6-btn-ghost-on-ink" style="font-size:1rem;">Request a Free Estimate &rarr;</a>
            </div>
"@
    if ($updatedContent -match $oldButtonsRegex) {
        $updatedContent = [regex]::Replace($updatedContent, $oldButtonsRegex, $newButtonsHtml)
    }

    if ($updatedContent -ne $content) {
        [System.IO.File]::WriteAllText($filePath, $updatedContent)
        Write-Host "Injected CRO elements into: $($file.Name)" -ForegroundColor Green
    }
}
