#!/bin/sh

pkg=Matrix
if [ ! -f DESCRIPTION -o -z "$(grep "^Package: ${pkg}$" DESCRIPTION)" ]; then
	echo "script must be run in package [${pkg}] root directory"
	exit 1
fi
root=$(pwd)
smk=inst/scripts/sources.mk
rmk=inst/scripts/rules.mk
echo "Getting source file names from ${smk} ..."
lst=$(cat ${smk}| sed -E "1d;s/^[\t ]*([^ ]*[.]c).*$/\1/")
for file in ${lst}; do
	echo "  ${file}"
done
echo "done"
if [ -f ${out} ]; then
	echo "Moving existing ${rmk} to ${rmk}.bak ..."
	mv ${rmk} ${rmk}.bak
	echo "done"
fi
R=R
include1="$(${R} RHOME)/include"
include2="SuiteSparse/SuiteSparse_config"
echo "Writing gcc -MM output to ${rmk} for inclusion in src/Makevars ..."
echo "===="
echo "## Generated by ./rules.sh :" | tee ${rmk}
cd src
for file in ${lst}; do
	if [ -f ${file} ]; then
		gcc -I${include1} -I${include2} -MM ${file} |
			sed -E "s~${include1}/[^ ]*[.]h( |$)~~g;\~^[\t ]*\\\\$~d" |
			tee -a ../${rmk}
	else
		echo "## missing ${file}" | tee -a ../${rmk}
	fi
done
cd ..
echo "===="
echo "done"