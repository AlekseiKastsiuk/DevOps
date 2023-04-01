class CsvRow {
    [object] ${id}
    [object] ${phone}
 }
  
  $array = @()
  foreach ($ndx in 1..1000) {
    $rowObj = [CsvRow]::new()
    $rowObj.id = $ndx
    $rowObj.phone = Get-Random -Minimum 3000000 -Maximum 3999999
    $array += $rowObj
  }
    $array | Export-Csv "C:\Users\Aleksey\Desktop\Epam training\SQL\csv.csv"