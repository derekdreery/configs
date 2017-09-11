
# Add to path conditionally
#
# The idea is that I noticed my $PATH to contain clutter, and something output
# from "env" like programs makes me scrollblind as it shows irrelevant output.
#
# An by-arash-improved version of http://superuser.com/a/39995/97600
if [[ -d "$1" ]] &&  [[ ":$PATH:" != *":$1:"* ]];
then
    export PATH="$1:$PATH"
fi
