# RISC-V-Single-Cycle
- This repository contains the implementation of a single-cycle processor based on the RISC-V ISA.
- #### This is the block diagram for the project
![Digital Design and Computer Architecture RISC-V Edition]([https://github.com/user-attachments/assets/ffdec348-2d48-408c-be1c-ff8f9904076d](https://mrce.in/ebooks/Digital%20Design%20&%20Computer%20Architecture%20RISC-V%20Edition.pdf))

- We divide our microarchitectures into two interacting parts: the data path and the control unit.
- The datapath operates on words of data. It  contains structures such  as memories, registers, ALUs, and multiplexers.
- The control unit receives the current instruction from  the datapath and tells the  datapath how to execute that instruction.
- The control unit produces multiplexer select, register enable,  and memory write  signals to control the operation of the datapath.
  
## Architecture Design
![image](https://github.com/user-attachments/assets/16f112be-6af6-4289-b3e3-94d0611f0197)


## Instruction Set Support
| Type | Instructions |
|------|--------|
| R    | ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND| 
| I    | JALR, LB, LH, LW, LBU, LHU, ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI| 
| S    | SB, SH, SW | 
| B    | BEQ, BNE, BLT, BGE, BLTU, BGEU |
| U    | LUI, AUIPC |
| J    | JAL | 
