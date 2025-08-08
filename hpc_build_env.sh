# For specifying the path to gmx_mpi after Gromacs are installed
source ~/gromacs/bin/GMXRC

# ---------- Building Gromacs and Cp2k with cuda only ---------- #

# For building cp2k and gromacs with cuda
export MY_GCC_DIR="/home/users/jonasbaa/apps/gcc/11.4.0"
export MY_CMAKE_DIR="/home/users/jonasbaa/WaterPhase/cp2k/tools/toolchain/install/cmake-3.31.7"
export MY_CUDA_DIR="/usr/local/cuda-12.6" # Using system 12.6 version
export CUDA_HOME=${MY_CUDA_DIR}
export MKLROOT=/opt/intel/oneapi/mkl/2025.2

# Set the PATH for executables
export PATH="$MY_GCC_DIR/bin:$MY_CMAKE_DIR/bin:$MY_CUDA_DIR/bin:$MKLROOT/bin:$PATH"

# Set the LD_LIBRARY_PATH for runtime libraries
export LD_LIBRARY_PATH="$MY_GCC_DIR/lib64:$MY_CUDA_DIR/lib64:$MKLROOT/lib:$LD_LIBRARY_PATH"


# ---------- Building Gromacs with NVIDIA HPC SDK only ---------- #

# For building cp2k and gromacs with cuda
#export MY_GCC_DIR="/home/users/jonasbaa/apps/gcc/11.4.0"
#export MY_CMAKE_DIR="/home/users/jonasbaa/WaterPhase/cp2k/tools/toolchain/install/cmake-3.31.7"

# Set the PATH for executables
#export PATH="$MY_GCC_DIR/bin:$MY_CMAKE_DIR/bin:$PATH"

# Set the LD_LIBRARY_PATH for runtime libraries
#export LD_LIBRARY_PATH="$MY_GCC_DIR/lib64:$LD_LIBRARY_PATH"

# Add the NVIDIA HPC SDK module directory to your search path if building gromacs alone
#export MODULEPATH=/opt/nvidia/hpc_sdk/modulefiles:$MODULEPATH
# Load the desired version of the HPC SDK
#module load nvhpc/25.3


# ----------- Building Cp2k with NVIDIA HPC SDK (not yet been succesfull)----------- #

# For building cp2k and gromacs with cuda
#export MY_GCC_DIR="/home/users/jonasbaa/apps/gcc/11.4.0"
#export MY_CMAKE_DIR="/home/users/jonasbaa/WaterPhase/cp2k/tools/toolchain/install/cmake-3.31.7"
#export MKLROOT=/opt/intel/oneapi/mkl/2025.2
#export SDKROOT=/opt/nvidia/hpc_sdk/Linux_x86_64/25.3
# Set the PATH for executables
#export PATH="$MY_GCC_DIR/bin:$MY_CMAKE_DIR/bin:$MKLROOT/bin:$PATH"
#$SDKROOT/bin:

# Set the LD_LIBRARY_PATH for runtime libraries
#export LD_LIBRARY_PATH="$MY_GCC_DIR/lib64:$MKLROOT/lib:$LD_LIBRARY_PATH"
#$SDKROOT/comm_libs/nvshmem/lib:$SDKROOT/comm_libs/nccl/lib:$SDKROOT/math_libs/lib64:$SDKROOT/cuda/lib64:

# Add the NVIDIA HPC SDK module directory to your search path if building gromacs alone
#export MODULEPATH=/opt/nvidia/hpc_sdk/modulefiles:$MODULEPATH
# Load the desired version of the HPC SDK
#module load nvhpc/25.3


# --- 3. Final Confirmation ---
echo "Your environment are enabled"
