DEVICE := device/amazon/suez
KERNEL := kernel/amazon/suez
VENDOR := vendor/amazon/suez

# headers
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE)/include

# inherit from the proprietary version
-include $(VENDOR)/BoardConfigVendor.mk

# Platform
TARGET_BOARD_PLATFORM := mt8173

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := suez

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15

TARGET_CPU_ABI_LIST := arm64-v8a,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_64_BIT := arm64-v8a

# Kernel Config
BOARD_KERNEL_BASE := 0x40080000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x07f80000
BOARD_RAMDISK_OFFSET := 0x03400000
BOARD_SECOND_OFFSET := 0x00e80000

BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --second_offset $(BOARD_SECOND_OFFSET) 
TARGET_KERNEL_ARCH := arm64

TARGET_KERNEL_CONFIG := suez_defconfig
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := $(KERNEL)
KERNEL_TOOLCHAIN_PREFIX := /home/ggow/Android/lineage-16.0/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-

BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true

# Shims
TARGET_LD_SHIM_LIBS := \
	/system/lib/liblog.so|libshim_lab126.so \
	/system/lib64/liblog.so|libshim_lab126.so \
	/system/vendor/lib64/hw/hwcomposer.mt8173.so|libshim_atomic.so \
	/system/vendor/lib64/hw/hwcomposer.mt8173.so|libshim_ui.so \
	/system/vendor/lib64/libsrv_um.so|libshim_atomic.so \
	/system/vendor/lib/libsrv_um.so|libshim_atomic.so \
	/system/vendor/lib64/libgui_ext.so|libshim_gui.so \
	/system/vendor/lib/libmtkcam_stdutils.so|libshim_atomic.so \
	/system/vendor/lib/hw/audio.primary.mt8173.so|libshim_atomic.so \
	/system/vendor/lib/libasp.so|libshim_binder.so \
	/system/vendor/lib64/libgui_ext.so|libshim_binder.so \
	/system/vendor/lib64/libgui_ext.so|libshim_atomic.so \
	/system/vendor/bin/audiocmdservice_atci|libshim_media.so \
	/system/vendor/lib64/libui_ext.so|libshim_ui.so \
	/vendor/lib/mediadrm/libwvdrmengine.so|libshim_crypto.so \
	/system/vendor/bin/amzn_dha_hmac|libshim_crypto.so \
	/system/vendor/bin/amzn_dha_tool|libshim_crypto.so

# Binder API version
TARGET_USES_64_BIT_BINDER := true

WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE := mt66xx
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_STA:=P2P

# BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE)/bluetooth

# Graphics
BOARD_EGL_CFG := $(DEVICE)/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := true
TARGET_USES_ION := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 1024*1024

# Surfaceflinger optimization for VD surfaces
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
#NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 17825792
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1692925952
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x6b4300000 # 28792848384
BOARD_CACHEIMAGE_PARTITION_SIZE := 444596224
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

BLOCK_BASED_OTA := false

# Mainfest
DEVICE_MANIFEST_FILE := $(DEVICE)/manifest.xml
DEVICE_MATRIX_FILE   := $(DEVICE)/compatibility_matrix.xml

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file

# Seccomp filters
BOARD_SECCOMP_POLICY += $(DEVICE)/seccomp

# Assert
TARGET_OTA_ASSERT_DEVICE := suez

# Disable API check
WITHOUT_CHECK_API := true
