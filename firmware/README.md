# Bigtime Firmware

## Setting Up ChibiOS
```
git submodule update --init
cd ChibiOS/ext
7za x lwip-1.4.1_patched.7z
cd ..
patch -p0 < ../lwip_ip_addr.patch
cd ..
```
