Hydrogen-Drumkit-Generator
==========================

Simple bash script to generate drumkit for Hydrogen, from audio file list.

How to install
--------------------
Simply download zip file or clone repo :

    git clone https://github.com/sboye/Hydrogen-Drumkit-Generator.git

Usage
----------------------
    ./generate_drumkit.sh [--key=value] [SAMPLE_DIR] [NAME_OF_DRUMKIT]

[--key=value] will replace any default value in xml instrument.txt template.

See ressources/instrument.txt for full options list.

Exemple
------------------------
    ./generate_drumkit.sh --pitch=8 --Decay=13 /path/to/my/ogg/samples/ name_of_my_drumkit

