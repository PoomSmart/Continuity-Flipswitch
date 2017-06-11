TARGET = iphone:latest:8.0

include theos/makefiles/common.mk

BUNDLE_NAME = Handoff
Handoff_FILES = Switch.xm
Handoff_PRIVATE_FRAMEWORKS = ManagedConfiguration
Handoff_LIBRARIES = flipswitch
Handoff_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk
