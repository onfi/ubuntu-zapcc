FROM ubuntu:18.04

WORKDIR /root
RUN apt update && apt install -y git ninja-build cmake python && apt install -y g++ && \
     git clone https://github.com/yrnkrn/zapcc.git llvm && mkdir build && cd build && cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_WARNINGS=OFF ../llvm && ninja && cd /root/ && \
     rm -rf /root/llvm && apt --purge remove -y git ninja-build cmake python && apt autoremove -y && apt clean && rm -rf /var/lib/apt/lists/* 

ENV PATH $PATH:/root/build/bin/
CMD /bin/bash
