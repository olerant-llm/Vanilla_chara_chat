@echo off
setlocal EnableDelayedExpansion

set "PORT=8000"
set "ROOT=%~dp0"
set "LOG=%ROOT%server-log.txt"
set "PY_CMD="
set "HTML_FILE="
set "HTML_CHOICE="
set "HTML_COUNT=0"

cd /d "%ROOT%"

echo Available apps:
for /f "delims=" %%F in ('dir /b /a-d *.html 2^>nul') do (
  set /a HTML_COUNT+=1
  set "HTML_!HTML_COUNT!=%%F"
  echo !HTML_COUNT!. %%F
)
echo.

if "%HTML_COUNT%"=="0" (
  echo No HTML files were found in this folder.
  pause
  exit /b 1
)

set /p "HTML_CHOICE=Select number [1]: "
if "!HTML_CHOICE!"=="" set "HTML_CHOICE=1"

for /f "delims=0123456789" %%A in ("!HTML_CHOICE!") do (
  echo Invalid selection: !HTML_CHOICE!
  pause
  exit /b 1
)

if !HTML_CHOICE! LSS 1 (
  echo Invalid selection: !HTML_CHOICE!
  pause
  exit /b 1
)

if !HTML_CHOICE! GTR !HTML_COUNT! (
  echo Invalid selection: !HTML_CHOICE!
  pause
  exit /b 1
)

set "HTML_FILE=!HTML_%HTML_CHOICE%!"

if not exist "!HTML_FILE!" (
  echo File not found: !HTML_FILE!
  echo Put this bat file in the same folder as the HTML file.
  pause
  exit /b 1
)

set "URL=http://localhost:%PORT%/!HTML_FILE!"

echo start-local-server > "%LOG%"
echo folder=%ROOT% >> "%LOG%"
echo html=!HTML_FILE! >> "%LOG%"
echo url=%URL% >> "%LOG%"

rem ---- Python detection ----
rem 1) py launcher first (not affected by the Microsoft Store alias)
where py >nul 2>nul
if not errorlevel 1 (
  py -3 --version >> "%LOG%" 2>&1
  if not errorlevel 1 (
    set "PY_CMD=py -3"
    goto run_server
  )
)

rem 2) python on PATH, but skip the Microsoft Store stub (WindowsApps)
for /f "delims=" %%P in ('where python 2^>nul') do (
  set "CANDIDATE=%%P"
  echo !CANDIDATE! | find /i "WindowsApps" >nul
  if errorlevel 1 (
    "!CANDIDATE!" --version >> "%LOG%" 2>&1
    if not errorlevel 1 (
      set "PY_CMD=python"
      goto run_server
    )
  )
)

rem ---- Python not found ----
echo.
echo ============================================================
echo  Python がインストールされていないため、起動できません。
echo.
echo  このローカルサーバーの実行には Python 3 が必要です。
echo  下記からインストールしてください:
echo    https://www.python.org/downloads/
echo.
echo  ※ インストール時に "Add python.exe to PATH" に
echo     必ずチェックを入れてください。
echo  ※ Microsoft Store 版ではなく python.org 版を推奨します。
echo ============================================================
echo.
echo python-not-found >> "%LOG%"
pause
exit /b 1

:run_server
echo command=%PY_CMD% -m http.server %PORT% >> "%LOG%"
echo Starting local server...
echo URL: %URL%
echo Log: %LOG%
echo.
echo Press Ctrl+C to stop the server.
echo.

start "" "%URL%"

%PY_CMD% -m http.server %PORT%
set "EXIT_CODE=%ERRORLEVEL%"

echo exit-code=%EXIT_CODE% >> "%LOG%"
echo.
echo Server stopped or failed with error code %EXIT_CODE%.
echo See server-log.txt for details.
pause
exit /b %EXIT_CODE%
