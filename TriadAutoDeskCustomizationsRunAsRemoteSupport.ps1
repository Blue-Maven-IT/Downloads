#AutoCAD Customizer for Triad Associates
#Angela Lacy
#10-JUL-2024
#
#Run this powershell script as administrator from the Remote Support account
#This script downloads fonts, plotters, plot styles, and support files for Triad Associates Inc and places them into designated folders so that they will be utilized by AutoCAD applications


#Get Location
$cd = Get-Location

#Download TAI Customization Files from Github
Invoke-WebRequest 'https://github.com/Blue-Maven-IT/Downloads/raw/main/TAIAECCustomizationv1.zip' -OutFile "$cd\TAIAECCustomizationv1.zip"

#Decompress ZIP
Expand-Archive -LiteralPath "$cd\TAIAECCustomizationv1.zip" -DestinationPath "$cd"

#Copy Fonts to AutoCAD (Currently 97 files)
Copy-Item -Path "$cd\TAIAECCustomizationv1\Fonts\*" -Destination "C:\Program Files\Autodesk\AutoCAD 2024\Fonts" -Recurse -ErrorAction SilentlyContinue


#Get all existing users with profiles
$users = (Get-Childitem "C:\users").name

#Copy Plotters to AutoCAD, Civil 3D, and MAP 3D

#Set Source Folder for Plotters
$Source = "$cd\TAIAECCustomizationv1\Plotters\*"


#Copy Plotters to AutoCAD
Foreach ($user in $users){
Copy-Item -Path $Source -Destination "C:\users\$user\appdata\roaming\Autodesk\AutoCAD 2024\R24.3\enu\Plotters" -Recurse -ErrorAction SilentlyContinue

}

#Copy Plotters to Civil 3D
Foreach ($user in $users){
Copy-Item -Path $Source -Destination "C:\users\$user\appdata\roaming\Autodesk\C3D 2024\enu\Plotters" -Recurse -ErrorAction SilentlyContinue

}

#Copy Plotters to #Map 3D
Foreach ($user in $users){
Copy-Item -Path $Source -Destination "C:\users\$user\appdata\roaming\Autodesk\Autodesk AutoCAD Map 3D 2024\R24.3\enu\Plotters" -Recurse -ErrorAction SilentlyContinue

}

#Set Source Folder for Support
$Source = "$cd\TAIAECCustomizationv1\Support\*"

#Copy Support to AutoCAD
Foreach ($user in $users){
Copy-Item -Path $Source -Destination "C:\users\$user\appdata\roaming\Autodesk\AutoCAD 2024\R24.3\enu\Support" -Recurse -Force -ErrorAction SilentlyContinue

}

#Copy Support to Civil 3D
Foreach ($user in $users){
Copy-Item -Path $Source -Destination "C:\users\$user\appdata\roaming\Autodesk\C3D 2024\enu\Support" -Recurse -Force -ErrorAction SilentlyContinue

}

#Copy Support to Map 3D
Foreach ($user in $users){
Copy-Item -Path $Source -Destination "C:\users\$user\appdata\roaming\Autodesk\Autodesk AutoCAD Map 3D 2024\R24.3\enu\Support" -Recurse -Force -ErrorAction SilentlyContinue

}

#Delete Customization Files
Remove-Item -Path "$cd\TAIAECCustomizationv1" -Recurse
Remove-Item -Path "$cd\TAIAECCustomizationv1.zip"
