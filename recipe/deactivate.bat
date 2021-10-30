@echo off
goto start:

@REM code below borrowed from https://stackoverflow.com/a/1430570 (CC-BY-SA 2.5)
@REM Author: Cheeso, Sep 16, 2009

:removeFromPath
SETLOCAL ENABLEDELAYEDEXPANSION

@REM  ~fs = remove quotes, full path, short names
set fqElement=%~fs1

@REM convert path to a list of quote-delimited strings, separated by spaces
set fpath="%PATH:;=" "%"

@REM iterate through those path elements
for %%p in (%fpath%) do (
    @REM  ~fs = remove quotes, full path, short names
    set p2=%%~fsp
    @REM is this element NOT the one we want to remove?
    if /i NOT "!p2!"=="%fqElement%" (
        if _!tpath!==_ (set tpath=%%~p) else (set tpath=!tpath!;%%~p)
    )
)

set path=!tpath!
ENDLOCAL & set path=%tpath%
goto :EOF

:start
set GEM_HOME=
call :removeFromPath "%CONDA_PREFIX%\share\rubygems\bin"