# This script expects you to already have a session open with your vCenter server

. $PSScriptRoot\initialize-veeam.ps1

$SourceClusters=@()
$SourceClusters+='Cluster1'
$SourceClusters+='Cluster2'

$VMS=Get-Vm|Where {$_.VMHost.Parent.Name -in $SourceClusters -and $_.Name -notlike "DEV*" -and $_.Name -notlike "TEST*"}|Sort -Property Name
# This will need to be modified if there's more than one repo
$BackupRepo=Get-VBRBackupRepository

Foreach ($VM in $VMS) {
    if (!(Get-VBRJob -Name "$($VM.Name)")) {    
        Write-host -ForegroundColor Yellow "Adding job for '$($VM.Name)'"
        try {
            $VMEntity=Find-VBRViEntity -Name "$($VM.Name)" -WarningAction Stop -Erroraction stop
        }
        catch {
            Write-error "Could not find entity for vm: $($VM.Name), skipping"
            continue
        }
        $Job=Add-VBRViBackupJob -Name "$($VM.Name)" -Entity $VMEntity -BackupRepository $BackupRepo -Verbose
        $Job|Set-VBRJobSchedule -Daily -At "21:00" -DailyKind Everyday  | Enable-VBRJobSchedule
        #throw "one backup job added"
    }
    else {
        Write-Host -ForegroundColor Cyan "Job already exists: $($VM.Name)"
    }
}