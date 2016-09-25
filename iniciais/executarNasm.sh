#!/bin/bash

NOME_PROGRAMA = $1

nasm -f elf64 -g `$NOME_PROGRAMA`.asm

gcc `$NOME_PROGRAMA`.o -o `$NOME_PROGRAMA`

./`$NOME_PROGRAMA`
