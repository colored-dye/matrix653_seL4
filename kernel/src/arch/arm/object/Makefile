#
# Copyright 2014, General Dynamics C4 Systems
#
# This software may be distributed and modified according to the terms of
# the GNU General Public License version 2. Note that NO WARRANTY is provided.
# See "LICENSE_GPLv2.txt" for details.
#
# @TAG(GD_GPL)
#

DIRECTORIES += src/arch/arm/object

ARCH_C_SOURCES += object/interrupt.c object/objecttype.c object/tcb.c

ifneq (ARM_HYP,)
ARCH_C_SOURCES += object/vcpu.c
endif
