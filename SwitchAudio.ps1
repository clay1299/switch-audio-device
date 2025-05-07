Import-Module AudioDeviceCmdlets

$cachePath = "$env:D:\script\SwitchAudio\audio_devices_cache.xml"

if (Test-Path $cachePath) {
    $deviceMap = Import-Clixml -Path $cachePath
} else {
    $devices = Get-AudioDevice -List
    $deviceMap = @{
        "Headphones" = $devices | Where-Object { $_.Name -eq "Dinamic (High Definition Audio Device)" }
        "TV"        = $devices | Where-Object { $_.Name -eq "SAMSUNG (NVIDIA High Definition Audio)" }
    }
    $deviceMap | Export-Clixml -Path $cachePath
}

$currentDevice = Get-AudioDevice -Playback
try {
    if ($currentDevice.ID -eq $deviceMap["Headphones"].ID) {
        Set-AudioDevice -ID $deviceMap["TV"].ID
    } else {
        Set-AudioDevice -ID $deviceMap["Headphones"].ID
    }
} catch {
    Remove-Item $cachePath -Force
}
