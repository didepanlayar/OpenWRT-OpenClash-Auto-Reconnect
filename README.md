<div align="center">
    <img src="https://res.cloudinary.com/rexcuni/image/upload/v1688969225/favicon_oxddqi.png" width="80px">
    <br>
    <h1>OpenClash Auto Reconnect</h1>
</div>
<p align="center">
    <a href="https://didepanlayar.com" target="_blank"><img alt="" src="https://img.shields.io/badge/Website-1DA1F2?style=normal&logo=dribbble&logoColor=white" style="vertical-align: center" /></a>
    <a href="https://instagram.com/didepanlayar" target="_blank"><img alt="" src="https://img.shields.io/badge/Instagram-DD2A7B?style=normal&logo=instagram&logoColor=white" style="vertical-align: center" /></a>
    <a href="https://www.youtube.com/@didepanlayar" target="_blank"><img alt="" src="https://img.shields.io/badge/YouTube-CD201F?style=normal&logo=youtube&logoColor=white" style="vertical-align: center" /></a>
</p>

## Description
Program to automatically reconnect for OpenClash when the internet is not working.

## Install Prerequisites
All requirements must be provided in your package. The most important are:
1. wget
2. adb
3. screen

## Overview
All equipment is used:
| System | Information               |
| ------ | ------------------------- |
| Model  | Amlogic Meson GXL (S905X) |
| Modem  | Smartphone Android        |

Make sure the Android smartphone modem is connected to the OpenWRT device with ADB.

## Install
Run the command below in the OpenWRT Terminal:

```sh
wget --no-check-certificate https://raw.githubusercontent.com/didepanlayar/OpenWRT-OpenClash-Auto-Reconnect/master/install.sh -O /tmp/install.sh && chmod +x /tmp/install.sh && /tmp/install.sh
```

## Run
Several steps to run this program.

1. Run directly.

    This program will run with the default host.

    ```sh
    get_net
    ```

    This program will run with a custom host.

    ```sh
    get_net example.com
    ```

2. Run with `screen`.

    ```sh
    screen -R network
    get_net example.com
    ```

    Press `CTRL+A+D` to exit the terminal and run the program in the background.

## Tech Stack
- Git
- Shell
- OpenWRT
- Visual Studio Code