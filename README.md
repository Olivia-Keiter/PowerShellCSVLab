# PowerShellCSVLab
</br>
#Create a new script named C:\Desktop\Labfiles\CreateUsers.ps1.
</br>
New-Item .\CreateUsers.ps1
</br>
</br>
#Import users.csv and store the objects in a variable.
</br>
$users = Import-CSV .\Users.csv
</br>
</br>
#Create a ForEach loop that processes the data in the variable to create user accounts:
</br>
ForEach ($user in $users) {
</br>
</br>
#Create a variable that contains the Lightweight Directory Access Protocol (LDAP) name of the organizational unit for the user. For example: OU=IT,DC=Adatum,DC=com
</br>
$path = “OU=” + $user.department + “,DC=Adatum,DC=com”
</br>
</br>
#Create a variable that contains the user principal name for the new user. This should be in the format UserID@adatum.com.
</br>
#user firs name + space + user last name 
</br>
$display = $user.first + “ “ + $user.last
</br>
</br>
#Create a variable that contains the display name for the new user. This should be in the format FirstName LastName.
</br>
$UPN = $user.userID + “@adatum.com”
</br>
</br>
#Enter a status message to the screen indicating which user is being created and where.
</br>
Write-Host “Creating $display in $path”
</br>
</br>
#Create the new user and be sure to set the following:
</br>
New-AdUser -GivenName $user.first -surname $user.last -name $display -displayname $display -SamAccountName $user.userID -UserPrincipalName $UPN -Path $path -Department $user.departent }
