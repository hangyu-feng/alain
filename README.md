# alain
tailored setup script for alain

----------

To use the script:

1. open powershell

```pwsh
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
# type "A" then hit enter
# [A] Yes to All

iwr -useb "https://raw.githubusercontent.com/hangyu-feng/alain/master/setup.ps1" | iex
$vscode_settings_path = "~\AppData\Roaming\Code\User\settings.json"
$vscode_settings_url = "https://raw.githubusercontent.com/hangyu-feng/alain/master/configs/vscode/settings.json"
iwr -useb -URI $vscode_settings_url -outFile $vscode_settings_path
```
