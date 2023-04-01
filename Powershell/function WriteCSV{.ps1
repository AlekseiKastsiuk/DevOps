$obj = [PSCustomObject] @{
    'id' = $null
    'Example Header 2' = $null
}

$array = @()
$i=0
for ($i = 0; $i -lt 10; $i++){

  $obj.'id' = $i
    $obj.'Example Header 2' = "h2-$ndx"

  $array += $obj
}

# Output the array.
$array


