
 🚀 x86 Bootloader in Assembly

A minimal **16-bit x86 bootloader** written in NASM Assembly that prints "Hello, World!" using BIOS interrupts. Designed as a learning project for low-level programming and operating system development.

 🔧 Features

- Boots via BIOS legacy mode
- Prints text using `int 0x10` teletype output
- Proper segment register initialization
- 512-byte MBR with AA55 signature
- Makefile for easy building/running

 📦 Quick Start
 Requirements

- NASM (`sudo apt install nasm`)
- QEMU (`sudo apt install qemu-system-x86`)
- GNU Make

 Build & Run

```bash
make        # Assembles boot.bin and creates disk image
make run    # Launches in QEMU
make clean  # Removes build files
