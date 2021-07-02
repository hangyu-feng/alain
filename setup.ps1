$vscode_settings_path = "~\AppData\Roaming\Code\User\settings.json"
$vscode_settings_url = "https://raw.githubusercontent.com/hangyu-feng/alain/master/configs/vscode/settings.json"

$vscode_extensions = @(
  'arcticicestudio.nord-visual-studio-code',
  'christian-kohler.npm-intellisense',
  'DavidAnson.vscode-markdownlint',
  'dbaeumer.vscode-eslint',
  'DotJoshJohnson.xml',
  'dracula-theme.theme-dracula',
  'eamodio.gitlens',
  'eg2.vscode-npm-script',
  'Equinusocio.vsc-community-material-theme',
  'Equinusocio.vsc-material-theme',
  'equinusocio.vsc-material-theme-icons',
  'esbenp.prettier-vscode',
  'fisheva.eva-theme',
  'Gimly81.matlab',
  'GitHub.github-vscode-theme',
  'HookyQR.beautify',
  'James-Yu.latex-workshop',
  'jdinhlife.gruvbox',
  'jolaleye.horizon-theme-vscode',
  'max-SS.Cyberpunk',
  'mechatroner.rainbow-csv',
  'ms-azuretools.vscode-docker',
  'ms-python.python',
  'ms-python.vscode-pylance',
  'ms-toolsai.jupyter',
  'ms-vscode-remote.remote-containers',
  'ms-vscode-remote.remote-ssh',
  'ms-vscode-remote.remote-ssh-edit',
  'ms-vscode-remote.remote-wsl',
  'ms-vscode-remote.vscode-remote-extensionpack',
  'ms-vscode.powershell',
  'ms-vscode.wordcount',
  'ms-vsliveshare.vsliveshare',
  'ms-vsliveshare.vsliveshare-audio',
  'ms-vsliveshare.vsliveshare-pack',
  'mshr-h.veriloghdl',
  'mutantdino.resourcemonitor',
  'naumovs.color-highlight',
  'PKief.material-icon-theme',
  'redhat.vscode-commons',
  'redhat.vscode-yaml',
  'rokoroku.vscode-theme-darcula',
  'rssowl.copy-relative-path-posix',
  'tinkertrain.theme-panda',
  'tomphilbin.gruvbox-themes',
  'VisualStudioExptTeam.vscodeintellicode',
  'zhuangtongfa.material-theme',
)

$programs = @('vscode', 'selenium')

# install scoop
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

if (!(Get-Command scoop)) {
  iwr -useb get.scoop.sh | iex
}
scoop install git
scoop bucket add extras

# install programs using scoop
foreach ($program in $programs) {
  scoop install $program
}

# vscode settings
wget -UseBasicParsing -URI $vscode_settings_url -outFile $vscode_settings_path

# install vscode extensions

# foreach ($extension in $vscode_extensions) {
#   code --install-extension $extension
# }
