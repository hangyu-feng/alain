
# Some other aliases
function scst { scoop update; scoop status }

Set-Alias -Name vi -Value vim

function networth($buyback) {
  ($buyback - 200) * 13
}
