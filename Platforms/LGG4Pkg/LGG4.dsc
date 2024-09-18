## @file
#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = LGG4
  PLATFORM_GUID                  = b6325ac2-9f3f-4b1d-b129-ac7b35ddde60
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/LGG4-$(ARCH)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = LGG4Pkg/LGG4.fdf
  SECURE_BOOT_ENABLE             = 1
  USE_PHYSICAL_TIMER             = 1
  USE_SCREEN_FOR_SERIAL_OUTPUT   = 1
  USE_MEMORY_FOR_SERIAL_OUTPUT   = 0
  SEND_HEARTBEAT_TO_SERIAL       = 0
  MEMORY_3GB                     = 1

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DSILICON_PLATFORM=8992

[PcdsFixedAtBuild.common]
  # Platform-specific
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xC0000000        # 3GB Size

  # SMBIOS
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosSystemModel|"LG G4"
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"LG F500"
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"LG F500"
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosBoardModel|"LG G4"

  # Simple FrameBuffer
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0x3400000
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1440
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2560
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32

[PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1440
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|2560
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1440
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|2560
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|160
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|120

!include QcomPkg/QcomPkg.dsc.inc
!include NexusFamilyPkg/NexusFamily.dsc.inc
!include NexusFamilyPkg/Frontpage.dsc.inc