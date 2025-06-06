#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),LH8n)

subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
$(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

# Creating Vendor Symlinks
VENDOR_SYMLINKS := \
    $(TARGET_OUT_VENDOR)/lib \
    $(TARGET_OUT_VENDOR)/lib64 \
    $(TARGET_OUT_VENDOR)/lib/hw \
    $(TARGET_OUT_VENDOR)/lib64/hw \
    $(TARGET_OUT_VENDOR)/lib/egl \
    $(TARGET_OUT_VENDOR)/lib64/egl

$(VENDOR_SYMLINKS): $(LOCAL_INSTALLED_MODULE)

	$(hide) echo "Making Vendor Symlinks"

	@mkdir -p $(TARGET_OUT_VENDOR)/lib/hw
	@mkdir -p $(TARGET_OUT_VENDOR)/lib64/hw
	@mkdir -p $(TARGET_OUT_VENDOR)/lib/egl
	@mkdir -p $(TARGET_OUT_VENDOR)/lib64/egl

	@ln -sf libSoftGatekeeper.so $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.default.so
	@ln -sf libSoftGatekeeper.so $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so
	@ln -sf libMcGatekeeper.so $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.trustonic.so
	@ln -sf libMcGatekeeper.so $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.trustonic.so
	@ln -sf kmsetkey.trustonic.so $(TARGET_OUT_VENDOR)/lib/hw/kmsetkey.default.so
	@ln -sf kmsetkey.trustonic.so $(TARGET_OUT_VENDOR)/lib64/hw/kmsetkey.default.so
	@ln -sf mt6833/libdpframework.so $(TARGET_OUT_VENDOR)/lib/libdpframework.so
	@ln -sf mt6833/libdpframework.so $(TARGET_OUT_VENDOR)/lib64/libdpframework.so
	@ln -sf mt6833/libpq_prot.so $(TARGET_OUT_VENDOR)/lib/libpq_prot.so
	@ln -sf mt6833/libpq_prot.so $(TARGET_OUT_VENDOR)/lib64/libpq_prot.so
	@ln -sf mt6833/libmtk_drvb.so $(TARGET_OUT_VENDOR)/lib/libmtk_drvb.so
	@ln -sf mt6833/libmtk_drvb.so $(TARGET_OUT_VENDOR)/lib64/libmtk_drvb.so
	@ln -sf mt6833/libaiselector.so $(TARGET_OUT_VENDOR)/lib/libaiselector.so
	@ln -sf mt6833/libaiselector.so $(TARGET_OUT_VENDOR)/lib64/libaiselector.so
	@ln -sf mt6833/libgpudataproducer.so $(TARGET_OUT_VENDOR)/lib/libgpudataproducer.so
	@ln -sf mt6833/libgpudataproducer.so $(TARGET_OUT_VENDOR)/lib64/libgpudataproducer.so
	@ln -sf mt6833/libnir_neon_driver.so $(TARGET_OUT_VENDOR)/lib/libnir_neon_driver.so
	@ln -sf mt6833/libnir_neon_driver.so $(TARGET_OUT_VENDOR)/lib64/libnir_neon_driver.so
	@ln -sf mt6833/libGLES_mali.so $(TARGET_OUT_VENDOR)/lib/egl/libGLES_mali.so
	@ln -sf mt6833/libGLES_mali.so $(TARGET_OUT_VENDOR)/lib64/egl/libGLES_mali.so
	@ln -sf mt6833/arm.graphics-V1-ndk_platform.so $(TARGET_OUT_VENDOR)/lib/arm.graphics-V1-ndk_platform.so
	@ln -sf mt6833/arm.graphics-V1-ndk_platform.so $(TARGET_OUT_VENDOR)/lib64/arm.graphics-V1-ndk_platform.so
	@ln -sf mt6833/arm.graphics-ndk_platform.so $(TARGET_OUT_VENDOR)/lib/arm.graphics-ndk_platform.so
	@ln -sf mt6833/arm.graphics-ndk_platform.so $(TARGET_OUT_VENDOR)/lib64/arm.graphics-ndk_platform.so
	@ln -sf mt6833/vulkan.mali.so $(TARGET_OUT_VENDOR)/lib/hw/vulkan.mali.so
	@ln -sf mt6833/vulkan.mali.so $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.mali.so
	@ln -sf mt6833/android.hardware.graphics.allocator@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so
	@ln -sf mt6833/android.hardware.graphics.allocator@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so
	@ln -sf mt6833/android.hardware.graphics.mapper@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so
	@ln -sf mt6833/android.hardware.graphics.mapper@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so
	@ln -sf /vendor/lib/egl/libGLES_mali.so $(TARGET_OUT_VENDOR)/lib/hw/vulkan.mt6833.so
	@ln -sf /vendor/lib64/egl/libGLES_mali.so $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.mt6833.so
	@ln -sf mt6833/libmcv_runtime.mtk.so $(TARGET_OUT_VENDOR)/lib64/libmcv_runtime.mtk.so
	@ln -sf mt6833/libDR.so $(TARGET_OUT_VENDOR)/lib64/libDR.so
	@ln -sf mt6833/libmnl.so $(TARGET_OUT_VENDOR)/lib64/libmnl.so

	$(hide) touch $@

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_SYMLINKS)

endif
