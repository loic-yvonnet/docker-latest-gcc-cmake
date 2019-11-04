FROM ubuntu:latest

RUN apt-get update && \
    # Get required utils for later installs
    apt-get install -y build-essential flex libssl-dev apt-transport-https ca-certificates gnupg software-properties-common wget curl git && \
    apt-get update && \
    # Create a directory to host the repos
    mkdir buildtools && \
    cd buildtools && \
    # Compile the latest CMake from source
    git clone https://github.com/Kitware/CMake && \
    mkdir CMake-build && \
    cd CMake-build && \
    ../CMake/bootstrap && \
    make -j 28 && \
    make install && \
    cd .. && \
    # Compile latest GCC from source
    git clone https://github.com/gcc-mirror/gcc && \
    cd gcc && \
    contrib/download_prerequisites && \
    cd .. && \
    mkdir gcc-build && \
    cd gcc-build && \
    ../gcc/configure -v -v --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu --prefix=/usr/local/gcc-latest --enable-checking=release --enable-languages=c,c++,fortran --disable-multilib --program-suffix=-latest && \
    make -j 28 && \
    make install && \
    cd .. && \
    # Make sure the gcc and g++ commands refer to the latest GCC
    update-alternatives --install /usr/bin/gcc gcc /usr/local/gcc-latest/bin/gcc-latest 999 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/local/gcc-latest/bin/g++-latest 999 && \
    update-alternatives --install /usr/bin/cc  cc  /usr/local/gcc-latest/bin/gcc-latest 999 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/local/gcc-latest/bin/g++-latest 999 && \
    # Make sure that GDB is installed (the latest OS default version of GDB should be fine)
    apt-get install -y gdb && \
    # Clean up
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    cd .. && \
    rm -rf buildtools && \
    # Create the develop user for security reasons
    useradd -ms /bin/bash develop && \
    echo "develop   ALL=(ALL:ALL) ALL" >> /etc/sudoers

# gdbserver port
EXPOSE 2000

USER develop
WORKDIR /home/develop/dev
VOLUME /home/develop/dev
