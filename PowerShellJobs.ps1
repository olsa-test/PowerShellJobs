#
# Script.ps1
#
Clear-Host
Start-Job {1..10 | foreach {$_ ; Start-Sleep -Seconds 1}} -Name J1
Start-Job {1..10 | foreach {$_ ; Start-Sleep -Seconds 2}} -Name J2

$nc = $true
while ($nc)
{
    $nc = $false
    Get-Job -State Completed
    $js = Get-Job
    foreach ($j in $js)
    {
       if ($j.State -ne "Completed")
       {
          Write-Host "$($j.Name) Job Not Completed"
          $nc = $true
       }
    }
    Start-Sleep -Seconds 5
}
#$js | gm
#Get-Job | Remove-Job

