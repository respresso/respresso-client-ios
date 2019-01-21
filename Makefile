#!/usr/bin/xcrun make -f

PREFIX?=/usr/local

OUTPUT_FRAMEWORK=RespressoKit.framework

TEMPORARY_FOLDER?=/tmp/respresso.dst
FRAMEWORKS_FOLDER=/Library/Frameworks
RESOURCES_FOLDER=/usr/local/share/respresso
BINARIES_FOLDER=/usr/local/bin
INSTALL_FOLDER?=./install/respresso.dst

RM=rm -f
RMD=rm -rf
MKDIR=mkdir -p
SUDO=sudo
MV=mv -f
CP=cp
RSYNC=rsync -a --delete


prefix_install:
	$(MKDIR) "$(PREFIX)/Frameworks" "$(PREFIX)/bin" "$(PREFIX)/share"
	$(CP) -r "$(INSTALL_FOLDER)" "$(TEMPORARY_FOLDER)"
	$(RSYNC) "$(TEMPORARY_FOLDER)$(FRAMEWORKS_FOLDER)/$(OUTPUT_FRAMEWORK)" "$(PREFIX)/Frameworks/"
	$(RSYNC) "$(TEMPORARY_FOLDER)$(RESOURCES_FOLDER)" "$(PREFIX)/share"
	$(CP) -f "$(TEMPORARY_FOLDER)$(BINARIES_FOLDER)/respresso" "$(PREFIX)/bin/"
	# install_name_tool -delete_rpath "@executable_path/../Frameworks" "$(PREFIX)/bin/respresso"
	install_name_tool -rpath "/Library/Frameworks" "@executable_path/../Frameworks" "$(PREFIX)/bin/respresso"
	install_name_tool -rpath "/Library/Frameworks/RespressoKit.framework/Versions/Current/Frameworks" "@executable_path/../Frameworks/RespressoKit.framework/Versions/Current/Frameworks" "$(PREFIX)/bin/respresso"
