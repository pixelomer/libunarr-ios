ARCHS := arm64
TARGET := iphone:16.5:15.0

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libunarr

libunarr_CFLAGS = -DHAVE_LIBLZMA -DHAVE_ZLIB \
    -DUNARR_IS_SHARED_LIBRARY -DUNARR_EXPORT_SYMBOLS -lto \
    -Wall -Wextra -pedantic -Wstrict-prototypes -Wmissing-prototypes \
    -Werror-implicit-function-declaration -fomit-frame-pointer \
    -Wno-missing-field-initializers -D_FILE_OFFSET_BITS=64 \
    -DUSE_ZLIB_CRC
libunarr_LDFLAGS = -undefined error -flto
libunarr_FILES = \
    unarr/_7z/_7z.c \
    unarr/common/conv.c \
    unarr/common/crc32.c \
    unarr/common/stream.c \
    unarr/common/unarr.c \
    unarr/lzmasdk/CpuArch.c \
    unarr/lzmasdk/Ppmd7.c \
    unarr/lzmasdk/Ppmd8.c \
    unarr/lzmasdk/Ppmd7Dec.c \
    unarr/lzmasdk/Ppmd7aDec.c \
    unarr/lzmasdk/Ppmd8Dec.c \
    unarr/rar/filter-rar.c \
    unarr/rar/uncompress-rar.c \
    unarr/rar/huffman-rar.c \
    unarr/rar/rar.c \
    unarr/rar/rarvm.c \
    unarr/rar/parse-rar.c \
    unarr/tar/parse-tar.c \
    unarr/tar/tar.c \
    unarr/zip/inflate.c \
    unarr/zip/parse-zip.c \
    unarr/zip/uncompress-zip.c \
    unarr/zip/zip.c
libunarr_LIBRARIES = lzma z
libunarr_INSTALL_PATH = /usr/lib

include $(THEOS_MAKE_PATH)/library.mk
