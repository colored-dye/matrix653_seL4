cmake_minimum_required(VERSION 3.8.2)
include(settings.cmake)
project(camkes-vm C CXX ASM)

if(AppArch STREQUAL "x86")
    message(STATUS "AppArch: " ${AppArch})
else()
    message(FATAL_ERROR "Unsupported")
endif()

