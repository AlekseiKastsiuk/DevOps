class revers {
    [string]$input1

    rev($input1){
       $tmp = $input1.ToCharArray()
       [array]::Reverse($tmp)
       
       $output1 = -join($tmp)
        Write-Host $output1
    }
}