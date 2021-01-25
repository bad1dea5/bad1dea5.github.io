---
layout: default
title: KRAMPUS
category: private
---
## {{ page.title }}

### Version: 1.0

[<i class="fas fa-fw fa-external-link-alt"></i>](https://github.com/bad1dea5/KRAMPUS)

### Prerequisite
	
#### Android

- CMake `>= 3.16`
- Gradle `>= 6.7.1`
- Java JDK `>= 11.0.9`
- Android NDK `>= r21d`
- Android SDK `>= 29`

1. Install Java JDK
2. Extract gradle to `{PROJECT}/Tools/gradle`
3. Extract Android NDK to `{PROJECT}/Source/SDK/Android/NDK`
4. Extract Android SDK to `{PROJECT}/Source/SDK/Android/SDK`
5. Run `sdkmanager --sdk_root={PROJECT}/Source/SDK/Android/SDK "platform-tools" "platforms;android-29"`


#### Linux
	
- CMake `>= 3.16`
- GCC `>= 9.3.0`
- Make `>= 4.2.1`

1. Run `Build.Linux.sh [OPTIONS]`


#### Windows
	
- CMake `=> 3.16`
- Visual Studio 2019
	
If your building for Windows ARM64, you also need:
	
- Ninja `>= 1.8.2`
- ARM64 Toolset

1. Run `Build.Windows.ps1 [OPTIONS]`


### Building
	
```
-A, --architecture ARCH		: architecture to build for
-P, --platform PLATFORM		: platform to build for
-D, --debug			: build with debug information
```
