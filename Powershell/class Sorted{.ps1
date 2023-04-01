class Sorted {
    $str1 = "xyaabbbccccdefwwA"
    $str2 = "xxxxyyyyabklmopq"
    
    glue()
    {
       #$tmp = $this.str2 + $this.str1
       $tmp = [System.String]::Concat($this.str1, $this.str2)
       $tmp = $tmp.tocharArray()
       $tmp = $tmp | Sort-Object -Unique
       Write-Host $tmp
    }

    $str3 = "the-stealth-warrior_asd"

    search(){   
        
        $TextInfo = (Get-Culture).TextInfo
        $tmp = $TextInfo.ToTitleCase($this.str3) 
        $tmp = $tmp -replace "[-,_]", $null

        Write-Host $tmp
    
}