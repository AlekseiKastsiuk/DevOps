function writecolourmess{
    param(
        [string] $text,
        #[string] $colour
        [switch] $red,
        [switch] $blue
    )

    if ($red) {
        Write-Host -ForegroundColor red $text
    }
    elseif ($blue) {
        Write-Host -ForegroundColor blue $text
    }
}

function WriteArray {
    param (
        [parameter(ValueFromPipeline=$true)]
        [array] $array
    )
       
    process{
        for ($i = 0; $i -lt $array.Count; $i++) {
          Write-Host "Value from pipe:" $array[$i]
        }
    }
}

