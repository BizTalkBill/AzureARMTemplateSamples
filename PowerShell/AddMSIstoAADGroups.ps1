function Add-GroupMember {
    [cmdletbinding()]
    Param (
        [string]$groupName,
        [string]$memberObjectId
    )

	Write-Host "MemberObjectId: $memberObjectId to be added to GroupDisplayName: $groupName"

	Try
	{
		try {
			Get-AzADGroupMember -GroupDisplayName $groupName
		}
		catch {
			Write-Host $_
		}
		try {
			Get-AzADApplication -ObjectId $memberObjectId
		}
		catch {
			Write-Host $_
		}		
		Add-AzADGroupMember -TargetGroupDisplayName $groupName -MemberObjectId $memberObjectId  
		Write-Host "Added - MemberObjectId: $memberObjectId added to GroupDisplayName: $groupName"
	}
	Catch
	{
		Write-Host $_
		Write-Host "Duplicate - MemberObjectId: $memberObjectId found in GroupDisplayName: $groupName"
	}
}

Add-GroupMember -groupName Integration-AppConfig-Reader -memberObjectId #{custbalupd_service_principal}#
Add-GroupMember -groupName Integration-KeyVault-Reader-#{EnvironmentName}# -memberObjectId #{custbalupd_service_principal}#

Add-GroupMember -groupName Integration-AppConfig-Reader -memberObjectId #{custaddupd_service_principal}#
Add-GroupMember -groupName Integration-KeyVault-Reader-#{EnvironmentName}# -memberObjectId #{custaddupd_service_principal}#

Add-GroupMember -groupName Integration-AppConfig-Reader -memberObjectId #{vendaddupd_service_principal}#
Add-GroupMember -groupName Integration-KeyVault-Reader-#{EnvironmentName}# -memberObjectId #{vendaddupd_service_principal}#

Add-GroupMember -groupName Integration-AppConfig-Reader -memberObjectId #{journals_service_principal}#
Add-GroupMember -groupName Integration-KeyVault-Reader-#{EnvironmentName}# -memberObjectId #{journals_service_principal}#

Add-GroupMember -groupName Integration-AppConfig-Reader -memberObjectId #{custprjaddupd_service_principal}#
Add-GroupMember -groupName Integration-KeyVault-Reader-#{EnvironmentName}# -memberObjectId #{custprjaddupd_service_principal}#
