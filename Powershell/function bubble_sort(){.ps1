function bubble_sort(){

    [CmdletBinding()]
    param (
        [array]$a
    ) 
    
    $n=$a.Length
    
  
    for($i=1; $i -le ($n-1); $i+=1)
    {    
        for($j=0; $j -le ($n-$i-1); $j+=1)
        {   Write-Verbose "Comparing $($a[$j]) and $($a[$j + 1])"
            if($a[$j] -le $a[$j+1])
            {   Write-Verbose "Change $($a[$j]) and $($a[$j + 1])"
                $temp=$a[$j]
                $a[$j]=$a[$j+1]
                $a[$j+1]=$temp
            }
        }  
    }
    return $a 
    }  
    
    $a=@(5,4,9,3,2,8,7) 

    $out = Read-Host "would you like to see output y/n" 
    if ($out -eq "y")
    {
        $sorted=bubble_sort $a -Verbose  
    }  
    elseif ($out -eq "n") 
    {
        $sorted=bubble_sort $a   
    }
    else {
        Write-Error "you made the wrong choice"
        exit
    }

    foreach($s in $sorted){
    $s
    }
    