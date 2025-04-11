#NoEnv
#SingleInstance Force
#KeyHistory 0
ListLines Off
Process, Priority, , A

NumpadMult::
Run, powershell.exe -ExecutionPolicy Bypass -File "SwitchAudio.ps1" -Verb RunAs,, Hide
TrayTip, Notice, Audio channel changed, 1, 1