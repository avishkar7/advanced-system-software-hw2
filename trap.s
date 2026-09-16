.global _start

_start:
    # TODO_1:
    # 1. Load the trap_entry address into a register
    # 2. Write it into the control status register (CSR), mtvec using the csrw instruction



    
    # init stack pointer
    la sp, __stack_start # points to the start of the stack, see linker script.
    
    # TODO_2:
    # 1. Display a message in the terminal before triggering the trap handler
    # 2. (Optional) Display the current program counter value





    # TODO_3:
    # 1. Trigger a software interrupt with the ecall instruction



    # TODO_4:
    # 1. Display a message in the terminal after coming back from the trap handler
    # 2. (Optional) Display the current program counter value
    # 3. Halt the program using a loop







handle_trap:

    # TODO_5:
    # 1. Display a message in the terminal that tells the program is inside the trap handler
    # 2. (Optional) Display the current program counter value




    # TODO_6:
    # 1. Load the return address from the mepc reg
    # 2. Increment the address by one instruction
    # 3. Save the updated address in the mepc reg
    # 4. Jump back to the trap_entry






.align 2
trap_entry:
    # store state before handling the trap
    sd ra, 0*8(sp)
    sd a0, 1*8(sp)
    sd a1, 2*8(sp)
    sd a2, 3*8(sp)
    sd a3, 4*8(sp)
    sd a4, 5*8(sp)
    sd a5, 6*8(sp)
    sd a6, 7*8(sp)
    sd a7, 8*8(sp)
    sd t0, 9*8(sp)
    sd t1, 10*8(sp)
    sd t2, 11*8(sp)
    sd t3, 12*8(sp)
    sd t4, 13*8(sp)
    sd t5, 14*8(sp)
    sd t6, 15*8(sp)
    addi sp, sp, 17*8

    # TODO_7:
    # 1. Jump to the handle_trap



    # load state after handling the trap
    addi sp, sp, -17*8
    ld ra, 0*8(sp)
    ld a0, 1*8(sp)
    ld a1, 2*8(sp)
    ld a2, 3*8(sp)
    ld a3, 4*8(sp)
    ld a4, 5*8(sp)
    ld a5, 6*8(sp)
    ld a6, 7*8(sp)
    ld a7, 8*8(sp)
    ld t0, 9*8(sp)
    ld t1, 10*8(sp)
    ld t2, 11*8(sp)
    ld t3, 12*8(sp)
    ld t4, 13*8(sp)
    ld t5, 14*8(sp)
    ld t6, 15*8(sp)
    
    # TODO_8:
    # 1. Return to the main code using the mret instruction


.section .data

before:
    .string "Before trap handler\n"

inside:
    .string "Inside trap hander\n"

after:
    .string "After trap handler\n"