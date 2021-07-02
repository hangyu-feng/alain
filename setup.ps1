$vscode_settings_path = "~\AppData\Roaming\Code\User\settings.json"
$vscode_settings_url = "https://raw.githubusercontent.com/hangyu-feng/alain/master/configs/vscode/extensions.txt"
$vscode_extensions_url = "https://raw.githubusercontent.com/hangyu-feng/alain/master/configs/vscode/extensions.txt"

$programs = @('git', 'vscode', 'selenium')

# install scoop
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex
scoop bucket add extras

# install programs using scoop
foreach ($program in $programs) {
  scoop install $program
}

# vscode settings
wget -UseBasicParsing $vscode_settings_url >> $vscode_settings_path

# install vscode extensions

wget -UseBasicParsing $vscode_extensions_url | % { "code --install-extension $_" }
