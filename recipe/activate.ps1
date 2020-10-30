if (Test-Path env:COMSPEC) {
    $Env:GEM_HOME=$(Join-Path -Path $Env:CONDA_PREFIX -ChildPath Library/share/rubygems)
    $Env:PATH="$(Join-Path -Path $Env:CONDA_PREFIX -ChildPath Library/share/rubygems/bin);$Env:PATH"
} else {
    $Env:GEM_HOME=$(Join-Path -Path $Env:CONDA_PREFIX -ChildPath share/rubygems)
    $Env:PATH="$(Join-Path -Path $Env:CONDA_PREFIX -ChildPath share/rubygems/bin);$Env:PATH"
}