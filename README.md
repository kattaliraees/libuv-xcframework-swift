# libuv-xcframework-swift

[libuv](https://github.com/libuv/libuv) as XCFramework to use in iOS/MacOS Swift project

to generate the XCFramework file to use in your swift projects, after building run below scripts in terminal

```bash
cd to-project-directory

xcodebuild archive -scheme UVLib -configuration Release -destination 'generic/platform=iOS' -archivePath './build/UVLib.framework-iphoneos.xcarchive' SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild archive -scheme UVLib -configuration Release -destination 'generic/platform=iOS Simulator' -archivePath './build/UVLib.framework-iphonesimulator.xcarchive' SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework -framework './build/UVLib.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/UVLib.framework' -framework './build/UVLib.framework-iphoneos.xcarchive/Products/Library/Frameworks/UVLib.framework' -output './build/UVLib.xcframework'
```
