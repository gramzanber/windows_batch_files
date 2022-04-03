Set-Alias -Name now -Value time
Set-Alias -Name weird_getter -Value weird_variable_getter

Function time {
  $current_time = Get-Date -Format "dddd MM/dd/yyyy HH:mm"
  echo "PowerShell time: $current_time"
}

# This methods does not do much, I made it to have saved functions
Function weird_variable_getter {
  New-Variable -Name 'author_name' -Value "Tachibana"
  Get-Variable "author_name"
}
