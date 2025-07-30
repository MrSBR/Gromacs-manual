# --- 1. Define Paths ---
source ~/gromacs/bin/GMXRC
export MY_GCC_DIR="/home/users/jonasbaa/apps/gcc/11.4.0"
export MY_CMAKE_DIR="/home/users/jonasbaa/apps/cmake-3.28.3"

# --- 2. Set the PATH for executables ---
export PATH="$MY_GCC_DIR/bin:$MY_CMAKE_DIR/bin:$PATH"

# --- 3. Set the LD_LIBRARY_PATH for runtime libraries ---
export LD_LIBRARY_PATH="$MY_GCC_DIR/lib64:$LD_LIBRARY_PATH"

# --- 4. Add the NVIDIA HPC SDK module directory to your search path ---
export MODULEPATH=/opt/nvidia/hpc_sdk/modulefiles:$MODULEPATH
# Load the desired version of the HPC SDK
module load nvhpc/25.3

# --- 3. Final Confirmation ---
echo "Unified HPC toolchain (with NVIDIA HPC SDK 25.3) enabled."
echo "Environment enabled"