# PowerShell script to monitor disk usage on a Windows VM
# Prints disk usage for all drives every 10 seconds

function Get-DiskUsageInfo {
    Get-PSDrive -PSProvider 'FileSystem' | ForEach-Object {
        $usedGB = ($_.Used / 1GB)
        $freeGB = ($_.Free / 1GB)
        $totalGB = ($_.Used + $_.Free) / 1GB
        $percentUsed = if ($totalGB -ne 0) { ($usedGB / $totalGB * 100) } else { $null }
        [PSCustomObject]@{
            Drive        = $_.Name
            UsedGB       = "{0:N2}" -f $usedGB
            FreeGB       = "{0:N2}" -f $freeGB
            TotalGB      = "{0:N2}" -f $totalGB
            PercentUsed  = if ($percentUsed) { "{0:N1}" -f $percentUsed } else { 'N/A' }
        }
    }
}

Write-Host "Starting disk usage monitoring... (Press Ctrl+C to stop)"

while ($true) {
    Write-Host ("------ {0} ------" -f (Get-Date))
    Get-DiskUsageInfo | ForEach-Object {
        Write-Host ("Drive {0}: Used {1} GB, Free {2} GB, Total {3} GB, Used {4}%" -f $_.Drive, $_.UsedGB, $_.FreeGB, $_.TotalGB, $_.PercentUsed)
    }
    Write-Host "-----------------------------"
    Start-Sleep -Seconds 10
}
