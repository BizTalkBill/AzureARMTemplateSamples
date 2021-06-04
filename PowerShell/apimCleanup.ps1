Import-Module Az.ApiManagement
## Get Context for API Managment
$apimContext = New-AzApiManagementContext -ResourceGroupName "#{apim-resourcegroup}#" -ServiceName "#{apim-name}#"
## Remove Unwanted API Managment Features
$echoAPIId = (Get-AzApiManagementApi -Context $apimContext -Name "Echo API").ApiId
if ($echoAPIId)
{
      Remove-AzApiManagementApi -Context $apimContext -ApiId "$echoAPIId"
}
Remove-AzApiManagementProduct -Context $apimContext -ProductId "starter" -DeleteSubscriptions
Remove-AzApiManagementProduct -Context $apimContext -ProductId "unlimited" -DeleteSubscriptions
