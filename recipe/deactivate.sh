if [ "$ZSH_VERSION" != "" ]; then
    unset GEM_HOME
    path=(${path[@]:#"$CONDA_PREFIX/Library/share/rubygems/bin"})
    path=(${path[@]:#"$CONDA_PREFIX/share/rubygems/bin"})
else
    # Taken from http://www.linuxfromscratch.org/blfs/view/svn/postlfs/profile.html
    # Functions to help us manage paths.  Second argument is the name of the
    # path variable to be modified (default: PATH)
    pathremove () {
            local IFS=':'
            local NEWPATH
            local DIR
            local PATHVARIABLE=${2:-PATH}
            for DIR in ${!PATHVARIABLE} ; do
                    if [ "$DIR" != "$1" ] ; then
                      NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
                    fi
            done
            export $PATHVARIABLE="$NEWPATH"
    }
    unset GEM_HOME
    pathremove "$CONDA_PREFIX/Library/share/rubygems/bin"
    pathremove "$CONDA_PREFIX/share/rubygems/bin"
fi