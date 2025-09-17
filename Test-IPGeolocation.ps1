function Test-IPGeolocation {
    $jsonIp = Invoke-WebRequest "http://ipinfo.io/json"
    $ipInfo = ConvertFrom-Json $jsonIp
    Write-Host $ipInfo
}
Test-IPGeolocation
