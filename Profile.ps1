# Make sure this file is in
# PowerShell >= 6   $Home\Documents\PowerShell\Profile.ps1
# PowerShell <= 5.1 $Home\Documents\WindowsPowerShell\Profile.ps1

# These alias are added to the default shell at runtime
Set-Alias -Name doc -Value documents
Set-Alias -Name ssh -Value secure_shell
# Catching all the ways users would ask for the current version
Set-Alias -Name version -Value powershell_version
Set-Alias -Name v -Value powershell_version
Set-Alias -Name ver -Value powershell_version

Function documents {
  cd "$Home\Documents"
}

# Overwriting the original 'ssh' call to auto include username
# Method includes a way to take parameter
Function secure_shell {
  param(
    [Parameter (Mandatory = $true)] [String]$ssh_host
  )
  $ssh_user = "ttachibana"
  ssh $ssh_user@$ssh_host
}

# This method includes four different ways to get the current powershell version
Function powershell_version {
  # $PSVersionTable.PSVersion
  # $host.Version
  # (Get-Host).Version
  $version = (Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\PowerShell\3\PowerShellEngine -Name 'PowerShellVersion').PowerShellVersion
  write-output "Powershell: $version"
}

# Use this line below to source (Like in Unix) other script files
# This adds them to your default shell if included in this script
. $Home\Documents\WindowsPowerShell\saved_functions.ps1
