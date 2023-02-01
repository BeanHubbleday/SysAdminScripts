#Create A VPN Account By Jack Hubbleday
#Created: 21-07-2022
#Last Edited: 21-07-2022

#Necessary module to complete the script
Install-Module -Name VPNCredentialsHelper

#Collects the name for the VPN profile
$name = Read-Host -Prompt 'Enter Customer Name'
#Enter the IP address or DNS name for the VPN server
$address = Read-Host -Prompt 'Enter The Customers IP Address'
#Enter the VPN username
$username =  Read-Host -Prompt 'Enter The Users Username Here'
#Enter the VPN password
$plainpassword =  Read-Host -Prompt 'Enter The Users Password Here'

#This adds everything together and adds the VPN connection to windows
Add-VpnConnection -Name $name -ServerAddress $address -TunnelType "Pptp" -EncryptionLevel "Required" -AuthenticationMethod MSChapv2 -SplitTunneling -RememberCredential -PassThru

#This saves the username and password against the VPN profile
Set-VpnConnectionUsernamePassword -connectionname $name -username $username -password $plainpassword
