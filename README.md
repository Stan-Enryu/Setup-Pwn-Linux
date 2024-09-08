# Setup-Pwn-Linux

Burp Suite
JD-GUI
Flameshot

## Android

Android Studio
Android NDK
Android Virtual Device
Android Kernel Source Code

download "Command line tools only" 
echo 'pixel 2 - android 10 api 29 - x86_64'

--- Start

sdkmanager --install "cmdline-tools;latest" "emulator" "platform-tools" "build-tools;29.0.0" "platforms;android-29" "system-images;android-29;default;x86_64" 

sdkmanager "system-images;android-29;default;x86_64"

avdmanager create avd -n 'CVE2019' -k 'system-images;android-29;default;x86_64' -d 'pixel_2'

emulator -avd PIXEL2

sdkmanager "system-images;android-29;default;arm64-v8a"
sdkmanager "system-images;android-25;google_apis;armeabi-v7a"


--- List

sdkmanager --list
avdmanager list device

avdmanager delete avd -n 'PIXEL2'





