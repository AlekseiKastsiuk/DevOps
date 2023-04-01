class upper{

    [string]$Input1
   

    SetString($Input1){
        $this.Input1 = $Input1
    }

   PrintString(){
    
       Write-Host $this.Input1.ToUpper()
    }
}