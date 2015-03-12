Here I publish some of my MATLAB codes. Feel free to reuse them under the terms of the GPL.

Using Linux you can install the functions for example like this:
```
# determine MATLAB path
MATLAB_ROOT=`mex -v 2>&1 | grep "MATLAB " | awk '{print $4}' | sed -e '2,$d'`
cd $MATLAB_ROOT/toolbox/
# Checkout the repository
sudo svn checkout http://mwmatlab.googlecode.com/svn/trunk/ mwmatlab
# make pathdef.m writable
sudo chmod a+rw $MATLAB_ROOT/toolbox/local/pathdef.m
# add all folders from in 1-source to the MATLAB path
matlab -nosplash -nodesktop -r "addpath(genpath('$MATLAB_ROOT/toolbox/mwmatlab'));savepath;"
```