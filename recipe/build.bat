setlocal enableextensions

CALL win32\configure.bat --prefix=%PREFIX%
if %errorlevel% neq 0 exit /b %errorlevel%

nmake
if %errorlevel% neq 0 exit /b %errorlevel%

nmake install
if %errorlevel% neq 0 exit /b %errorlevel%

if not exist "%PREFIX%\etc" (
    mkdir "%PREFIX%\etc"
    if %errorlevel% neq 0 exit /b %errorlevel%
)

if not exist "%PREFIX%\share\rubygems" (
    mkdir "%PREFIX%\share\rubygems"
    if %errorlevel% neq 0 exit /b %errorlevel%
)

echo "gemhome: %PREFIX%/share/rubygems" > %PREFIX%/etc/gemrc
if %errorlevel% neq 0 exit /b %errorlevel%

setlocal EnableDelayedExpansion
:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
    if %errorlevel% neq 0 exit /b %errorlevel%

    :: Copy unix shell activation scripts, needed by Windows Bash users
    copy %RECIPE_DIR%\%%F.sh %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.sh
    if %errorlevel% neq 0 exit /b %errorlevel%

    :: Copy unix shell activation scripts, needed by Windows Bash users
    copy %RECIPE_DIR%\%%F.ps1 %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.ps1
    if %errorlevel% neq 0 exit /b %errorlevel%
)