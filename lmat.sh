# LMAT

#before running:
#Download "runtime_inputs" from ftp://gdo-bioinformatics.ucllnl.org/pub/lmat/
#copy files from /share/apps/lmat/1.2.6/intel/bin to your own directory which you will use as the working directory
#copy database files into this directory as well. They can be found here:/scratch/work/public/gen-data/lmat/runtime_inputs/ 

	
#!/bin/bash

###-----Comments can be here as long as they're preceded by (#) hash-----###
   #######------------and hash (#) is not followed by PBS------------#######

###-----PBS Directives Start-----###

#PBS -V
#PBS -S /bin/bash
#PBS -N lmat_run
#PBS -l nodes=1:ppn=12
#PBS -l walltime=24:00:00
#PBS -l mem=92GB
#PBS -q s48
#PBS -M email@nyu.edu
#PBS -m bea
#PBS -e localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.e${PBS_JOBID}
#PBS -o localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.o${PBS_JOBID}

###-----PBS Directives End-----###

###-----Statements to be Executed-----###

#cd path/to/working/directory
module load kronatools/2.5
module load seqtk/intel/1.0

#LMAT_DIR=/scratch/kmg549/flu-metagenomics/example/runtime_inputs -- I downloaded the runtime inputs from ftp://gdo-bioinformatics.ucllnl.org/pub/lmat/ and place them here
LMAT_DIR=/path/to/runtimeinputs
OUT_FILE=/path/to/out
QUERY_FILE=/path/to/query_file
DB=/path/to/db

export LMAT_DIR=/path/to/runtimeinputs

/share/apps/lmat/1.2.6/intel/bin/run_rl.sh --db_file=$DB --query_file=$QUERY_FILE --odir=$OUT_FILE --threads=8
done
