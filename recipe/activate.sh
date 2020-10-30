if [ -z "$COMSPEC" ]; then
	export GEM_HOME=$CONDA_PREFIX/share/rubygems/
	export PATH="$CONDA_PREFIX/share/rubygems/bin:$PATH"
else
	export GEM_HOME=$CONDA_PREFIX/Library/share/rubygems/
	export PATH="$CONDA_PREFIX/Library/share/rubygems/bin:$PATH"
fi