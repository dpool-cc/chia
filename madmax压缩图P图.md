# madMAx43v3r-gigahorse 压缩图指南

## 准备工作

### 硬件（纯内存）

- 显卡显存（VRAM）不小于**8G**，N卡

- 内存（RAM）不小于**256GB**
  
- CPU无要求 

  经测试，256GB 1600 DDR3， 3060 12G 可以3分钟生成一个等级8（71.3GiB）的压缩图

###	软件

    安全起见,请在单独的机器上运行闭源软件（包括压缩图的plotter软件和farmer软件）

- 用官方钱包创建一个新的钱包密钥，专用于压缩图的p图和挂机

- 登陆新钱包，创建一个启动器（plotnft）

- 记录新钱包的农民密钥和新创建的启动器合约地址

- 下载压缩图plotter程序（K32)到单独的机器上

#### Linux

```bash
wget https://github.com/madMAx43v3r/chia-gigahorse/blob/master/cuda-plotter/linux/x86_64/cuda_plot_k32
```

#### Windows

浏览器打开下载地址

```
https://github.com/madMAx43v3r/chia-gigahorse/blob/master/cuda-plotter/windows/cuda_plot_k32.exe

```

其他size、系统的plotter软件，从https://github.com/madMAx43v3r/chia-gigahorse/blob/master/cuda-plotter


## 使用方法（Linux）

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

./cuda_plot_k32 -f ab7c1167cdae2a8d26a6705979ec42c566bb17eed96034f91c0b0df778d154620fd917e720e5e11d941961699db3c79a -c    xch1c5xf378dc5d2nu4g9n5em7zsq39xdqpwh6lk529lr24hhz6lsx0sqjkzda -t /mnt/ssd/plots/ -C 8 -d /mnt/hdd1/plots/ -n 1

```

显卡压缩图的生成速度一般大于单个机械硬盘的写入速度，如果按180秒（系统配置3060_12G + 256_ddr3_1600）生成一个C8压缩图(71.3Gib)

计算,需要3个机械硬盘同时接收plotp图的时候可以通过-d设置多个机械硬盘Plot目录，gigahorse会从临时目录并行分发plot文件。p图过程中

可以卸载更换机械硬盘，gigahorse会检测每个目标目录的可用状态，当plot目标目录重新挂载后仍能正常分发plot。以下命令一直p图，并设置

3个机械盘plot目录：

```bash

./cuda_plot_k32 -f ab7c1167cdae2a8d26a6705979ec42c566bb17eed96034f91c0b0df778d154620fd917e720e5e11d941961699db3c79a -c  xch1c5xf378dc5d2nu4g9n5em7zsq39xdqpwh6lk529lr24hhz6lsx0sqjkzda -t /mnt/ssd/plots/ -C 8 -n -1 -d /mnt/hdd1/plots/ -d /mnt/hdd2/plots/ -d /mnt/hdd3/plots/

```

附：[简易的p图脚本](https://github.com/dpool-cc/chia/blob/main/cuda_madmax.sh)，修改脚本里的农民公钥和合约地址


更详细的操作可以参考Madmax-Gigahorse的[Github](https://github.com/madMAx43v3r/chia-gigahorse)

## 待续：

Windows操作说明

半内存P图

远程分发工具[Plot-sink](https://github.com/madMAx43v3r/chia-plot-sink)


## 技术交流

QQ群: 198579

Telegram:  https://t.me/dpool_cc
