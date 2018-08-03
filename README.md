
# Overview
This is primarily just a Dockerfile to build an image with tools helpful for Android and apk stuff.

# Building (optional)
Just build as you normally would:

```
sudo docker build -t android .
```

# Running
Pre-built images are on Dockerhub. To run without having to build yourself, use something like this:

```
sudo docker run -it --rm --network host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --shm-size 2G -v /dev/kvm:/dev/kvm --privileged -h android --name android bannsec/android_toolkit
```

# Installed tools
All the following are either in the path directly or aliased and can be run directly.

 - apkstudio -- APK editing and resigning
 - apktool -- Command-line tool for manipulating apk files
 - d2j-dex2jar.sh -- Converts .dex files to .jar files
 - idea.sh -- IntelliJ IDEA
 - jd-gui -- Graphical Java Decompiler
 - uber-apk-signer -- Command-line utility for easily signing APK files

Run android emulator via searching for "AVD Manager" in Intellij IDEA. NOTE! If your emulator doesn't start up correctly, switch the graphics type to Software emulated.

# TODO
Frida Android integration
