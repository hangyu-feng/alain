# alain
tailored setup script for alain

----------

To use the script:

1. open powershell

2. run the following commands

```pwsh
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
# type "A" then hit enter
# [A] Yes to All

iwr -useb "https://raw.githubusercontent.com/hangyu-feng/alain/master/setup.ps1" | iex
```
