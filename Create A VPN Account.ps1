Install-Module -Name VPNCredentialsHelper

$name = Read-Host -Prompt 'Enter Customer Name'
$address = Read-Host -Prompt 'Enter The Customers IP Address'
$username =  Read-Host -Prompt 'Enter The Users Username Here'
$plainpassword =  Read-Host -Prompt 'Enter The Users Password Here'

Add-VpnConnection -Name $name -ServerAddress $address -TunnelType "Pptp" -EncryptionLevel "Required" -AuthenticationMethod MSChapv2 -SplitTunneling -RememberCredential -PassThru

Set-VpnConnectionUsernamePassword -connectionname $name -username $username -password $plainpassword