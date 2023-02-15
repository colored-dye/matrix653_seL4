#
# Copyright 2019, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: BSD-2-Clause
#

set(CAMKES_VM_RTOS_DIR "${CMAKE_CURRENT_LIST_DIR}" CACHE STRING "")
set(CAMKES_VM_RTOS_HELPERS_PATH "${CMAKE_CURRENT_LIST_DIR}/vm-rtos-helpers.cmake" CACHE STRING "")
mark_as_advanced(
    CAMKES_VM_RTOS_DIR
    CAMKES_VM_RTOS_HELPERS_PATH
)

macro(camkes_vm_rtos_import_project)
    add_subdirectory("${CAMKES_VM_RTOS_DIR}" camkes-vm-RTOS)
endmacro()

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
    camkes-vm-rtos
    DEFAULT_MSG
    CAMKES_VM_RTOS_DIR
    CAMKES_VM_RTOS_HELPERS_PATH
)
