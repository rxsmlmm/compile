    .option nopic
    .attribute arch, "rv64i2p1_m2p0_d2p2"
    .attribute unaligned_access, 0
    .attribute stack_align, 16

    .text
    .globl main
main:
    # 栈帧：保存 ra 和 s0-s5
    addi sp, sp, -64
    sd   ra, 56(sp)
    sd   s0, 48(sp)
    sd   s1, 40(sp)
    sd   s2, 32(sp)
    sd   s3, 24(sp)
    sd   s4, 16(sp)

    # s0 = a = 0
    li   s0, 0
    # s1 = b = 1
    li   s1, 1
    # s2 = i = 1
    li   s2, 1

    # n = getint()
    call getint
    mv   s3, a0          # s3 = n

    # putint(a); putch(10)
    mv   a0, s0
    call putint
    li   a0, 10
    call putch

    # putint(b); putch(10)
    mv   a0, s1
    call putint
    li   a0, 10
    call putch

    # while (i < n)
.Lloop:
    bge  s2, s3, .Lend    # if i >= n, 退出
    # t = b  -> s4
    mv   s4, s1
    # b = a + b
    add  s1, s0, s1
    # putint(b); putch(10)
    mv   a0, s1
    call putint
    li   a0, 10
    call putch
    # a = t
    mv   s0, s4
    # i = i + 1
    addi s2, s2, 1
    j    .Lloop

.Lend:
    # 恢复栈帧
    ld   ra, 56(sp)
    ld   s0, 48(sp)
    ld   s1, 40(sp)
    ld   s2, 32(sp)
    ld   s3, 24(sp)
    ld   s4, 16(sp)
    addi sp, sp, 64
    li   a0, 0
    ret
    