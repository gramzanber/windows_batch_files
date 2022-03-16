# If you run into "cannot be loaded because running scripts is disabled on this system"
# Set-ExecutionPolicy Unrestricted - Permanent and for all users
# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted - Permanent and for current user
# powershell –ExecutionPolicy ByPass –File script.psl - One time bypass
#
# Key name refrence: https://ss64.com/vb/sendkeys.html

# Get the important info from the user
Write-Host -NoNewline "Keep Windows awake, how often (minutes)? "
$user_defined_time = Read-host
Write-Host -NoNewline "How many hours? "
$user_defined_end_time = Read-host
# This line changes the hours from a string to an integer
$user_defined_end_time = [convert]::ToInt32($user_defined_end_time)

# Creates the shell script so we can interact with Windows outside the script
$WShell = New-Object -com "Wscript.Shell"

$time_start = Get-Date
$keep_running = $true;

while ($keep_running)
{
    $run_time = $(Get-Date) - $time_start
    if($run_time.hours.Equals($user_defined_end_time)) {
        $keep_running = $false
        break
    }
    $WShell.sendkeys("{SCROLLLOCK}")
    $minutes = (60 * $user_defined_time) - 5 # 60 seconds times X gives you minutes, minus 5 seconds for saftey
    Start-Sleep -Seconds $minutes
}

Write-Host "Script complete :), I hope you had a great day at work!"
