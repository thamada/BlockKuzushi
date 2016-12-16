# .bashrc
# Time-stamp: "2016-01-10 16:23:04 hamada"

# User specific aliases and functions
#shopt -s huponexit

# Source global definitions
#if [ -f /etc/bash.bashrc ]
#then
#	. /etc/bash.bashrc
#fi

if [ -f /etc/bashrc ]
then
	. /etc/bashrc
fi

#
# Colored file listings
#
if test -x /usr/bin/dircolors ; then
    #
    # set up the color-ls environment variables:
    #
    if test -f $HOME/.dir_colors ; then
        eval `dircolors -b $HOME/.dir_colors`
    elif test -f /etc/DIR_COLORS ; then
        eval `dircolors -b /etc/DIR_COLORS`
    fi
fi

alias cleandemofiles='rm -rf *.c *.vhd ISE_PROJECT *~ .*~ *.h'
alias ssh-set='eval `ssh-agent`; ssh-add'
alias suu='sudo su '
alias ss='ssh -C -X -l `whoami`'
alias ssj='ssh -C -X -l xu30 xd1gate.cray.co.jp'
alias ssc='ssh -C -X -l hhd096 xd1'
alias langj='export LANG=ja_JP.eucJP'
alias langc='export LANG=C'
alias cd='pushd ./ 1>/dev/null 2>/dev/null;echo $PWD;cd $ARG'
alias bk='dirs +2;popd 1>/dev/null 2>/dev/null;' 
alias er='rm -r *~'
alias err='rm -r .*~'
alias mule='emacs' 
alias cls='clear'
alias l='emacs -nw'
alias ls='ls -F '
alias la='ls -la'
alias ll='ls -l'
alias less='less -X'
alias sch='source ~/.bashrc; echo .bashrc'
alias kterm='kterm -fg wheat -bg black -km euc -sl 2000'
alias xterm='xterm -bg "#001f33" -fg "#FFF0F0"'
#alias setx='xsetroot -solid "#003A00"'
alias setx='xsetroot -mod 2 2 -fg "#003322" -bg "#003322"'

alias amek='make'
alias amke='make'
alias mkae='make'
alias mkea='make'
alias maek='make'
alias muel='mule'
alias moer='more'
alias mroe='more'
alias mre='more'
alias meor='more'
alias sl='ls'
alias gg='grep HAMA'

umask 022
export LANG=C

export JLESSCHARSET=japanese
export LESSOPEN="|lesspipe.sh %s"
export GDK_CONV=""
export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=$PATH:~/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/lib64:/usr/lib64:/lib:/usr/lib:/usr/local/lib:/var/lib:/usr/lib/perl5/5.8.0/unicore/lib:/usr/X11R6/lib

# ---------------------------------------------------------------------------------
## Orale DB
#export ORACLE_BASE=/app
#export ORACLE_HOME=/app/oracle
#export PATH=$PATH:$ORACLE_HOME/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib:/usr/local/lib
#export ORACLE_TERM=vt100
#export ORACLE_SID=PET
#export ORACLE_OWNER=ora8
#export ORA_NLS33=$ORACLE_HOME/ocommon/nls/admin/data
#export NLS_LANG=japanese_japan.ja16sjis
#export TNS_ADMIN=$ORACLE_HOME/network/admin

## postgreSQL
#PATH="$PATH":/usr/local/pgsql/bin
#export POSTGRES_HOME=/usr/local/pgsql
#export PGLIB=$POSTGRES_HOME/lib
#export PGDATA=$POSTGRES_HOME/data
#export MANPATH="$MANPTH":$POSTGRES_HOME/man
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PGLIB

## SystemC
#export PATH=$PATH:/usr/local/gcc-3.0.3
#export INCLUDE=/usr/local/systemc-2.0
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/gcc.3.0.3/lib

## CVS
#export CVSROOT=/home/cvsroot/hamada

## Starlab
#export STARLAB_PATH=/usr/local/share/starlab
#bash $STARLAB_PATH/starlab_start.sh
#PATH="$PATH":$STARLAB_PATH/bin

## NEMO
#export PATH=$PATH:/usr/local/src/nemo_3.2.1/bin

## PGPLOT
#export PGPLOT_DIR=/usr/local/pgplot
#export PGPLOT_DEV=/xwin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/pgplot

## for n1
#export LANG=ja_JP.eucJP

## for Rocks
#export PATH=$PATH:/opt/rocks/bin

# for pgpp debug
#export PATH=$PATH:/opt/pgpg/contrib/bin
#export PATH=$PATH:/opt/pgpg/contrib/src_h/s/

## PGR
#source /tmp/pgr/bin/vars.sh

## XST
#source /tmp/Xilinx/settings.sh

## GIMP
#export PATH=$PATH:/opt/gnome/bin

## QuartusII
#export PATH=/opt/q2/bin:$PATH

## gEDA
#export PATH=$PATH:$HOME/geda-install/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/geda-install/lib

## Anthy
#scim -d
#export XMODIFIERS="@im=SCIM"

## Astec-X
#export XMODIFIERS="@im=ASTEC_IMS"

## pciDriver
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/pciDriver/lib

## for Amber
#export AMBERHOME=~/amber8x86_64

## for GROMACS
#source  /usr/local/gromacs/bin/GMXRC.bash
#alias sseno='export NOASSEMBLYLOOPS=1'
#alias sseok='unset NOASSEMBLYLOOPS'

## for Cray-XT5
#alias ssc='ssh hawk.cray.com -l p01130'

alias gxx='ssh gxx -p 1250'

# ---------------------------------------------------------------------------------
# GPU Cluster etc.
export PATH=/export/opt/bin:$PATH
export WAIT=0.2 # ether-wake script


# ---------------------------------------------------------------------------------
# CUDA
# ~~~ Modify this part as your environment ~~~
#export CUDA_INSTALL_PATH=/export/opt/cuda_4.2.9_linux_64_rhel6.0/cuda
#export SDK_INSTALL_PATH=/export/opt/cuda_4.2.9_linux_64_rhel6.0/NVIDIA_GPU_Comp>uting_SDK/C
#export LD_LIBRARY_PATH=$CUDA_INSTALL_PATH/lib64:$CUDA_INSTALL_PATH/lib:$LD_LIBRARY_PATH
#export CUDA_INSTALL_PATH=/export/opt/cuda
#export SDK_INSTALL_PATH=/export/opt/cuda/NVIDIA_GPU_Computing_SDK/C
#export LD_LIBRARY_PATH=/export/opt/gcc-4.3.4/lib64:$LD_LIBRARY_PATH
#export CUDA_INSTALL_PATH=/export/opt/cuda.3.1b.20100610/cuda
#export SDK_INSTALL_PATH=/export/opt/cuda.3.1b.20100610/NVIDIA_GPU_Computing_SDK/C
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_INSTALL_PATH/lib64
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#export PATH=$PATH:$CUDA_INSTALL_PATH/bin

## for profiling
#export CUDA_PROFILE=0
#export CUDA_PROFILE_LOG=./cuda_profile.log
#export CUDA_PROFILE_CSV=1
#alias cudaprofon='export CUDA_PROFILE=1'
#alias cudaprofoff='export CUDA_PROFILE=0'

# ---------------------------------------------------------------------------------
# OpenCL
#export PATH=$PATH:/export/opt/gcc-4.4.1/bin
#export LD_LIBRARY_PATH=/export/opt/gcc-4.4.1/lib64:$LD_LIBRARY_PATH
#export NV_COMPUTE_SDK_PATH=/export/opt/cuda/NVIDIA_GPU_Computing_SDK

#export LD_LIBRARY_PATH=/export/opt/gcc-4.3.4/lib64:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/export/opt/OpenCL/NVIDIA_GPU_Computing_SDK/OpenCL/common/lib/Linux64:$LD_LIBRARY_PATH

#export NV_COMPUTE_SDK_PATH=/export/opt/cuda/NVIDIA_GPU_Computing_SDK
#export LD_LIBRARY_PATH=/export/opt/gcc-4.3.4/lib64:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/export/opt/cuda/NVIDIA_GPU_Computing_SDK/OpenCL/common/lib/Linux64:$LD_LIBRARY_PATH

# for MPICH
#export PATH=/export/opt/mpi/local/bin:$PATH
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/export/opt/mpi/local/lib

# ---------------------------------------------------------------------------------
# OpenMPI

## === GbE
#export PATH=/export/opt/openmpi-1.3.1/bin:$PATH
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/export/opt/openmpi-1.3.1/lib

# === InfiniBand (OFED 1.4)
#export PATH=/usr/mpi/gcc/openmpi-1.2.8/bin:$PATH
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/mpi/gcc/openmpi-1.2.8/lib64

# === InfiniBand (OFED 1.5.1)
#export PATH=/usr/mpi/gcc/openmpi-1.4.1/bin:$PATH
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/mpi/gcc/openmpi-1.4.1/lib64

# ---------------------------------------------------------------------------------
## OpenCV
#export OPENCV_INSTALL_PATH=/export/opt/opencv-1.1.0


## for Mplayer
#export PATH=/export/opt/mplayer/bin:$PATH

#echo 'OMP_NUM_THREADS =' $OMP_NUM_THREADS


## ICC
# source /export/opt/icc/11.0/081/bin/ifortvars.sh intel64

#  #for AMD/ATI GPU
#  #export CALROOT=/export/opt/amdstream/atical
#  #export PATH=$CALROOT/bin/lnx64:$PATH
#  #export LD_LIBRARY_PATH=/usr/lib64:/usr/lib:$LD_LIBRARY_PATH
#  #export LD_LIBRARY_PATH=/export/opt/amdstream/atibrook/sdk/lib:$LD_LIBRARY_PATH
#  #export PATH=/export/opt/amdstream/atibrook/sdk/bin:$PATH
#  #export LD_LIBRARY_PATH=/export/opt/amdstream/acmlg1.0/gfortran64/lib:$LD_LIBRARY_PATH
#  #alias aon='export DISPLAY=:0.0'
#  export ATISTREAMSDKROOT=/export/opt/amdstream.opencl/ati-stream-sdk-v2.01-lnx64
#  export ATISTREAMSDKSAMPLESROOT=/export/opt/amdstream.opencl/ati-stream-sdk-v2.01-lnx64
#  export LD_LIBRARY_PATH=$ATISTREAMSDKROOT/lib/x86_64:$LD_LIBRARY_PATH
#  #xmodmap ~/.Xmodmap 2> /dev/null
#  #nodeid=`uname -n`
#  #echo "node $nodeid"

#export OMP_NUM_THREADS=1

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/export/opt/DevIL/lib

#export FFTW_INSTALL_PATH=/export/opt/fftw2-mpi
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FFTW_INSTALL_PATH/lib

## Blender
#export PATH=$PATH:/export/opt/blender-2.5-alpha2-linux-glibc27-x86_64

## libsamplerate
#export PATH=$PATH:/export/opt/libsamplerate-0.1.7/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/export/opt/libsamplerate-0.1.7/lib

## NX-Nastran
#export PATH=$PATH:/ugs/nxnastran/nxn4/x86_64linux
#export NXN_BASE=/ugs/nxnastran

# -- temporary --
#alias cdd='cd /export/opt/src/sample/sample-cuda/hwtest/'
alias cdd='cd /mnt/data/work/ndock-target-2IQH.20160103/results/'

##--- ATI StreamSDK ---
#export ATISTREAMSDKROOT=/export/opt/ati-stream-sdk-v2.3-lnx64
#export ATISTREAMSDKSAMPLESROOT=$ATISTREAMSDKROOT/samples
#export LD_LIBRARY_PATH=$ATISTREAMSDKROOT/lib/x86_64:$LD_LIBRARY_PATH

##--- QuartusII ---
#export QUARTUS_ROOTDIR=/export/opt/altera9.1/quartus
#export PATH=$PATH:$QUARTUS_ROOTDIR/bin
#source /export/opt/altera9.1/nios2eds/env.sh

##---- NSL ---
#export PATH=$PATH:/export/opt/nsl/bin


#if [ -f /etc/DEGIMA ]
#then
#	ssh nfs
#fi

# ---------------------------------------------------------------------------------
# CUDA 5
#export PATH=$PATH:/usr/local/cuda/bin

# CUDA 4.2.9
#export CUDA_INSTALL_PATH=/export/opt/cuda_4.2.9_linux_64_rhel6.0/cuda
#export SDK_INSTALL_PATH=/export/opt/cuda_4.2.9_linux_64_rhel6.0/NVIDIA_GPU_Computing_SDK/C
#export LD_LIBRARY_PATH=$CUDA_INSTALL_PATH/lib64:$CUDA_INSTALL_PATH/lib:$LD_LIBRARY_PATH
#export PATH=$PATH:$CUDA_INSTALL_PATH/bin



# ND
#export PATH=/export/opt/local/bin:${PATH}
#export LD_LIBRARY_PATH=/export/opt/local/lib:/export/opt/local/lib64:$LD_LIBRARY_PATH


