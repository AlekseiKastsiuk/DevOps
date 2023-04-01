class cycle {
[string]$str    

    temperature($str)
    {
  
        if ($str -eq [regex]::Matches($str, "[0-9]+[C]")) 
            {
             [string]$tmp = [regex]::Match($str, "[0-9]{1,3}")
             [int]$IntTmp = $tmp
             $inttmp = ($IntTmp*9/5)+32
             write-host $str,"is",$IntTmp,"in Fahrenheit"
            }

        elseif ($str -eq [regex]::Matches($str, "[0-9]+[F]")) 
            {

             [string]$tmp = [regex]::Match($str, "[0-9]{1,3}")
             [int]$IntTmp = $tmp
             $inttmp = ($IntTmp-32)*5/9
             write-host $str,"is",$IntTmp,"in Celsius"
            }

        else {write-host "incorrect"}
    }

    Fibonachi($n)
    {
     $current = $previous = 1;
     while ($current -lt $n) 
        {
           $current;
           $current,$previous = ($current + $previous),$current
            Write-Host $previous
        }
    }

    DogAge($n)
    { 
        $dogage = 0
        $temp=0
        if ($n -le 2) 
        {
            while ($temp -le $n-1) 
            {
             $dogage=$dogage+10.5  
             $temp = $temp+1
             Write-Host $dogage
            }
        }
        elseif ($n -gt 2) 
        {   $temp = 0
            $dogage = 0

            while ($temp -le 1) 
            {
             $dogage=$dogage+10.5  
             $temp = $temp+1
             Write-Host $dogage
            }
            while ($temp -le $n-1) 
            {
             $dogage=$dogage+4  
             $temp = $temp+1
             Write-Host $dogage
            }
        }
       

    }

    Multi($n)
    {
        for ($i = 1; $i -le 10; $i++) 
        {
           $temp = $i*$n
           Write-Host $temp 
        }
    }



}