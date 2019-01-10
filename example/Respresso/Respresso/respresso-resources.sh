#!/bin/sh
set -e

xcrun actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${!DEPLOYMENT_TARGET_SETTING_NAME}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}" --app-icon "${ASSETCATALOG_COMPILER_APPICON_NAME}" --output-partial-info-plist "${BUILD_DIR}/assetcatalog_generated_info.plist" "${SRCROOT}/Respresso/Respresso/Resources/color/RespressoColors.xcassets" "${SRCROOT}/hello-respresso-ios/Assets.xcassets" "${SRCROOT}/Respresso/Respresso/Resources/image/RespressoImages.xcassets"
