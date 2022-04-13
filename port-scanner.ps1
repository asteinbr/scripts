# Portscanner for a given IP and Port range
1..299 | % { Write-Host ((New-Object Net.Sockets.TcpClient).Connect("192.168.178.1",$_)) "Port $_ open" } 2> $null
