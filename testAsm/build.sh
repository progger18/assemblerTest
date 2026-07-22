#!/bin/bash
FILE="test_4"

echo "=== Сборка файла $FILE.asm ==="
nasm -f elf64 $FILE.asm -o $FILE.o

if [ $? -eq 0 ]; then
    ld $FILE.o -o $FILE
    
    if [ $? -eq 0 ]; then
        echo "=== Сборка успешна! Запуск бинарного файла $FILE ==="
        ./$FILE
    else
        echo "Ошибка на этапе компоновки (ld)"
    fi
else
    echo "Ошибка на этапе компиляции (nasm)"
fi

