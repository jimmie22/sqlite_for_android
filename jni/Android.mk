$(info ====================================)
$(info current cpu arch: $(TARGET_ARCH_ABI))
$(info ====================================)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE    := sqlite
LOCAL_CPPFLAGS  += -std=c++11 -Os
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
