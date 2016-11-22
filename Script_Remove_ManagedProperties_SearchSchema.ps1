
#######################################################################
#   Use this script to remove Managed Properties from search schema.  #
#######################################################################
#Author: Pedro Marques M. Neto

if((Get-PSSnapin -Name Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue) -eq $null )
{
    Add-PsSnapin Microsoft.SharePoint.PowerShell
    Write-Host "Sharepoint"
    cls
}

#Search service identifier. You can get it in the url when you access the search service.
$searchServiceApplicationID = '00000000-0000-0000-0000-000000000000'

#Managed properties to remove
$propertiesToRemove = @('prop1','prop2')

###############################################################################################################

$ssa = Get-SPEnterpriseSearchServiceApplication -Identity $searchServiceApplicationID

foreach($prop in $propertiesToRemove){
    
    $mp = Get-SPEnterpriseSearchMetadataManagedProperty -SearchApplication $ssa -Identity $prop
    $mp.DeleteAllMappings()
    Remove-SPEnterpriseSearchMetadataManagedProperty -SearchApplication $ssa -Identity $prop -Confirm:$false -Verbose
}
