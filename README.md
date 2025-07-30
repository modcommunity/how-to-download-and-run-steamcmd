<div align="center">

![Banner](https://github.com/modcommunity/how-to-download-and-run-steamcmd/raw/main/images/banner.png)

</div>

A guide on how to download and run [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD) on both Linux and Windows.

SteamCMD is a [CLI tool](https://aws.amazon.com/what-is/cli/) that allows users to download applications from [Steam](https://store.steampowered.com/). This is often used for downloading dedicated server files in games such as Counter-Strike, [Left 4 Dead 2](https://store.steampowered.com/app/550/Left_4_Dead_2/), [Garry's Mod](https://store.steampowered.com/app/4000/Garrys_Mod/), [Rust](https://store.steampowered.com/app/252490/Rust/), and many more!

[**View Guide On TMC (Recommended Due To Better Formatting)**](https://forum.moddingcommunity.com/t/how-to-download-run-steamcmd-2025/190)

## Table Of Contents
* [Downloading & Running SteamCMD](#downloading--running-steamcmd)
    * [Windows](#windows)
    * [Linux](#linux)
* [Downloading Application Files](#downloading-application-files)
* [Automation With Script Files](#automation-with-script-files)
    * [Windows](#windows-1)
    * [Linux](#linux-1)
* [Conclusion](#conclusion)

## Downloading & Running SteamCMD
To start, you need to [download](https://developer.valvesoftware.com/wiki/SteamCMD#Downloading_SteamCMD) the SteamCMD tool. There are a few methods you can use to achieve this including downloading packages directly onto your system. However, for better control, we're going to [**manually**](https://developer.valvesoftware.com/wiki/SteamCMD#Manually) download SteamCMD.

### Windows
Instructions on downloading and extracting SteamCMD on Windows may be found [here](https://developer.valvesoftware.com/wiki/SteamCMD#Windows).

1. Download the `steamcmd.zip` file from [here](https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip).
1. Create a folder where you can store and extract the contents from the `steamcmd.zip` file. In this guide, we'll be using `E:\apps\steamcmd`.
1. Use Window's ZIP tool to extract the contents of `steamcmd.zip` into the newly created folder. Alternatively, you may use a tool such as [7-Zip](https://www.7-zip.org/).

You should now see a `steamcmd.exe` executable file that you can run.

![SteamCmd Files](https://github.com/modcommunity/how-to-download-and-run-steamcmd/raw/main/images/steamcmd_win_dirlist.png)

![SteamCmd Windows Start](https://github.com/modcommunity/how-to-download-and-run-steamcmd/raw/main/images/steamcmd_win_start.png)

### Linux
Instructions on downloading and extracting SteamCMD on Linux may be found [here](https://developer.valvesoftware.com/wiki/SteamCMD#Linux).

You will need to download and install a few system packages that are required to download, run, and extract SteamCMD along with run servers if you're downloading server files.

#### Debian/Ubuntu-Based (Apt)
```bash
sudo apt install -y lib32gcc-s1 lib32stdc++6 curl tar
```

**NOTE** - If you do not have `sudo` installed, you will need to login as root via the `su -` command and execute commands throughout this guide without using `sudo` at the beginning.

![SteamCMD Packages](https://github.com/modcommunity/how-to-download-and-run-steamcmd/raw/main/images/steamcmd_lin_packages.png)

While it isn't necessarily *required*, it is also recommended you create a separate user to run SteamCMD and game servers you plan on running if any.

You may use the following commands on Debian/Ubuntu-based systems to create a new user.

```bash
# Create apps group.
sudo groupadd apps

# Create apps user with home directory set to /home/apps and using /bin/bash as the shell.
sudo useradd -m -d /home/apps -g apps -s /bin/bash apps

# Login as apps.
sudo su apps -
```

![SteamCMD New User](https://github.com/modcommunity/how-to-download-and-run-steamcmd/raw/main/images/steamcmd_lin_newuser.png)

Next, you'll want to create a directory to store the contents from the `steamcmd_linux.tar.gz` file.

```
# Create a 'steamcmd/' directory inside the user's home directory.
mkdir ~/steamcmd

# Change directories to the created directory from above.
# Tip - You can also use 'cd $_' if you've just created the new directory.
cd ~/steamcmd
```

![SteamCMD New Directory](https://github.com/modcommunity/how-to-download-and-run-steamcmd/raw/main/images/steamcmd_lin_newdir.png)

Now, you'll want to download the [`steamcmd_linux.tar.gz`](https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz) file and extract it. I recommend using the `curl` or `wget` commands to download the file and `tar` to extract it. In this guide, we'll be using a one-liner that utilizes `curl` and `tar`.

```bash
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
```

If the command above was successful, you should see a new `steamcmd.sh` file when listing files in the new directory using a command such as `ls -l`.

![SteamCMD Download & Extract](https://github.com/modcommunity/how-to-download-and-run-steamcmd/raw/main/images/steamcmd_lin_dl.png)

You can now run the new `steamcmd.sh` program using the following command which'll also update the SteamCMD installation.

```bash
./steamcmd.sh
```

![SteamCMD Start](https://github.com/modcommunity/how-to-download-and-run-steamcmd/raw/main/images/steamcmd_lin_start.png)

## Downloading Application Files
Once you've launched SteamCMD, the first thing you'll need to do is set the directory where to install the application's files via the `force_install_dir` command.

For example, let's say we're downloading the Left 4 Dead 2 server files and want to install the server files into `/home/apps/l4d2` on Linux or `E:\apps\l4d2` on Windows.

On Linux, the command will look like below.

```bash
force_install_dir /home/apps/l4d2
```

On Windows, the command will look like below.

```bash
force_install_dir E:\apps\l4d2
```

Afterwards, you'll want to log into Steam using the `login <username>` command. When downloading dedicated server files for an application, most of the time you're allowed to sign in *anonymously* through SteamCMD. This means you **don't** have to input your Steam username or password before downloading the files! Instead, you may login anonymously using the below command.

```bash
login anonymous
```

If you're not downloading server files, you may need to specify your Steam username, password, and possibly 2FA code.

Next, you'll want to retrieve the app ID you'll like to install. If you're downloading server files, I recommend checking out [this list](https://developer.valvesoftware.com/wiki/Dedicated_Servers_List).

Here is a list of IDs from commonly downloaded server files for your convenience.

* Counter-Strike 2 - `730`
* Counter-Strike: Source - `232330`
* Left 4 Dead 2 - `222860`
* Garry's Mod - `4020`
* Team Fortress 2 - `232250`
* Rust - `258550`

Now, you'll want to use the `app_update <app ID>` command to download or update the application files. Additionally, you may add `validate` to the end of the command if you want to verify that the application files aren't corrupt. Keep in mind, passing `validate` to the end of the command will make the command take longer to finish!

For example, to download the Left 4 Dead 2 server files without validating the installation may be done with the following command.
```bash
app_update 222860
```
Here's another example of downloading the Left 4 Dead 2 server files and validating the installation.

```
app_update 222860 validate
```

It will take some time to download the server files depending on your network and disk speeds.

## Automation With Script Files
To simplify the process of creating or updating application files through SteamCMD, you can utilize script files. This allows you to execute a single script to download or update the application files automatically.

We will create a script with environmental variables that allows you to easily configure the locations of SteamCMD and your application files along with what app ID to download, etc.

Please follow the below steps.

#### Windows
We will create an `update-app.bat` Batch file inside of the folder where the application files are stored.

```batch
@echo off
set STEAM_CMD_LOC="E:\apps\steamcmd"
set STEAM_USER="anonymous"
set STEAM_PASS=""

set INSTALL_DIR="..\my-app"
set APP_ID="<APP ID>"

cd "%STEAM_CMD_LOC%"
start "" steamcmd.exe +force_install_dir "%INSTALL_DIR%" +login "%STEAM_USERNAME%" "%STEAM_PASSWORD%" +app_update %APP_ID% validate +quit
```

#### Linux
We will create an `update-app.sh` Bash script inside of the directory where the application files are stored.

```bash
#!/bin/bash
STEAM_CMD_LOC=../steamcmd/
STEAM_USER="anonymous"
STEAM_PASS=""

INSTALL_DIR=../my-app

APP_ID=<APP ID>

$STEAM_CMD_LOC/steamcmd.sh +force_install_dir $INSTALL_DIR +login "$STEAM_USER" "$STEAM_PASS" +app_update $APP_ID validate +quit
```

## Conclusion
That's it! By now, you should be able to automatically create and update applications through SteamCMD using script files or by executing commands one-by-one.

If you have any questions or suggestions on how to improve this guide, please reply to the topic [here](https://forum.moddingcommunity.com/t/how-to-download-run-steamcmd/190)! This guide will be worked and improved on over time.

Join our [Discord server](https://discord.moddingcommunity.com)!