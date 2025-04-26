all: main.bin disk.img

main.bin: src/main.asm
	nasm -f bin src/main.asm -o build/main.bin
	
disk.img: main.bin
	dd if=/dev/zero of=build/disk.img bs=512 count=2880
	dd if=build/main.bin of=build/disk.img conv=notrunc
	
run: disk.img
	qemu-system-x86_64 -fda build/disk.img
	
clean:
	rm -f build/*
