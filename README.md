Hydrogen-Drumkit-Generator
==========================

Simple bash script to generate simple drumkit for Hydrogen, from audio file list (.ogg, .wav or .flac).
This script currently generates one layout per instrument.
You can customize instruments properties with "--" option, see "Usage" for more details.

How to install
--------------------
Simply download zip file or clone repo :

    git clone https://github.com/sboye/Hydrogen-Drumkit-Generator.git

You must give execution rights on file generate_drumkit.sh :

    chmod u+x generate_drumkit.sh

Usage
----------------------
    ./generate_drumkit.sh [--key=value] [SAMPLE_DIR] [NAME_OF_DRUMKIT]

[--key=value] will replace any default value in _ressources/instrument.txt_ xml template.

See
[ressources/instrument.txt](https://github.com/sboye/Hydrogen-Drumkit-Generator/blob/master/ressources/instrument.txt) for full options list.

Example
------------------------
    ./generate_drumkit.sh --pitch=8 --Decay=13 /path/to/my/samples/ name_of_my_drumkit

