  Get-WmiObject -Query "select * from win32_processor" `
 -ComputerName localhost| Format-List -Property  name, Maxclockspeed

  Get-WmiObject -Query "select * from win32_OperatingSystem" `
  -ComputerName localhost | Format-List -Property  TotalVisibleMemorySize, FreePhysicalMemory,FreeSpaceInPagingFiles,Version
      
  Get-WmiObject -Query "select * from Win32_QuickFixEngineering" `
  -ComputerName localhost 


   #Get-WmiObject -Query "select * from win32_service where state = 'stopped'" `
   #-ComputerName localhost 


    Get-WmiObject -Query "select * from Win32_LogonSession" ` -ComputerName localhost | ForEach-Object {            
    $data = $_                   
    $id = $data.__RELPATH -replace """", "'"            
    $q = "ASSOCIATORS OF {$id} WHERE ResultClass = Win32_Account"            
    Get-WmiObject -ComputerName localhost -Query $q |            
    Select-Object @{N="User";E={$($_.Caption)}},             
    @{N="LogonTime";E={$data.ConvertToDateTime($data.StartTime)}} 

    Get-WmiObject -Query "select * from win32_loggedonuser" | ForEach-Object { (($_.Antecedent -Split "Name=`"")[1] -Split "`"")[0] }            
   }      

  