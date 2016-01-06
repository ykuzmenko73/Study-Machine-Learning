This patch fixes the "Peer certificate" issue with the submit.m script for Windows-like systems.
The patch was first developed by Liran Moysi.
Instructions:

1) Extract the contents of this zip file to the "machine-learning-ex?/ex?/" folder 
for each programming exercise.  Be sure you preserve the folder attributes and the
other files in that subfolder.

This patch will overwrite these two existing files:
  lib/makeValidFieldName.m
  lib/jsonlab/loadjson.m
  lib/submitWithConfiguration.m

It will add the following new file:
  lib/xxNumToHexStr.m


2) Restart Octave or MATLAB after installing the patch.
