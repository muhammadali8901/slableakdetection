# PowerShell script to rebuild sitemap.xml with all root pages, service pages, and location pages
$rootDir = "C:\Users\DELL\Desktop\slab-leak-detection\Slab Leak Detection website"
$sitemapPath = Join-Path $rootDir "sitemap.xml"
$today = "2026-06-04"

$xml = @"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
        <loc>https://slableakdetectionowensboro.us/</loc>
        <lastmod>$today</lastmod>
        <changefreq>monthly</changefreq>
        <priority>1.0</priority>
    </url>
"@

# Define root pages (excluding index, locations which canonicals to service-areas, and search/etc)
$rootPages = @(
    @{ path = "about"; priority = "0.8"; freq = "monthly" },
    @{ path = "contact"; priority = "0.8"; freq = "monthly" },
    @{ path = "services"; priority = "0.8"; freq = "monthly" },
    @{ path = "service-areas"; priority = "0.8"; freq = "monthly" },
    @{ path = "our-process"; priority = "0.8"; freq = "monthly" },
    @{ path = "testimonials"; priority = "0.8"; freq = "monthly" },
    @{ path = "reviews"; priority = "0.8"; freq = "monthly" },
    @{ path = "privacy-policy"; priority = "0.3"; freq = "yearly" }
)

foreach ($page in $rootPages) {
    $path = $page.path
    $pri = $page.priority
    $freq = $page.freq
    $xml += @"

    <url>
        <loc>https://slableakdetectionowensboro.us/$path</loc>
        <lastmod>$today</lastmod>
        <changefreq>$freq</changefreq>
        <priority>$pri</priority>
    </url>
"@
}

# Scan services directory
$servicesDir = Join-Path $rootDir "services"
$services = Get-ChildItem -Path $servicesDir -Filter "*.html" | Sort-Object Name
foreach ($svc in $services) {
    $nameWithoutExt = $svc.BaseName
    $xml += @"

    <url>
        <loc>https://slableakdetectionowensboro.us/services/$nameWithoutExt</loc>
        <lastmod>$today</lastmod>
        <changefreq>monthly</changefreq>
        <priority>0.9</priority>
    </url>
"@
}

# Scan locations directory
$locationsDir = Join-Path $rootDir "locations"
$locations = Get-ChildItem -Path $locationsDir -Filter "*.html" | Sort-Object Name
foreach ($loc in $locations) {
    $nameWithoutExt = $loc.BaseName
    $xml += @"

    <url>
        <loc>https://slableakdetectionowensboro.us/locations/$nameWithoutExt</loc>
        <lastmod>$today</lastmod>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
"@
}

$xml += "`n</urlset>`n"

[System.IO.File]::WriteAllText($sitemapPath, $xml)
Write-Host "Rebuilt sitemap.xml successfully with all 45+ clean URLs." -ForegroundColor Green
