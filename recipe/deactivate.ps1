try { Remove-Item env:GEM_HOME}
catch { Write-Host "Failed to execute Remove-Item env:GEM_HOME" }
$rmpath = $(Join-Path -Path $Env:CONDA_PREFIX -ChildPath Library/share/rubygems/bin)
$Env:PATH = ($Env:PATH.Split(';') | Where-Object { $_ -ne $rmpath }) -join ';'
$rmpath = $(Join-Path -Path $Env:CONDA_PREFIX -ChildPath share/rubygems/bin)
$Env:PATH = ($Env:PATH.Split(';') | Where-Object { $_ -ne $rmpath }) -join ';'