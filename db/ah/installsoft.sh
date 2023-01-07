# 易宏基因组软件和数据库 EasyMetagenome software & database

    # 版本: 1.14, 2022/3/25
    # 测试环境为Linux Ubuntu 20.04 / CentOS 7.7

## 安装前准备：软件和数据库位置

    # 数据库安装位置，默认~/db目录(无需管理权限)，管理员可安装至/db，方便大家使用
    db=~/db
    mkdir -p ${db} && cd ${db}
    # 软件安装位置，也可能为miniconda3
    
### EasyMetagenome依赖软件和数据库(db)

EasyMetagenome依赖流程，包括很多脚本、常用小软件和数据库的合集，网址：https://github.com/YongxinLiu/EasyMicrobiome

### 软件管理器Conda

    # 下载最新版miniconda3，~49M
    wget -c https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    # 安装，-b批量，-f无提示，-p目录，许可协议打yes
    bash Miniconda3-latest-Linux-x86_64.sh -b -f
    # 激活，然后关闭终端重开，提示符前出现(base)即成功
    ~/miniconda3/condabin/conda init
    # 查看版本，conda 4.11.0, python 3.9.7
    conda -V 
    python --version
    # 添加常用频道
    conda config --add channels conda-forge
    # 添加生物学软件频道，http://bioconda.github.io/ 查询软件
    conda config --add channels bioconda
    # conda默认配置文件为 ~/.condarc 查看配置文件位置
    conda config --show-sources
