# PowerShell script to transform Service schemas containing review/aggregateRating into valid JSON-LD arrays
$rootDir = "C:\Users\DELL\Desktop\slab-leak-detection\Slab Leak Detection website"
$servicesDir = Join-Path $rootDir "services"

$files = Get-ChildItem -Path $servicesDir -Filter "*.html"

foreach ($file in $files) {
    $filePath = $file.FullName
    $content = [System.IO.File]::ReadAllText($filePath)
    
    # Match all <script type="application/ld+json">...</script> blocks
    $matches = [regex]::Matches($content, '(?s)<script\s+type="application/ld\+json">(.*?)</script>')
    
    $modified = $false
    $updatedContent = $content
    
    foreach ($m in $matches) {
        $fullBlock = $m.Value
        $jsonText = $m.Groups[1].Value.Trim()
        
        # We only want to transform the block if it contains "@type": "Service" and "aggregateRating"
        if ($jsonText -like '*"@type": "Service"*' -and $jsonText -like '*"aggregateRating"*') {
            try {
                $json = ConvertFrom-Json $jsonText -ErrorAction Stop
                
                # Check if it has aggregateRating
                if ($null -ne $json.aggregateRating) {
                    Write-Host "Found target schema block in $($file.Name)" -ForegroundColor Cyan
                    
                    # 1. Build LocalBusiness schema
                    $localBusiness = [ordered]@{
                        "@context" = "https://schema.org"
                        "@type" = "LocalBusiness"
                        "@id" = "https://slableakdetectionowensboro.us/#localbusiness"
                        "name" = "Owensboro Leak Detection Experts"
                        "url" = "https://slableakdetectionowensboro.us/"
                        "telephone" = "+12702946900"
                        "logo" = "https://slableakdetectionowensboro.us/assets/images/logo-slableakdetection.jpg"
                        "image" = "https://slableakdetectionowensboro.us/assets/images/logo-slableakdetection.jpg"
                        "address" = [ordered]@{
                            "@type" = "PostalAddress"
                            "streetAddress" = "PRWQ+8H8 Owensboro, Kentucky, USA, Owensboro, KY"
                            "addressLocality" = "Owensboro"
                            "postalCode" = "42301"
                            "addressCountry" = "US"
                        }
                        "geo" = [ordered]@{
                            "@type" = "GeoCoordinates"
                            "latitude" = "37.7742"
                            "longitude" = "-87.1130"
                        }
                        "aggregateRating" = $json.aggregateRating
                        "review" = $json.review
                    }
                    
                    # 2. Build clean Service schema
                    $service = [ordered]@{
                        "@context" = "https://schema.org"
                        "@type" = "Service"
                        "@id" = $json."@id"
                        "name" = $json.name
                        "url" = $json.url
                        "provider" = [ordered]@{
                            "@type" = "LocalBusiness"
                            "@id" = "https://slableakdetectionowensboro.us/#localbusiness"
                        }
                        "areaServed" = $json.areaServed
                        "offers" = $json.offers
                    }
                    
                    # 3. Create JSON-LD array containing both
                    $newJsonArray = @($localBusiness, $service)
                    
                    # Convert to JSON with pretty formatting
                    $newJsonText = ConvertTo-Json -InputObject $newJsonArray -Depth 100
                    
                    # Wrap in script tags
                    $newFullBlock = "<script type=`"application/ld+json`">`n$newJsonText`n</script>"
                    
                    # Replace in the updated content
                    $updatedContent = $updatedContent.Replace($fullBlock, $newFullBlock)
                    $modified = $true
                }
            } catch {
                Write-Host "Error parsing JSON in $($file.Name): $($_.Exception.Message)" -ForegroundColor Red
            }
        }
    }
    
    if ($modified) {
        [System.IO.File]::WriteAllText($filePath, $updatedContent)
        Write-Host "Successfully converted Service schema in: $($file.Name)" -ForegroundColor Green
    }
}
