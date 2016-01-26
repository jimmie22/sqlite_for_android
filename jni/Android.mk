$(info ====================================)
$(info current cpu arch: $(TARGET_ARCH_ABI))
$(info ====================================)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE    := sqlite
ifneq ($(TARGET_ARCH),arm)
LOCAL_CPPFLAGS  += -Os
endif

LOCAL_SRC_FILES := sqlite3.c

#include $(BUILD_STATIC_LIBRARY)
include $(BUILD_SHARED_LIBRARY)


#include $(CLEAR_VARS)
#LOCAL_MODULE:=sqlitetest
#LOCAL_SRC_FILES:=sqlite3_test.c
#LOCAL_STATIC_LIBRARIES:=libsqlite
##LOCAL_SHARED_LIBRARIES:=libsqlite
#LOCAL_LDLIBS:=-llog -lm
##include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_EXECUTABLE)
