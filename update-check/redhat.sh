#!/bin/bash
while getopts ":h" opt
do
  case $opt in
    h)
      human=1
      ;;
    \?)
      echo "Invalid option : -%OPTARG" >&2
      exit 4
      ;;
  esac
done
YUM="yum -q"

if [[ $human ]]
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
    if [[ $human ]]
    then
      printf "%-40s| %-30s| %-30s\n" $package $localversion $repoversion
    else
      echo $package $localversion $repoversion
    fi
  fi
done 
