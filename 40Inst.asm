# MARS的memory configura应选择第2个模式，即“Compact, Data at Address 0”
Test_Begin :
    lui     $t1, 0xABCD               # t1 = 0xABCD0000
    bgtz    $t1, Test_Err
    nop
    bgez    $t1, Test_Err
    nop
    slti    $t2, $t1, 0               # t2 = 0x00000001
    beq     $t2, $zero, Test_Err
    nop
    bne     $zero, $zero, Test_Err
    nop
    blez    $t1, Test_Continue
    nop

Test_Err :
    j       Test_Err
    
Test_Continue :    
    jal     TEST_ARITHLOGIC
    jal     TEST_STORELOAD
    jal     TEST_SHIFT
    j       Test_End


TEST_ARITHLOGIC :
    addi    $t0, $zero, -1          
    addiu   $t1, $zero, 1           # t0 = 0xFFFFFFFF PASS
    sub     $t2, $t0, $t1           # t1 = 0x00000001 PASS
    subu    $t2, $t1, $t0           # t2 = 0xFFFFFFFE PASS
    slt     $t2, $t0, $t1           # t2 = 0x00000002 PASS
    addu    $t2, $t0, $t1           # t2 = 0x00000001 PASS
									
    lui     $t1, 0x5555             # t2 = 0x00000000 PASS
    ori     $t1, $t1, 0x5555        # t1 = 0x55550000 PASS
    or      $t1, $t1, $zero         # t1 = 0x55555555 PASS
    xori    $t2, $t0, 0x5555        # t1 = 0x55555555 PASS
    and     $t2, $t0, $t1           # t2 = 0xFFFFAAAA PASS
    xor     $t2, $t0, $t1           # t2 = 0x55555555 PASS
    nor     $t2, $t0, $t1           # t2 = 0xAAAAAAAA PASS
    andi    $t2, $zero, 0x5555      # t2 = 0x00000000 PASS
    jr      $ra						# t2 = 0x00000000 PASS
    
TEST_STORELOAD :
    add     $s0, $zero,$zero        # $s0: the base address of data
    ori     $t0, $zero, 0x1280      # t0 = 0x00001280 PASS
    sw      $t0, 0($s0)             # *s0 = 0x0000001280 
    addi    $s0, $s0, 4
    sb      $t0, 0($s0)             # *(s0) = 0xxxxxxx80 
    addi    $t0, $t0, 1             # t0 = 0x00001281 PASS
    sb      $t0, 1($s0)             # *(s0+1) = 0xxxxx8180 
    sh      $t0, 2($s0)             # *(s0+2) = 0x12818180 
    lb      $t1, 0($s0)             # t1 = 0xFFFFFF80 PASS
    lbu     $t1, 0($s0)             # t1 = 0x00000080 PASS
    lh      $t1, 0($s0)             # t1 = 0xFFFF8180 PASS
    lhu     $t1, 0($s0)             # t1 = 0x00008180 PASS
    lw      $t1, 0($s0)             # t1 = 0x12818180 PASS
    sw	$zero, 0($zero)
    sw	$zero, 0($s0)
    jr      $ra


TEST_SHIFT :                        
    addi    $t0, $zero, -1          # t0 = 0xFFFFFFFF PASS
    sll     $t1, $t0, 31            # t1 = 0x80000000 PASS
    srl     $t2, $t1, 31            # t2 = 0x00000001 PASS
    sra     $t2, $t1, 31            # t2 = 0xFFFFFFFF PASS
    ori     $t0, $zero, 23          # t0 = 0x00000017 PASS
    sllv    $t2, $t1, $t0           # t2 = 0x00000000 PASS
    srlv    $t2, $t1, $t0           # t2 = 0x00000100 PASS
    srav    $t2, $t1, $t0           # t2 = 0xFFFFFF00 PASS
    jr      $ra
    
Test_End :
    j       Test_End

