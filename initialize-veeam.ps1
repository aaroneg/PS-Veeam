[CmdletBinding()]
PARAM(
        [Parameter(Mandatory=$True)][string]$VeeamServer
)
Add-PSSnapin VeeamPSSnapin
if (!(Get-VBRServerSession)) {
    Write-Host "No existing session found, connecting to Veeam" -ForegroundColor Yellow
    Connect-VBRServer -server $VeeamServer
}

