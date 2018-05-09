Function Get-NodeStatus
{
    $a = Get-Process | where{$_.ProcessName -match "node"}
    if($a -ne $NULL)
    {
        write-host "yay"
        $rtrnstatus = "0"
    }
    else
    {
        $rtrnstatus = "1"
    }

    $name = "Get-NodeStatus.ps1"
    $body = @{
        name = $name
        results = $rtrnstatus
    }
    #$body = $body | convertto-json
    $uri = "http://localhost:8000/client_run_returns"
    
    Invoke-WebRequest -Uri $uri -Body $body -Method POST
}
Get-NodeStatus