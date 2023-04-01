class reg {

    task1(){
        $str = "A Bal_rog is a power_Ful fictionaL_monster in Middle-earth"
        $pattern = "\w*[a-z][-_][a-z]\w*"
        $tmp = [regex]::Matches($str, $pattern)
        Write-Host $tmp
    }

    task2(){
        $str = "A Bal_rog is a power_Ful fictionaL_monster in Middle-earth"
        $pattern = "\w+$"
        $tmp = [regex]::Matches($str, $pattern)
        Write-Host $tmp
    }

    task3(){
        $str = "Reply from 10.8.216.77: bytes=32 time<1ms TTL=128"
        $pattern = "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
        $tmp = [regex]::Matches($str, $pattern)
        Write-Host $tmp
    }

    task4(){
        [datetime]$str = "09-17-1991"
        $tmp = (Get-Date $str).ToString('dd-MM-yyyy')
        Write-Host $tmp
    }

    task5(){
        $str = "Tue Sep 15 2020 15:39:48 GMT+0300 (Belarus Local DateTime)"
        $pattern = "\w{6}\w*"
        $tmp = [regex]::Matches($str, $pattern)
        Write-Host $tmp
    }

    task6(){
        $str = " kube-system   coredns-869cb84759-drhbg                     1/1     Running   0          4h5m)"
        $tmp = $str -replace "\s+"," "
        Write-Host $tmp
    }
}