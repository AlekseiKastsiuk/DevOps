Get-WmiObject Win32_Service | 
Foreach-Object {$_ | Select-Object ProcessId, Name, State | Where-Object{$_.State -eq "Running"}} | 
ForEach-Object{@{$_.processId = $_.Name}} 

(Get-Content .\Wiki.txt) -split "\W" -ne "" | Group-Object -NoElement | where Count -gt 2 | sort count -Desc | Select-Object -First 10
