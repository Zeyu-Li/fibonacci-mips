.data
    prompt1: .asciiz "Enter the iternation count: "
    prompt2: .asciiz "The Fibonacci number is: "
    newLine: .asciiz  "\n"

.text
main:
    # print prompt1
    la  $a0, prompt1    # load string prompt1 into a0
    li  $v0, 4          # v0 = 4 is print string
    syscall

    # read from standard in
    li  $v0, 5          # v0 = 4 is read in string
    syscall

    # store in a0
    move $a0, $v0       # input is now in a0
    addi $a0, -1        # decrement a0

    # handles trivial case 1
    blez  $a0, trivialCase1  # jumps to trivial case if a0 is 0 or less
    # handles trivial case 2
    li  $t0, 1
    beq  $a0, $t0, trivialCase2  # jumps to trivial case if a0 is 1

    # setup for fibonacci
    li  $t0, 0
    li  $t1, 1
    addi $a0, -1        # decrement a0

    fib:
        addi $a0, -1    # decrement a0 for each loop
        add  $t2, $t1, $t0      # new fib is the sum of t1 and t0

        # shift the numbers down
        move $t0, $t1
        move $t1, $t2
        bne  $zero, $a0, fib    # recusively call fib if a0 is not 0

        # breaks off
        move $s0, $t1   # moves t1, the answer into s0 to be printed later
    
    end:

    # print prompt2
    la  $a0, prompt2    # load string prompt1 into a0
    li  $v0, 4          # v0 = 4 is print string
    syscall

    # print answer
    move $a0, $s0       # s0 stores answer to move to a0 stores the answer
    li $v0 1            # print int
    syscall

    # print new line
    la  $a0, newLine    # load string prompt1 into a0
    li  $v0, 4          # v0 = 4 is print string
    syscall

	jr	$ra             # end program

trivialCase1:
    li $s0, 0           # stores trival answer as 0
    j end               # jumps to program end

trivialCase2:
    li $s0, 1           # stores trival answer as 0
    j end               # jumps to program end

debug:
    # debug print
    li $v0 1
    syscall
