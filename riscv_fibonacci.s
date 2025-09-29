.data
numeros:    .word   42, 15, 33, 7, 28, 19, 46, 3, 39, 38, 11, 25, 0, 36, 8, 17, 44, 31, 12, 23, 48, 5, 29, 14, 41, 2, 35, 20, 9, 47, 16, 34, 1, 27, 10, 43, 6, 32, 21, 18, 45, 13, 30, 4, 37, 24, 49, 26, 40, 22 # numeros en memoria
cant:       .word 50

.text
main:
    la a0, numeros      # base de memoria
    lw t0, cant         # cantidad de numeros
    addi t0, t0, -1
    slli t1, t0, 2      # indice 1 -> ultimo numero
    li t2, 0            # indice 2 -> primer numero

    add a1, a0, t1      # direccion 1
    add a2, a0, t2      # direccion 2

busca:
    blt a2, a1, no_next  # if a2 >= a1:
    add a2, a0, t2          # direccion 2 -> primer numero
    addi a1, a1, -4
no_next:
    beq a1, a0, fin
    lw a3, 0(a2)               # contenido numero 2
    lw a4, 4(a2)            # contenido numero siguiente
    blt a3, a4, not_change
    sw a3, 4(a2)            # deshacer rotacion del indice 2 con siguiente
    sw a4, 0(a2)

not_change:
    addi a2, a2, 4          # siguiente indice 2
    j busca
fin:
    nop