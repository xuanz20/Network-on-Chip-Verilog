# Router Microarchitecture

A 2D mesh Network on Chip with 5-stage pipelined router, all implemented in Verilog and run on Artix-7 FPGA with 150MHz frequency.

## 1. NoC Architecture

<img src="https://s2.loli.net/2022/10/18/sXEFdhw5bHuJyUn.png" alt="截屏2022-10-18 21.39.39" style="zoom:50%;" />

PE: send data and receive data to and from other PEs. Date stored in BRAM.

Ni: network interface

R: router

## 2. Router

5 pipelined stage:

+ route computation
+ data transformation and store in fifo
+ VC Allocation and Switch Allocation
+ Switch Traversal
+ Link Traversal

<img src="https://s2.loli.net/2022/10/18/cYR1up2Zv7FiOgl.png" alt="截屏2022-10-18 21.43.35" style="zoom:50%;" />

Route computing algorithm: negative-first algorithm (dead-lock free)

VC: credit-based control

<img src="https://s2.loli.net/2022/10/18/SgdvOBrmGepzLFY.png" alt="截屏2022-10-18 21.45.09" style="zoom:50%;" />

switch channel allocation: Round-Robin and Queuing arbiter

<img src="https://s2.loli.net/2022/10/18/mCAlwTjQKdRnk1Y.png" alt="截屏2022-10-18 21.46.42" style="zoom:50%;" />

## 3. Result

+ transport 48*30 flits in 180 cycle, transmission density is 6.7 hops/cycle

![截屏2022-10-18 21.53.02](https://s2.loli.net/2022/10/18/l28MQcYOuzKpHr3.png)

+ pll frequency: 150MHz

![截屏2022-10-18 21.53.13](https://s2.loli.net/2022/10/18/nO4XS6wMuExd1Ik.png)

+ High scalability and well seperate modules for testing more policies.

+ Can be applyed to multi-core computing for AI accelarating like matrix convolution, matrix multiplication used in neural networks.

