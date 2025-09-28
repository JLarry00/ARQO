.data
arr: .word 1, 2, 2, 5, 2, 2, 4, 1, 2, 2
len: .word 10
str: .string "The majority element is "

.text

main:
    jal ra, majorityElement
print:
    la a0, str
    li a7,4                # print string
    ecall 
    mv a0, t4
    li a7, 1               # print integer
    ecall
exit:
    li a7, 10              # exit
    ecall

majorityElement:
    la t0, len
    lw t0, 0(t0)           # t0: len
    la t1, arr             # t1: base_addr of arr
    li t2, 1               # cnt = 1
    li t3, 1               # i = 1
    lw t4, 0(t1)           # major = num[0]
    addi t1, t1, 4         # base_addr += 4 (Because array start from index 1)
for:
    blt t3, t0, loop       # if i < len, branch to label "loop"
    mv a0, t4
    jr ra                  # return main 

loop:
    lw t5, 0(t1)           # t5 = num[i]
    beq t5, t4, if         # if(num[i] == major)
    beq t2, zero, elseif   # else if(cnt == 0)
    addi t2, t2, -1        # cnt--
increment:
    addi t1, t1, 4         # base_addr += 4
    addi t3, t3, 1         # i++
    j for

if:
    addi t2, t2, 1         # cnt++
    j increment

elseif:
    mv t4, t5              # major = num[i];
    addi t2, t2, 1         # cnt++
    j increment
