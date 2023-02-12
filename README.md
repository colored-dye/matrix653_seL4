Run Matrix653 & Linux on seL4, ARM64 platform.
  
https://github.com/smaccm/sel4arm-vmm-manifest

```sh
make odroidxu_vm_linux_defconfig
make
```

Problems:

1. `CONST`: delete them.
2. `-Werror=attributes`: delete the line with "compiler_assert".

## Layout

- apps: -> projects/sel4arm-vmm/apps
- projects:
    - linux: Linux kernel files.
    - sel4arm-vmm: VM app.
        - apps
            - linux: Linux kernel config.
            - sel4arm-vmm: VM app source files.
        - configs
            - arndale_vm_linux_defconfig
            - odroidxu_vm_linux_defconfig
- kernel: seL4 microkernel
- libs:
    - libcpio
    - libelf
    - libmuslc
    - libplatsupport
    - libsel4: kernel -> libs/libsel4
    - libsel4allocman
    - libsel4arm-vmm
    - libsel4muslsys
    - libsel4platsupport
    - libsel4support
    - libsel4simple
    - libsel4simple-default
    - libsel4simple-stable
    - libsel4test
    - libsel4twinkle
    - libsel4utils
    - libsel4vka
    - libsel4vspace
    - libutils
- tools:
    - common
    - elfloader
    - kbuild

qemu-system-arm \
    -kernel stage/arm/exynos5/kernel.elf \
    -cpu cortex-a15 \
    -machine virt 
