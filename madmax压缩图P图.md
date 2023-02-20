# madMAx43v3r-gigahorse 压缩图指南

## 准备工作

### 硬件（纯内存）

显卡显存（VRAM）不小于**8G**，N卡；内存（RAM）不小于**256GB**；CPU无要求 

推荐显卡: 1.闲置的8GB显存的显卡 2. 3060、3060ti 

###	软件

安全起见,请在单独的机器上运行闭源软件（包括压缩图的plotter软件和farmer软件）

1.用官方钱包创建一个新的钱包密钥，专用于压缩图的p图和挂机

2.登陆新钱包，创建一个启动器（plotnft）

3.记录新钱包的农民密钥和启动器的合约地址

4.下载压缩图p图软件软件

#### Linux

```bash
wget https://github.com/madMAx43v3r/chia-gigahorse/blob/master/cuda-plotter/linux/x86_64/cuda_plot_k32
```

#### Windows


https://github.com/madMAx43v3r/chia-gigahorse/blob/master/cuda-plotter/linux/x86_64/cuda_plot_k32


其他size、系统的plotter软件，从https://github.com/madMAx43v3r/chia-gigahorse/blob/master/cuda-plotter


madMAx43v3r的GPU-plotter使用方法和madMAx43v3r的CPU-plotter图工具用法类似，--help打印使用说明

```bash
./cuda_plot_k32 --help
Chia k32 next-gen CUDA plotter mmx-v2.4 - e161e4b

For <poolkey> and <farmerkey> see output of `chia keys show`.
To plot for pools, specify <contract> address via -c instead of <poolkey>, see `chia plotnft show`.
In case of <count> != 1, you may press Ctrl-C for graceful termination after current plot is finished,
or double press Ctrl-C to terminate immediately.


Usage:
  cuda_plot [OPTION...]

  -C, --level arg      Compression level (default = 1, min = 1, max = 9)
  -x, --port arg       Network port (default = 8444, chives = 9699, MMX =
                       11337)
  -n, --count arg      Number of plots to create (default = 1, -1 = infinite)
  -g, --device arg     CUDA device (default = 0)
  -r, --ndevices arg   Number of CUDA devices (default = 1)
  -t, --tmpdir arg     Temporary directory for plot storage (default = $PWD)
  -2, --tmpdir2 arg    Temporary directory 2 for hybrid mode (default = @RAM)
  -d, --finaldir arg   Final destinations (default = <tmpdir>, remote =
                       @HOST)
  -z, --dstport arg    Destination port for remote copy (default = 1337)
  -w, --waitforcopy    Wait for copy to start next plot
  -p, --poolkey arg    Pool Public Key (48 bytes)
  -c, --contract arg   Pool Contract Address (62 chars)
  -f, --farmerkey arg  Farmer Public Key (48 bytes)
  -Z, --unique         Make unique plot (default = false)
  -S, --streams arg    Number of parallel streams (default = 4, must be >= 2)
  -Q, --maxtmp arg     Max number of plots to cache in tmpdir (default = -1)
  -M, --memory arg     Max shared / pinned memory in GiB (default =
                       unlimited)
      --version        Print version
      --help           Print help

```

使用示例：压缩等级8, 临时目录/mnt/ssd/plots, Plot目录/mnt/hdd1/plots, p图数量1

```bash

./cuda_plot_k32 -f ab7c1167cdae2a8d26a6705979ec42c566bb17eed96034f91c0b0df778d154620fd917e720e5e11d941961699db3c79a -c  \    xch1c5xf378dc5d2nu4g9n5em7zsq39xdqpwh6lk529lr24hhz6lsx0sqjkzda -t /mnt/ssd/plots -C 8 -d /mnt/hdd1/plots -r 1 -n 1

```

显卡压缩图的生成速度一般大于单个机械硬盘的写入速度，如果按180秒（系统配置3060_12G + 256_ddr3_1600）生成一个C8压缩图(71.3Gib)计算,需要3个机械硬盘同时接收plot

p图的时候可以通过-d设置多个机械硬盘Plot目录，gigahorse会将plot文件从临时目录并行分发

```bash

./cuda_plot_k32 -f ab7c1167cdae2a8d26a6705979ec42c566bb17eed96034f91c0b0df778d154620fd917e720e5e11d941961699db3c79a -c  \    xch1c5xf378dc5d2nu4g9n5em7zsq39xdqpwh6lk529lr24hhz6lsx0sqjkzda -t /mnt/ssd/tmp -C 8 -d /mnt/ssd/plots -r 1 -n 10

```

## 待续：

更详细的操作可以参考[Gigahorse-Github](https://github.com/madMAx43v3r/chia-gigahorse)

Gigahorse配套了plot远程分发工具[plot-sink](https://github.com/madMAx43v3r/chia-plot-sink)

如果系统内存小于256G，可以通过-2 -3设置固态来进行p图

Windows的压缩图p图操作说明

## 技术交流

QQ群: 198579

Telegram:  https://t.me/dpool_cc
