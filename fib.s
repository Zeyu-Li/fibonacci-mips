.data
    prompt1: .asciiz "Enter the iternation count: "
    prompt2: .asciiz "The Fibonacci number is: "

.text
main:
    # print prompt1
    la  $a0, prompt1    # load string prompt1 into a0
    li  $v0, 4          # v0 = 4 is print string
    syscall

    # read from standard in
    li  $v0, 5          # v0 = 4 is read in string
    syscall

    # store in t0
    move $a0, $v0       # input is now in a0

    # debug print
    li $v0 1
    syscall

	jr	$ra             # end program
