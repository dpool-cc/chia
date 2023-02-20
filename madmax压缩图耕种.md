# madMAx43v3r-gigahorse压缩图耕种指南


## 耕种准备

### 硬件

目前压缩图的解压是在收割机进行，以下的硬件要求主要针对挂盘的收割机

#### GPU挂图

待续

### CPU挂图

待续

###	软件

  安全起见,请在单独的机器上运行闭源软件（包括压缩图的plotter软件和farmer软件）

- 用官方钱包创建一个新的钱包密钥，专用于压缩图的p图和挂机

- 登陆新钱包，创建一个启动器（plotnft）

- 记录新钱包的农民密钥和新创建的启动器合约地址

- 将已经同步好的节点数据文件(blockchain_v2_mainnet.sqlite)拷贝到机器上，节点数据文件是通用的

- madmax压缩图farmer客户端和官方客户端不兼容，二者不能同时运行

## 开始耕种

#### Linux

目前测试平台为ubuntu20.04 Lts，其他版本请相应修改

安装libgomp1

```
sudo apt install libgomp1
```

下载[madmax-farmer软件](https://github.com/madMAx43v3r/chia-gigahorse/releases/download/v1.6.2.giga4/chia-gigahorse-farmer-1.6.2.giga4-x86_64.tar.gz)

```bash
    wget https://github.com/madMAx43v3r/chia-gigahorse/releases/download/v1.6.2.giga4/chia-gigahorse-farmer-1.6.2.giga4-x86_64.tar.gz
    tar -xvf chia-gigahorse-farmer-1.6.2.giga4-x86_64.tar.gz
    cd chia-gigahorse-farmer-1.6.2.giga4-x86_64
    ./chia.bin --help
```

压缩图farmer客户端的chia.bin和官方的chia命令行使用方法基本一致

```
Usage: chia.bin [OPTIONS] COMMAND [ARGS]...

  Manage chia blockchain infrastructure (1.6.2.giga4)

Options:
  --root-path PATH            Config file root  [default:
                              /home/plotter/.chia/mainnet]
  --keys-root-path PATH       Keyring file root  [default:
                              /home/plotter/.chia_keys]
  --passphrase-file FILENAME  File or descriptor to read the keyring
                              passphrase from
  -h, --help                  Show this message and exit.

Commands:
  configure   Modify configuration
  data        Manage your data
  db          Manage the blockchain database
  farm        Manage your farm
  init        Create or migrate the configuration
  keys        Manage your keys
  netspace    Estimate total farmed space on the network
  passphrase  Manage your keyring passphrase
  peer        Show, or modify peering connections
  plotnft     Manage your plot NFTs
  plots       Manage your plots
  plotters    Advanced plotting options
  rpc         RPC Client
  run_daemon  Runs chia daemon
  show        Show node information
  start       Start service groups
  stop        Stop services
  version     Show chia version
  wallet      Manage your wallet

  Try 'chia start node', 'chia netspace -d 192', or 'chia show -s'

```
如果这个机器上没有~/.chia数据目录，输入初始化命令来生成

```
./chia.bin init
```

复制节点数据文件

```
cp  ~/blockchain_v2_mainnet.sqlite  ~/.chia/mainnet/db/
```

输入密钥添加命令，导入新钱包的24个助记词

```bash
./chia.bin keys add
```

添加农田目录

```
./chia.bin plots add -d /mnt/hdd1/plots
./chia.bin plots add -d /mnt/hdd2/plots
./chia.bin plots add -d /mnt/hdd3/plots

```

启动耕种

```
./chia.bin start farmer
```

查看耕种状态

```
./chia.bin farm summary
-Farming status: Farming
-Total chia farmed: 0.0
-User transaction fees: 0.0
-Block rewards: 0.0
-Last height farmed: 0
-Local Harvester
-   111 plots of size: 7.728 TiB
-Plot count for all harvesters: 111
-Total size of plots: 7.728 TiB
-Estimated network space: 21.378 EiB
-Expected time to win: 1 year and 9 months
-Note: log into your key using 'chia wallet show' to see rewards for each key

```

查看plotnft状态
```
./chia.bin plotnft show
-Wallet height: 3276665
-Sync status: Synced
-Wallet id 2:
-Current state: FARMING_TO_POOL
-Current state from block height: 3274095
-Launcher ID: 32d04beeb30e5729c29d066aa35a8e0b076823c55f4c95d4774bad4b3f7070d2
-Target address (not for plotting): xch1nkw999hspwyuyfc6kjsq7fy6kwspqmvdw0wsyfp086nr276vmczq2z7kn2
-Number of plots: 111
-Owner public key: ada9018dd71a894c35296126472f75c5a7e9e8d221ee8fa43bb5cf9e0fd6a7794bf1cd03aed0e0ff16a3c9e07244ca0e
-Pool contract address (use ONLY for plotting - do not send money to this address): xch1c5xf378dc5d2nu4g9n5em7zsq39xdqpwh6lk529lr24hhz6lsx0sqjkzda
-Current pool URL: https://vip.dpool.cc:9999
-Current difficulty: 10
-Points balance: 100
-Points found (24h): 100
-Percent Successful Points (24h): 100.00%
-Payout instructions (pool will pay to this address): xch1vsj34ce0wg9ajeydahs5nws6gucpx96xejns2jmaet8z3qhj4kjsph77ha
-Relative lock height: 100 blocks

```

切换矿池

```
./chia.bin plotnft join -u https://vip.dpool.cc:9999 -i 2
{'authentication_token_timeout': 5,
 'description': 'Welcome to Dpool, our long-term focus on the chia ecosystem.',
 'fee': '0',
 'logo_url': 'https://www.chia.net/img/chia_logo.svg',
 'minimum_difficulty': 5,
 'name': 'Dpool Pool',
 'protocol_version': 1,
 'relative_lock_height': 100,
 'target_puzzle_hash': '0x9d9c5296f00b89c2271ab4a00f249ab3a0106d8d73dd02242f3ea6357b4cde04'}

Will join pool: https://vip.dpool.cc:9999 with Plot NFT 953890000.
Confirm [n]/y:

```

关闭madmax-farmer客户端

```
./chia.bin stop -d all
```



## Windows

安装[MS-Visual-C++发行包](https://aka.ms/vs/17/release/vc_redist.x86.exe)

打开浏览器下载[madmax-Farmer客户端](https://github.com/madMAx43v3r/chia-gigahorse/releases/download/v1.6.2.giga4/chia-gigahorse-farmer-1.6.2.giga4-x86_64.tar.gz)，解压后双击打开chia.cmd，进入命令行模式

命令行的使用方法和Linux一样

```
.\chia.exe --help
.\chia.exe init
.\chia.exe keys add
.\chia.exe plots add -d D:\plots
.\chia.exe plots add -d E:\plots
.\chia.exe plots add -d F:\plots
.\chia.exe start farmer
.\chia.exe stop -d all
...
```

## 压缩图收割机集群设置

设置方式和官方客户端是一样的，把官方chia命令替换成madmax-farmer客户端的chia.bin

目前压缩图的解压都是在收割机上进行，需要根据个人收割机和预算的情况，选择合适的压缩等级

如何计算收割机的最大可加载农田数量，待续


## madmax压缩图的抽成

madmax压缩图抽成是作为他的开发费用，比例大概是1.125%-3.125%

如果是通过CPU挂图farmer爆块，那么有1/8的概率，0.25的爆块奖励将作为抽成，抽成比例是0.25xch/2xch*1/8=1.562%

如果是通过GPU挂图farmer爆块，那么有1/4的概率，0.25的爆块奖励将作为抽成，抽成比例是0.25xch/2xch*1/4=3.125%

## 待续：

不同压缩等级挂盘的硬件要求(CPU GPU 显存 内存)

如何测试硬件的可挂载农田最大值

限制耕种时的内存、GPU使用



## 技术交流

QQ群: 198579

Telegram:  https://t.me/dpool_cc
