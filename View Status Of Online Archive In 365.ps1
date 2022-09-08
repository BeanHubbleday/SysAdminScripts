#View Status Of Online Archive In 365

#Login to exchange online as the global admin
$globalAdmin = Read-Host -Prompt "Enter The Global Admin Username"
Write-Host "Enter The Global Admin Password When Prompted"
Connect-ExchangeOnline -UserPrincipalName $globalAdmin 

#Start online archiving
$archivingUser = Read-Host -Prompt "Enter The Email Address Of The User You Want To View Archiving Status For"

#Show archive size & refresh every X seconds
$aMadeUpVariable = 0
$seconds = Read-Host -Prompt "How Often Do You Want To Refresh The Status (Seconds)?"
Write-Host "WHen You're Finished Viewing The Status, Simply Hit Ctrl+C Or Close PowerShell"
Do {
    Get-MailboxStatistics -Identity $archivingUser -Archive | Select DisplayName, TotalItemSize, ItemCount
    Start-Sleep -Seconds $seconds
} until ($aMadeUpVariable -eq 1)
