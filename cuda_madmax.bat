@echo on

chcp 65001

REM madmax压缩图P图脚本，QQ群198579

:: p图程序路径
set plotter="C:\chia-gigahorse-1.6.2.giga4\cuda-plotter\windows\cuda_plot_k32.exe"

:: 农民公钥
set farmerKey="ab7c1167cdae2a8d26a6705979ec42c566bb17eed96034f91c0b0df778d154620fd917e720e5e11d941961699db3c79a"
:: plotnft合约地址

set contractKey="xch1c5xf378dc5d2nu4g9n5em7zsq39xdqpwh6lk529lr24hhz6lsx0sqjkzda"
:: 农田转存目录（一般是ssd）
set tmpDir=D:\ssd\plots\

:: 农田目标目录，多个目录用单个空格隔开
set destDir=D:\hdd1\plots\

:: 压缩等级
set C=8

:: 待p农田数量, -1表示无限
set n=-1


:: 共享显存
set M=0

:: 打印帮助信息
:: %plotter% --help

%plotter%  -f  %farmerKey%  -c %contractKey%   -t %tmpDir%  -d %destDir%   -C %C%  -M %M% -n %n% 
