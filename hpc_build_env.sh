# ===================================================================
# UNIFIED HPC TOOLCHAIN CONFIGURATION
# This block sets up the complete environment for all self-compiled tools
# including GROMACS, CP2K, compilers, and libraries.
# ===================================================================


# For specifying the path to gmx_mpi after Gromacs are installed
source ~/gromacs/bin/GMXRC

# ----------- Building Cp2k with NVIDIA HPC SDK ----------- #

# Add: "-L${CUDA_HOME}/lib64 -L/opt/nvidia/hpc_sdk/Linux_x86_64/25.1/math_libs/lib64" in the LDFLAGS of configure command in /home/users/jonasbaa/WaterPhase/cp2k/tools/toolchain/scripts/stage5/install_elpa.sh. Before running the toolchain script. # 

# For building cp2k and gromacs with cuda 
export MY_GCC_DIR="/home/users/jonasbaa/apps/gcc/11.4.0" 
export MY_CMAKE_DIR="/home/users/jonasbaa/WaterPhase/cp2k/tools/toolchain/install/cmake-3.31.7"
export MKLROOT=/opt/intel/oneapi/mkl/2025.2
export CUDA_HOME="/opt/nvidia/hpc_sdk/Linux_x86_64/25.1/cuda" 

# Set the PATH for executables
export PATH="$MY_GCC_DIR/bin:$MY_CMAKE_DIR/bin:$MKLROOT/bin:$CUDA_HOME/bin:$PATH"

# Set the LD_LIBRARY_PATH for runtime libraries
export LD_LIBRARY_PATH="$MY_GCC_DIR/lib64:$MKLROOT/lib:$CUDA_HOME/lib64:$LD_LIBRARY_PATH"

# Add the NVIDIA HPC SDK module directory to your search path if building gromacs alone
export MODULEPATH=/opt/nvidia/hpc_sdk/modulefiles:$MODULEPATH
# Load the desired version of the HPC SDK
module load nvhpc/25.1

# --- 3. Final Confirmation ---
echo "Your environment are enabled"

