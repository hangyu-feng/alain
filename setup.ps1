$vscode_settings_folder = "~\AppData\Roaming\Code\User"
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
  'zhuangtongfa.material-theme'
)

$programs = @('vscode', 'selenium', 'psutils', 'pwsh')
$fonts = @('Cascadia-Code', 'FiraCode', 'hack-font', 'Inconsolata-NF', 'JetBrains-Mono', 'SourceCodePro-NF')

# install scoop
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

iwr -useb get.scoop.sh | iex
scoop install git  # required for scoop buckets
scoop bucket add extras
scoop bucket add nerd-fonts

# install programs using scoop
scoop install $programs

# install fonts
sudo scoop install $fonts

# vscode settings
if (!(test-path -path $vscode_settings_folder)) {
  mkdir $vscode_settings_folder
}
iwr -useb -URI $vscode_settings_url -outfile $vscode_settings_path

# install vscode extensions

foreach ($extension in $vscode_extensions) {
  code --install-extension $extension
}

# powershell settings
git clone "https://github.com/hangyu-feng/alain.git" $env:USERPROFILE/alain
pwsh -c {
  $parent_dir = Split-Path $profile -Parent
  if (!(test-path $parent_dir)) {
    mkdir $parent_dir
  }
  if (!(test-path $profile)) {
    touch $profile
  }
  . ~/alain/configs/powershell/scripts/install_powerline.ps1
  echo ". ~/alain/configs/powershell/Microsoft.PowerShell_profile.ps1" >> $profile
  . $profile
}
