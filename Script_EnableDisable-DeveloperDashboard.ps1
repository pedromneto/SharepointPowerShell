if((Get-PSSnapin -Name Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue)-eq $null){

    Add-PSSnapin Microsoft.SharePoint.PowerShell
}
cls

#Definir a variavelabaixo se o Developer Dashboard deve estar habilitado ou não

$habilitar = $false


###################################################################################

$mode = [Microsoft.SharePoint.Administration.SPDeveloperDashboardLevel]::Off

if($habilitar){
    $mode = [Microsoft.SharePoint.Administration.SPDeveloperDashboardLevel]::On
}
    

$content = ([Microsoft.SharePoint.Administration.SPWebService]::ContentService)
$appsetting =$content.DeveloperDashboardSettings

Write-Host "Display Level atual: " $appsetting.DisplayLevel -ForegroundColor Yellow

$appsetting.DisplayLevel = $mode
$appsetting.Update() 

Write-Host "Display level alterado: " $appsetting.DisplayLevel -ForegroundColor Green


