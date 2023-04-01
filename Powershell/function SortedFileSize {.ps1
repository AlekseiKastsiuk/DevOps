function SortedFileSize {
    [CmdletBinding()]
    param (  
        [string]$path    
    ) 
    begin {
        #$path = "C:\Users\Aleksey\Desktop\Epam training\Powershell\VSC"
    } 
    process {
       Get-ChildItem  $path  | Sort-Object -Property Length     
    }
    end {
    }
}

function RemoveFiles {
    [CmdletBinding()]
    param (
        [string]$path     
    )
    begin {
        #$path = "C:\Users\Aleksey\Desktop\Epam training\Powershell\VSC\DeliteFile"
    }
    process {
        Get-ChildItem -Path $path -File | Where-Object {$_. Length -gt 100000} | Remove-Item -Verbose
    }
    end {    
    }
}