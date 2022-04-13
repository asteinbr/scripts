#
# Banner Grabbing with PowerShell
# Usage: PS> queryPort "dc01" 443
#
function queryPort ([String]$hostname, [String]$port) {
	$socket = New-Object System.Net.Sockets.TCPClient
	$connectionState = ($socket.BeginConnect($hostname, $port, $null, $null)).AsyncWaitHandle.WaitOne(300)
	if ($connectionState -eq "True") {
		$stream = $socket.getStream()
		Start-Sleep -m 500; $text = ""
		$output = "$hostname : port $port is open, responding with: "
		while ($stream.DataAvailable) { 
            $output += [char]$stream.ReadByte()
		}
		$output
		$socket.Close()
	} else {
		echo "$hostname : port $port failed to connect"
	}
}

queryPort "hostname" 22
