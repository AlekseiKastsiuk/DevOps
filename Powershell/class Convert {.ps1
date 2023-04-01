class Convert {
    $str1 = "the-stealth-warrior_asd"

    search(){   
        
        $TextInfo = (Get-Culture).TextInfo
        $tmp = $TextInfo.ToTitleCase($this.str1) 
        $tmp = $tmp -replace "[-,_]", $null

        Write-Host $tmp
       
    }   

    
}