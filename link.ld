SECTIONS
{
  . = 0x80000000;
  .text : { *(.text) }
  .data : { *(.data) }
  .bss  : { *(.bss) }
  /* Define the stack section with a specified starting address and size */
  .stack :
  {
    . = ALIGN(8);  /* Align the stack to a 8-byte boundary */
    __stack_start = .; /* Define a symbol to mark the start of the stack */
    *(.stack) /* .stack section contains the stack */
    . += 0x4000;
    . = ALIGN(8);  /* Align the stack to a 8-byte boundary */
    __stack_end = .;   /* Define a symbol to mark the end of the stack */
  }
}