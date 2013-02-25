#!/bin/bash
#!/bin/bash -
#title          :red_hat_update_check.sh
#description    :Checks for package updates from Yum repos on RHEL and similar systems
#author         :Chris Cowley
#date           :20130225
#version        :0.1
#usage          :./red_hat_update_check.sh (-q -h)
#notes          :
#bash_version   :4.1.2(1)-release
#============================================================================




while getopts ":qhv" opt
do
  case $opt in
    q)
      quiet=1
      ;;
    h)
      echo "Usage:"
      echo "No aruments: human readable output"
      echo "-q: quiet, simple output suitable for machine reading"
      echo "-h: shows this help"
      exit 1
      ;;
    v)
      verbose=1
      ;;
    \?)
      echo "Invalid option : -%OPTARG" >&2
      exit 1
      ;;
  esac
done

if [[ $verbose ]]
then
  YUM="yum -v"
else
  YUM="yum -q"
fi

if [[ ! $quiet ]]
then 
  printf "%-40s| %-30s| %-30s\n" "Package" "Installed" "Available"
  count=1
  while [[ $count -lt 107 ]]
  do
    printf "%s" "-"
    (( count++ ))
  done
  printf "\n"
fi

$YUM check-update |  while read inrec
do
  if [[ `echo $inrec | awk '{ print NF }'` -gt 0 ]]
  then
    package=`echo $inrec | awk '{print $1}'`
    repoversion=`echo $inrec | awk '{print $2}'`
    localversion=`yum list installed | grep $package | awk '{print $2}'`
    if [[ $quiet ]]
    then
      echo $package $localversion $repoversion
    else
      printf "%-40s| %-30s| %-30s\n" $package $localversion $repoversion
    fi
  fi
done 
