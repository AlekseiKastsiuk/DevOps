
param (
[string]$pathcsvfile
)
$delimiter = ','

$newcsvfile = $pathcsvfile.Replace('accounts.csv','accounts_new.csv')#create path for new.csv

#------------this loop for create array to compare the same emails 
Import-Csv $pathcsvfile | ForEach-Object{
    $_.email = ($_.name.Substring(0,1) + ($_.name -split ' ')[1]).ToLower()
    $array=@($array + $_.email)
}


Import-Csv $pathcsvfile | ForEach-Object{


$_.name = (Get-Culture).TextInfo.ToTitleCase($_.name) #first letter of name/surname uppercase and all other letters lowercase.

$_.email = ($_.name.Substring(0,1) + ($_.name -split ' ')[1]).ToLower() #Email format: first letter from name and full surname, lowercase.




$samecount = ($array -eq $_.email).Length #count same emails
 



if ( $samecount -eq 1 )
{

  $_.email = $_.email + "@abc.com"  #column email with domain @abc.com
}
elseif ( $samecount -gt 1 )
{

  $_.email = $_.email + $_.location_id +"@abc.com"  #Equals emails contain location_id.
}

 $_

} | Export-Csv -Verbose -Path $newcsvfile -NoTypeInformation  