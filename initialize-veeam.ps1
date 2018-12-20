[CmdletBinding()]
PARAM(
        [Parameter(Mandatory=$True)][string]$VeeamServer
)
# import the veeam snapin.
Add-PSSnapin VeeamPSSnapin
# if we aren't already connected, connect
if (!(Get-VBRServerSession)) {
    Write-Host "No existing session found, connecting to Veeam" -ForegroundColor Yellow
    Connect-VBRServer -server $VeeamServer
}
