# Pings devices given the range, e.g. 192.168.178.1, 192.168.178.2, 192.168.178.3, ..., 192.168.178.100.
1..100 | % {"192.168.178.$($_): $(Test-Connection -count 1 -comp 192.168.178.$($_) -quiet)"}
