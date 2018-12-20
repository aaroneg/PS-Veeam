. $PSScriptRoot\initialize-veeam.ps1
# ignore dev and test machines
$VeeamJobs=get-vbrjob|Where {$_.Name -notlike "DEV*" -and $_.Name -notlike "TEST*"}|Sort -Property Name
# enable the job.
$VeeamJobs|Enable-VBRJob
