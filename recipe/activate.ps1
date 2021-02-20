$Env:GEM_HOME=$(Join-Path -Path $Env:CONDA_PREFIX -ChildPath share/rubygems)
$Env:PATH="$(Join-Path -Path $Env:CONDA_PREFIX -ChildPath share/rubygems/bin);$Env:PATH"