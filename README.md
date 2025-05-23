# SwitchAudio

## Описание

Этот скрипт создан для переключения аудио девайса, по нажатию любой кнопки на клавиатуре.
Работает моментально и выводит уведомление.

Скачать zip ахив можно - [тут](https://github.com/clay1299/switch-audio-device/releases/download/SwitchAudioRelease/SwitchAudioRelease.zip)

## Установка 
Для начала нужно установить [ahk](https://www.autohotkey.com/) для отслеживания нажатий кнопок.
Далее заходим в powershell с правами администратора и устанавливаем модуль:
```
Install-Module AudioDeviceCmdlets
```
Теперь в том же powershell нужно выполнить комманду:
```
Get-AudioDevice -List
```
Комманда выведет список всех устройств, находим нужные и копируем поле __Name__
_если имя устройства на русском языке, то скрипт рабоать не будет, устройство можно переименовать в параметрах звука_

Теперь в файле SwitchAudio.ps1 нужно заменить эти имена тут:
```
$deviceMap = @{
        "Headphones" = $devices | Where-Object { $_.Name -eq "Dinamic (High Definition Audio Device)" }
        "TV"        = $devices | Where-Object { $_.Name -eq "SAMSUNG (NVIDIA High Definition Audio)" }
```
Так же замените путь в котром будет храниться кэш.
```
$cachePath = "$env:D:\script\SwitchAudio\audio_devices_cache.xml"
```
Теперь можно запускать файл startSwitchAudio.ahk и при нажатии * на нумпаде будет сменяться аудио канал, так же автоматически создасться кэш файл.

## Рекомендации 

1. Поставить ahk скрипт на авто загрузку, что бы он постоянно работал с момента запуска компьютера(для скрипта не нужно прав администратора).

2. Вы можете изменить кнопку по которой будет активироваться скрипт. Для этого в файле startSwitchAudio.ahk нужно заменить эту строчку:
```
NumpadMult::
```
поставить можно любую вам удобную кнопку, их можно посмотреть в официальной [документации](https://ahk-wiki.ru/keylist).



