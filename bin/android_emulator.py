#!/usr/bin/env python3

import subprocess

print("Android Emulator Runner. Remember, build your emulator first through IntelliJ (idea.sh), then run them through this.\n")

# Grab list of available avds
devices = subprocess.check_output(["/root/Android/Sdk/emulator/emulator","-list-avds"]).strip().decode()

if devices == "":
    print("You have no devices currently created. Run AVD Manager via idea.sh to build them.")
    exit(1)

print("Which device do you want to start?")

devices = devices.split("\n")

for i, name in enumerate(devices):
    print("    {}. {}".format(i, name))

i = int(input("\nSelection: "))

tcpdump = input("Where to output network pcap to? Leave empty for no pcap: ").strip()

command = ["/root/Android/Sdk/emulator/emulator", "@" + devices[i], "-gpu", "swiftshader_indirect", "-skip-adb-auth", "-shell"]

if tcpdump != "":
    command += ["-tcpdump", tcpdump]

subprocess.Popen(command, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, stdin=subprocess.DEVNULL)

