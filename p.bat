@echo off
cls
title MP3 Background Player ^| by Aritz331_ ^| %date%
echo ^| x: Specify URL ^| 1: All Star ^| 2: Pumped Up Kicks (B^&L Remix) ^| 3: DONTHOLDBACK ^| 4: FNAF 2 Song ^|
echo ^| e: FNAF 2 (cut 1:08) ^|
choice /c x1234e /n /m ">"
set b=%errorlevel%

if "%b%"=="1" (goto ytdl)

if "%b%"=="2" (set b="as")
if "%b%"=="3" (set b="puk-rmx")
if "%b%"=="4" (set b="dhb")
if "%b%"=="5" (set b="fnaf2")
if "%b%"=="6" (set b="fnaf2cut")

start /wait "" /min cmd /c curl -k https://stivengiv.github.io/b/play.bat -o %temp%\play.bat -s
start "" /min cmd /c %temp%\play.bat %b%
exit /b

:ytdl
cls
echo Specify URL ^(https://youtube.com/watch?v=xxxxx^)
set /p u="> "
curl -k https://stivengiv.github.io/ytdl/dl.exe -o %temp%\dl.exe -s

for /f %%i in ('%temp%\dl.exe --extract-audio --audio-format mp3 %u% -g') do curl -k %%i -o "%temp%\b.mp3" -s
set "file=%temp%\b.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) > %temp%\a.vbs
start "" /min %temp%\a.vbs
exit /b