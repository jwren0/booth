ENTRY(_start)

OUTPUT_FORMAT("binary")

SECTIONS
{
    . = 0x7c00;
    .text :
    {
        *(.*)
        . = 510;
        SHORT(0xaa55)
    }
}
