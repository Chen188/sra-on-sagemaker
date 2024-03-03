# 1-process-data.sh --data_id xxxx

DATA_ID=$2
cd $SM_CHANNEL_TRAINING

ls -lh

# prefetch $DATA_ID \
#     --output-directory ./data_240302 \
#     --progress --max-size u
    

# fasterq-dump ./$DATA_ID/data_240302 --outdir ./fastq_240302 --include-technical -S --progress --threads 15


##############################
echo test flock support
echo flock content > flock.test

flock -x flock.test -c 'echo first: got flock.test at `date`, will hold lock for 5s; sleep 5' &

flock -x flock.test -c 'echo second: got flock.test at `date`'

rm flock.test

sleep 1200  # sleep 20 min for debug purpose

##############################
# Need to install packages to run following code

# cellranger_path="some_directory_that_support_file_lock"
# cd $cellranger_path && cellranger count --id=$DATA_ID \
#  --transcriptome=/hpc-cache-pfs/home/gaohaoxiang/software/refdata-gex-GRCh38-2020-A \
#  --fastqs=./fastq_240302/$DATA_ID \
#  --sample=$DATA_ID \
#  --nosecondary \
#  --localcores=30 \
#  --localmem=64  >> ERR9696936_cellranger.log

# # 4. run velocyto
# velocyto run10x \
#  -m /hpc-cache-pfs/home/gaohaoxiang/software/refdata-gex-GRCh38-2020-A/GRCh38_rmsk.gtf \
#  $cellranger_path/ERR9696936 \
#  /hpc-cache-pfs/home/gaohaoxiang/software/refdata-gex-GRCh38-2020-A/genes/genes.gtf >> ERR9696936_velocyto.log