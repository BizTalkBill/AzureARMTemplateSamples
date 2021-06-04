
try {
    Set-AzIntegrationAccountMap -ResourceGroupName "#{integrationaccount-resourcegroup}#" -Name "#{integrationaccount-name}#" -MapType Liquid -MapName "CreateSQLQuery" -MapFilePath "#{SYSTEM_DEFAULTWORKINGDIRECTORY}#\#{RELEASE_PRIMARYARTIFACTSOURCEALIAS}#\Maps\CreateSQLQuery.liquid" -Force
}
catch {
    New-AzIntegrationAccountMap -ResourceGroupName "#{integrationaccount-resourcegroup}#" -Name "#{integrationaccount-name}#" -MapType Liquid -MapName "CreateSQLQuery" -MapFilePath "#{SYSTEM_DEFAULTWORKINGDIRECTORY}#\#{RELEASE_PRIMARYARTIFACTSOURCEALIAS}#\Maps\CreateSQLQuery.liquid" 
}

try {
    Set-AzIntegrationAccountMap -ResourceGroupName "#{integrationaccount-resourcegroup}#" -Name "#{integrationaccount-name}#" -MapType XSLT -MapName "FormatEmptySQLResults" -MapFilePath "#{SYSTEM_DEFAULTWORKINGDIRECTORY}#\#{RELEASE_PRIMARYARTIFACTSOURCEALIAS}#\Maps\FormatEmptySQLResults.xsl" -Force
}
catch {
    New-AzIntegrationAccountMap -ResourceGroupName "#{integrationaccount-resourcegroup}#" -Name "#{integrationaccount-name}#" -MapType XSLT -MapName "FormatEmptySQLResults" -MapFilePath "#{SYSTEM_DEFAULTWORKINGDIRECTORY}#\#{RELEASE_PRIMARYARTIFACTSOURCEALIAS}#\Maps\FormatEmptySQLResults.xsl" 
}
