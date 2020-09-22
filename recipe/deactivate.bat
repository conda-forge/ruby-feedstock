@echo off

set GEM_HOME=

rem remove the bin folder from path
set removedir=%CONDA_PREFIX%\Library\share\rubygems\bin
setlocal enableextensions enabledelayedexpansion
set _=!PATH:%removedir%;=!
if "%_%" == "%PATH%" set _=!PATH:;%removedir%=!
endlocal & set PATH=%_%