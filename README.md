# [Project Mu](https://microsoft.github.io/mu/) UEFI Implementation for LG G4

## Description

This repository hosts the code and underlying work behind the Windows UEFI firmware "bootstrapper" for LG G4.

## Compatibility

| Device Name | Codenames/Internal Names | UEFI Port Status | Windows Bootability Status |
|---------------|--------------------------|------------------|----------------------------|
| LG G4 | F500 | ❌ | ❌* |

*Only EMMC and framebuffer will work in Windows currently, ACPI tables need adjustemnts.

## Build

### Minimum System Requirements

- At least 2 cores x86_64 processor running at 2Ghz or higher implementing the X86 ISA with 64 bit AMD extensions (AMD64) (Currently, building on any other ISA is not supported. In other words, do. not. build. this. on. a. phone. running. android. please.)
- SSD
- A linux environment capable of running below tool stack:
  - Bash
  - Python 3.10 or higher (python3.10, python3.10-venv, python3.10-pip)
  - mono-devel
  - git-core, git
  - build-essential
  - PowerShell Core 7
  - clang38 (or higher), llvm, ggc-aarch64-linux-gnu
- Exported CLANG38_BIN environment variable pointing to LLVM 10 binary folder
- Exported CLANG38_AARCH64_PREFIX variable equalling to aarch64-linux-gnu-

### Build Instructions

- Clone this repository to a reasonable location on your disk (There is absolutely no need to initialize submodules, stuart will do it for you later on)
- Run the following commands in order, with 0 typo, and without copy pasting all of them blindly all at once:

```
# Build UEFI
pip install --upgrade -r pip-requirements.txt
./build_uefi_F500.sh
./build_boot_shim.sh

# Generate boot image
./build_boot_images.sh
```

## Acknowledgements

- [WoA-Project](https://github.com/WOA-Project)
- [Gustave Monce](https://github.com/gus33000)
- [EFIDroid Project](http://efidroid.org)
- Andrei Warkentin and his [RaspberryPiPkg](https://github.com/andreiw/RaspberryPiPkg)
- Sarah Purohit
- [Googulator](https://github.com/Googulator/)
- [Ben (Bingxing) Wang](https://github.com/imbushuo/)
- Samuel Tulach and his [Rainbow Patcher](https://github.com/SamuelTulach/rainbow)

## License

All code except drivers in `GPLDriver` directory are licensed under BSD 2-Clause.
GPL Drivers are licensed under GPLv2 license.
