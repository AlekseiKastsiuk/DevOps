    
    param (
    #---------input param
        [string]$ip_address_1,
        [string] $ip_address_2,
        [string]$network_mask 
    
    )

   

    #---------function for convrert xx to x.x.x.x format netmask

function ConvertTo-IPv4MaskString 
{
  param
  (
    [Int] $MaskBits
  )

  $mask = ([Math]::Pow(2, $MaskBits) - 1) * [Math]::Pow(2, (32 - $MaskBits))
  $bytes = [BitConverter]::GetBytes([UInt32] $mask)
  (($bytes.Count - 1)..0 | ForEach-Object { [String] $bytes[$_] }) -join "."
}


   #-------patterns
   $patternip = '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
   
   $num = "128|192|224|240|248|252|254"
   $patternmask='^(($num)\.0\.0\.0)|(255\.(((0|$num)\.0\.0)|(255\.(((0|$num)\.0)|255\.(0|$num)))))$'
   
   $patternmaskcidr = '^([0-9]|[12]\d|3[0-2])$'

   #--------validation ip and convert string to System.Net.IPAddress
    
   if ($ip_address_1 -match $patternip  -and $ip_address_2 -match $patternip )
   {
        [System.Net.IPAddress]$ip_address_1=$ip_address_1
        [System.Net.IPAddress]$ip_address_2=$ip_address_2
   }

   else { Write-Error "incorrect ip"; exit }
   
   #----------validation netmask and convert string to System.Net.IPAddress

    if ($network_mask -match $patternmask)
    {
        [System.Net.IPAddress]$network_mask=$network_mask
    }

    elseif ($network_mask -match $patternmaskcidr)
    {     
       
        [System.Net.IPAddress]$network_mask=ConvertTo-IPv4MaskString([int]$network_mask)
    }
    else {Write-Error "incorrect netmask"; exit}

    #-----------comparing 
  
     if (($ip_address_1.address -band $network_mask.address) -eq ($ip_address_2.address -band $network_mask.address)) #compare "Bitwise AND" ip and mask
            {
                Write-Host "yes"
            }
         else 
            {
                Write-Host "no"
            }
  
   