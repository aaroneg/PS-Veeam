. $PSScriptRoot\initialize-veeam.ps1
$VeeamJobs=get-vbrjob|Where {$_.Name -notlike "DEV*" -and $_.Name -notlike "TEST*"}|Sort -Property Name
$VeeamJobs|Enable-VBRJob