$vscode_settings_path = "~\AppData\Roaming\Code\User\settings.json"

# install scoop
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex

# install programs using scoop
scoop install selenium
scoop install vscode

# vscode settings
cat "configs\vscode\settings.json" >> $vscode_settings_path

# install vscode extensions

cat "configs\vscode\extensions.txt" | % { "code --install-extension $_" }
