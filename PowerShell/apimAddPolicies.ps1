Import-Module Az.ApiManagement
## Get Context for API Managment
$apimContext = New-AzApiManagementContext -ResourceGroupName "#{apim-resourcegroup}#" -ServiceName "#{apim-name}#"
## Add Global Polices
# if ("#{EnvironmentType}#" -eq "Production")
# {
# 	Set-AzApiManagementPolicy -Context $apimContext -PolicyFilePath "#{SYSTEM_DEFAULTWORKINGDIRECTORY}#\Shared-AzureResource\APIM\APIManagment\policies\#{EnvironmentPrefix}#_GlobalIPRestrictionsDR.xml"
# }
# else
# {
# 	Set-AzApiManagementPolicy -Context $apimContext -PolicyFilePath "#{SYSTEM_DEFAULTWORKINGDIRECTORY}#\Shared-AzureResource\APIM\APIManagment\policies\#{EnvironmentPrefix}#_GlobalIPRestrictions.xml"
# }
## Add Policies
Get-AzApiManagementPolicy -Context $apimContext
Set-AzApiManagementPolicy -Context $apimContext -ApiId "Toll" -OperationId "consignment" -PolicyFilePath "#{SYSTEM_DEFAULTWORKINGDIRECTORY}#\#{RELEASE_PRIMARYARTIFACTSOURCEALIAS}#\APIMPolicies\Consignment.xml"
Set-AzApiManagementPolicy -Context $apimContext -ApiId "Toll" -OperationId "pickup" -PolicyFilePath "#{SYSTEM_DEFAULTWORKINGDIRECTORY}#\#{RELEASE_PRIMARYARTIFACTSOURCEALIAS}#\APIMPolicies\Pickup.xml"
