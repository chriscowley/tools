#!/bin/bash
#title : package-update.sh
#description : Updates a the package specified in the first arguament to
#              the version in the second arguament
#author :Chris Cowley
#date :20130312
#version :0.1
#usage :./package-update.sh <package> <version>
#notes :
#bash_version :4.1.2(1)-release
#============================================================================

package=$1
version=$2

yum -qy update $package $version
