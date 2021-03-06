# Prints a number in hexadecimal, digit by digit.
# Written by Aris Efthymiou, 16/08/2005
# Based on hex.s program from U. of Manchester for the ARM ISA

        .data
prompt1:        .asciiz  "Enter decimal number.\n"
outmsg:         .asciiz  "The number in hex representation is:\n"

        .globl main

        .text
main:   
        # prompt for input
        li   $v0, 4
        la   $a0, prompt1
        syscall

        # Get number from user
        li   $v0, 5
        syscall
	  
	  # transfer number to $s0,
        add  $s0, $zero, $v0  

        # Output message
        li   $v0, 4
        la   $a0, outmsg
        syscall

        # set up the loop counter variable
        li   $t0, 32  # 32 binary digits in a 32-bit number

        # Main loop
loop:   srl  $t1, $s0, 31  # get leftmost digit by shifting it
                           # to the 4 most significant bits of $t1
                           
        # The following instructions convert the number to a char    
        
        addi  $t1, $t1, 48 # ASCII for '0' is 48
	  
	  j    print

        # Print one digit
print:  li   $v0, 11
        add  $a0, $zero, $t1
        syscall            # Print ASCII char in $a0

        # Prepare for next iteration
        sll  $s0, $s0, 1   # Drop current leftmost digit
        addi $t0, $t0, -1  # Update loop counter
        bne  $t0, $0, loop # Still not 0?, go to loop

        # end the program
        li   $v0, 10
        syscall
