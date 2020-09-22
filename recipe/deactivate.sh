unset GEM_HOME

# Read PATH and split by : to array env_path
IFS=':' read -ra env_path <<< "$PATH"

PATH=""
for dir in "${env_path[@]}"; do
    if [[ $dir != "${CONDA_PREFIX}/share/rubygems/bin" ]]; then
        PATH="${PATH:+$PATH:}$dir"
    fi
    # Windows case
    if [[ $dir != "${CONDA_PREFIX}/Library/share/rubygems/bin" ]]; then
        PATH="${PATH:+$PATH:}$dir"
    fi
done

export PATH