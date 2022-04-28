echo "Alterando política de execução de script do PowerShell"
Start-Process powershell -Args "Set-ExecutionPolicy RemoteSigned" -Verb RunAs -Wait -WindowStyle Hidden
Get-ExecutionPolicy
timeout 3