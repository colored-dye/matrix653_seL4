#
# Copyright 2018, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: BSD-2-Clause
#

cmake_minimum_required(VERSION 3.8.2)

project(camkes-arm-qemu-vm C)

include(${CAMKES_ARM_VM_HELPERS_PATH})

# Create our CPP Flags based on ARM VM config variables
if("${KernelARMPlatform}" STREQUAL "qemu-arm-virt")
    find_package(camkes-vm-rtos REQUIRED)
    include(${CAMKES_VM_RTOS_HELPERS_PATH})
    set(cpp_flags "-DKERNELARMPLATFORM_QEMU-ARM-VIRT")

    AddToFileServer("RTOS" "${CAMKES_VM_RTOS_DIR}/kernel.cpio")
    set(rootfs_file "${CAMKES_VM_IMAGES_DIR}/qemu-arm-virt/rootfs.cpio.gz")
    # AddToFileServer("linux-initrd" ${rootfs_file})
    # Updated dtb based on initrd
    # UpdateDtbFromInitrd(
    #     "${CAMKES_VM_IMAGES_DIR}/qemu-arm-virt/linux-dtb"
    #     ${rootfs_file}
    #     "0x4d700000"
    #     dtb_gen_target
    #     output_dtb_location
    # )
    # AddToFileServer("linux-dtb" "${output_dtb_location}" DEPENDS dtb_gen_target)

    include(simulation)
    set(SIMULATION ON CACHE BOOL "Generate simulation script to run qemu with the proper arguments")
    if(SIMULATION)
        GenerateSimulateScript()
    endif()

endif()

AddCamkesCPPFlag(cpp_flags CONFIG_VARS VmEmmc2NoDMA VmVUSB Tk1DeviceFwd Tk1Insecure)

DefineCAmkESVMFileServer()

CAmkESAddImportPath(${KernelARMPlatform})

# Declare root server
DeclareCAmkESRootserver(
    vm_minimal.camkes
    CPP_FLAGS
    ${cpp_flags}
    CPP_INCLUDES
    ${CAMKES_VM_DIR}/components/VM_Arm
)
