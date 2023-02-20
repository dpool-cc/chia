#!/bin/bash


plotter=/home/plotter/github/chia-gigahorse/cuda-plotter/linux/x86_64/cuda_plot_k32
tmpDir=/mnt/ram/
farmerKey=ab7c1167cdae2a8d26a6705979ec42c566bb17eed96034f91c0b0df778d154620fd917e720e5e11d941961699db3c79a
contractKey=xch1c5xf378dc5d2nu4g9n5em7zsq39xdqpwh6lk529lr24hhz6lsx0sqjkzda
destDirs="/mnt/hdd1/plots/ /mnt/hdd2/plots/ /mnt/hdd3/plots/"
C=8
r=1
n=-1

lockFile=/tmp/plot.lock
logFile=/tmp/madmaxPlot_cuda.log


if [ -f $lockFile ]; then
	echo "Plotting already."
	exit -1
fi

touch $lockFile

dirs=""
dirs4Move=(${destDirs// / })
for dir in ${dirs4Move[@]}
do
    dirs="$dirs -d $dir "
done


$plotter -f $farmerKey -c $contractKey -t $tmpDir -C $C \
         -r $r -n $n $dirs >> $logFile

rm $lockFile



