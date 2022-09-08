#Enable Online Archive For 365
<#Ensure all the pre-req's are completed in the 365 exchange admin center,
i.e. a retention tag and policy is configured and archiving is enabled for the user#>

#Login to exchange online as the global admin
$globalAdmin = Read-Host -Prompt "Enter The Global Admin Username"
Write-Host "Enter The Global Admin Password When Prompted"
Connect-ExchangeOnline -UserPrincipalName $globalAdmin 

#Start online archiving
$archivingUser = Read-Host -Prompt "Enter The Email Address Of The User You Want To Enable Archiving For"
Start-ManagedFolderAssistant -Identity $archivingUser
Write-Host "Archiving Enabled..."

#Show archive size & refresh every X seconds
$aMadeUpVariable = 0
$seconds = Read-Host -Prompt "How Often Do You Want To Refresh The Status (Seconds)?"
Write-Host "WHen You're Finished Viewing The Status, Simply Hit Ctrl+X Or Close PowerShell"
Do {
    Get-MailboxStatistics -Identity $archivingUser -Archive | Select DisplayName, TotalItemSize, ItemCount
    Start-Sleep -Seconds $seconds
} until ($aMadeUpVariable -eq 1)
