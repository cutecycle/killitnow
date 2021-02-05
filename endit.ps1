# just close everything
$exceptions="Teams","powershell"

function endit {
    $parent = (gwmi win32_process | ? processid -eq  $PID).parentprocessid
    $procs = (Get-Process | Where-Object { $_.MainWindowTitle -ne "" } | Where-Object { $_.Pid -ne $PID } | Where-Object { $_.Id -ne $parent }| Where-Object {$_.ProcessName -NotIn $exceptions})
    $procs
    Stop-Process $procs -ErrorAction SilentlyContinue
}
