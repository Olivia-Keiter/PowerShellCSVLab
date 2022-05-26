#Create a new script named E:\Mod07\Labfiles\CreateUsers.ps1.
New-Item .\CreateUsers.ps1

#Import users.csv and store the objects in a variable.
$users = Import-CSV .\Users.csv

#Create a ForEach loop that processes the data in the variable to create user accounts:
ForEach ($user in $users) {

#Create a variable that contains the Lightweight Directory Access Protocol (LDAP) name of the organizational unit for the user. For example: OU=IT,DC=Adatum,DC=com
$path = “OU=” + $user.department + “,DC=Adatum,DC=com”

#Create a variable that contains the user principal name for the new user. This should be in the format UserID@adatum.com.
#user firs name + space + user last name 
$display = $user.first + “ “ + $user.last

#Create a variable that contains the display name for the new user. This should be in the format FirstName LastName.
$UPN = $user.userID + “@adatum.com”

#Enter a status message to the screen indicating which user is being created and where.
Write-Host “Creating $display in $path”

#Create the new user and be sure to set the following:
New-AdUser -GivenName $user.first -surname $user.last -name $display -displayname $display -SamAccountName $user.userID -UserPrincipalName $UPN -Path $path -Department $user.departent }
