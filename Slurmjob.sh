#!/bin/bash
#SBATCH --partition=normal
#SBATCH --job-name=Em_job # Changed name to reflect GPU usage
#SBATCH --nodes=1
#SBATCH --nodelist=greatfacet
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=3

# --- START: Advanced Diagnostic Prints ---
echo "--- Slurm Environment Diagnostics ---"
echo "Job is running on node: $(hostname)"
echo "SLURM_NTASKS: $SLURM_NTASKS"
echo "SLURM_CPUS_ON_NODE: $SLURM_CPUS_ON_NODE"
echo "SLURM_CPUS_PER_TASK: $SLURM_CPUS_PER_TASK"
echo "--- Executable Locations ---"
echo "Which mpirun: $(which mpirun)"
echo "Which gmx_mpi: $(which gmx_mpi)"
echo "--- Diagnostics finished ---"

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
echo "Job will run with $SLURM_NTASKS MPI tasks, and $OMP_NUM_THREADS OpenMP threads per task."

# --- Running GROMACS ---
echo "--- Starting GROMACS run ---"

mpirun -np 1 gmx_mpi mdrun -v -deffnm em -cpt 5

echo "--- GROMACS finished ---"
