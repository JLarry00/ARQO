# Un primer programa assembler RISC-V ARQO
.data
a_data: .word 0x1234

.text
    lw   a0 a_data
    addi a1 a0 1
    bne a1 a0 endProg
    addi a1 a1 2      # no debe ejecutarse
    
endProg:
    nop
