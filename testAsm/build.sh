if [ -z "$1" ]; then
	echo "Использование: $0 имя_файла.asm"
	exit 1
fi

if [ ! -f "$1" ]; then
	echo "Ошибка: Файл '$1' не найден"
	exit 1
fi

FILENAME=$(basename "$1" .asm)

echo "[1/3] Компиляция $FILENAME.asm..."
nasm -f elf64 "$1" -o "$FILENAME.o"
if [ $? -ne 0 ]; then
	echo "Ошибка компиляции!"
	exit 1
fi

echo "[2/3] Компоновка FILENAME.o..."
ld "$FILENAME.o" -o "$FILENAME"
if [ $? -ne 0]; then
	echo "Ошибка компоновки!"
	exit 1
fi

rm -f "FILENAME.o"

echo "[3/3] Запуск ./$FILENAME:"
echo "------------------------------------"
"./$FILENAME"
echo "------------------------------------"
echo "Выполнение завершено. Код возврата: $?"

