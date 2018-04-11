# VCellID-linux
This is meant to aid compilation of VCell-ID v0.4 in GNU/linux systems

Unlike cellID, VCellID can be conpiled with autotools directly, as it comes preconfigured.

## Credits
The cellID developers ([link to publication](http://dx.doi.org/10.1002/0471142727.mb1418s100))
The original source can be found at sourceforge ([link](https://sourceforge.net/projects/cell-id/))

## Download Source
Use the provided script to download the entire contents of the Sourceforge repo.
`sourceforge-file-downloader.sh cell-id`

## Dependencies
Disclaimer: it is possible that not all of the installed packages are strictly required. I have not yet checked, but surely the "-dev" ones are essential.

I have made use of autotools, and have installed the following packages:
* automake: 1:1.15-4ubuntu1
* autoconf: 2.69-9
* libtool: 2.4.6-0.1

You may install these in Ubuntu systems by running:

`sudo apt-get install automake autoconf libtool`

The configure.ac and Makefile.am files have been set to require libtiff5-dev, libopenlibm-dev, and libglib2.0-dev.
* libglib2.0-dev: 2.48.2-0ubuntu1
* libtiff5-dev: 4.0.6-1ubuntu0.4
* libopenlibm-dev: 0.5.0+dfsg-2
* gtkimageview 1.6.4-5

You may install these in Ubuntu systems by running:

`sudo apt-get install libglib2.0 libglib2.0-dev libtiff5 libtiff5-dev libopenlibm-dev gtkimageview`

These dependencies can also be satisfied in Arch Linux (sorry for not providing instructions).

### Notes

You may find details on how the automake/conf files are configured by opening them and reading the comments.

Surprisingly, although packages are installed using one name (such as libtiff5) the name that configure.ac can find may be another one (such as libtiff-4).

## Build and Install

To build and install, please cd into the directory where the files are and run:

    ./configure
    make -j8
    sudo make install

Please refer to the cellID documentation to learn how to use this program.

Cheers!