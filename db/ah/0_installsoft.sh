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
    
(可选)如果找不到conda，可手动临时添加conda至环境变量。可以添加至~/.bashrc文件中永久环境变量，需将${soft}替换为你的安装目录，如
    # export PATH="${soft}/bin:$PATH"

查看虚拟环境列表 
    conda env list

创建虚拟环境示例，防污染环境变量示例(如果软件安装卡在Solving environment步骤，可尝试新建环境)
    conda create -n meta
    # 加载环境
    conda activate meta
    # 退出环境
    conda deactivate

## conda环境打包pack和安装(推荐)
conda安装经常会卡在Collecting package metadata或Solving environment。我们推荐一种直接下载解压的安装方式，可以加速环境的部署。
下载安装包并解压安装：
    # 指定环境名称，如 meta, humann2, kraken2, eggnog, rgi, metawrap1.3, drep, gtdbtk1.5, humann3, qiime2-2021.2
    soft=~/miniconda3
    n=metawrap1.3
    # 下载
    wget -c http://210.75.224.110/db/conda/${n}.tar.gz
    # 指定安装目录
    mkdir -p ${soft}/envs/${n}
    tar -xvzf ${n}.tar.gz -C ${soft}/envs/${n}
    # 方法1. 启动环境
    conda activate $n
    # 初始化环境
    conda unpack
    # 退出环境
    conda deactivate
    # 方法2. 绝对目录激活环境
    # source ${soft}/envs/${n}/bin/activate

(可选)安装好的环境下打包导出，以宏基因组主环境meta为例
    # 安装conda-pack实现打包
    conda install conda-pack -c conda-forge
    # conda 安装不成功可用pip安装
    # pip conda-pack
    
    # conda环境包统一存放
    cd ~/db/conda/
    # 设置环境名，如meta, humann2, kraken2, eggnog, rgi, metawrap1.3, drep, gtdbtk1.5
    n=meta
    conda pack -n ${n} -o ${n}.tar.gz
    # 导出软件安装列表
    conda activate ${n}
    conda env export > ${n}.yml
    # 添加权限，方便下载和别人使用
    chmod 755 *
    
