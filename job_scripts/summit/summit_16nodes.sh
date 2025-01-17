#!/bin/bash
#BSUB -P projectid
#BSUB -W 50
#BSUB -nnodes 16
#BSUB -alloc_flags smt1
#BSUB -J Sedov_gpu
#BSUB -o Sedov_gpu.%J
#BSUB -e Sedov_gpu.%J

cd $LS_SUBCWD

inputs_file=inputs.3d.sph

n_mpi=96 # 16 nodes * 6 gpu per node
n_omp=1
n_gpu=1
n_cores=1
n_rs_per_node=6

export OMP_NUM_THREADS=$n_omp

Castro_ex=./Castro3d.pgi.MPI.CUDA.ex

jsrun -n $n_mpi -r $n_rs_per_node -c $n_cores -a 1 -g $n_gpu $Castro_ex $inputs_file

