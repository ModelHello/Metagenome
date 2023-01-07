# fastqc对测序原始数据进行评估，生成html报告
fastqc seq/*.fq.gz -t 4

# fastp进行对测序原始数据进行质量控制，包括去接头序列
fastp -i in.R1.fq.gz -I in.R2.fq.gz -o out.R1.fq.gz -O out.R2.fq.gz # for paired end data (gzip compressed)
