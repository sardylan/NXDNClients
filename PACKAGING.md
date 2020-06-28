# Packaging

## Debian/Ubuntu/Raspbian Package

This guide aims to describe content and creation of the `.deb` package for NXDNClients.

The creation of packages is handled with CMake and CPack.

Since **Raspbian** is based on Debian, this guide can be applied also on RaspberryPies,
but it's still under testing.

### Description

All files are placed in filesystem as close as possible accordingly to Debian standard
for `.deb` packages.

The system services are configured to run processes as non-privileged user called `nxdn`,
which will be created on package install, if not already created.

Services are not configured to run at boot by default.
Must be enabled using `systemctl` command.

### Content

- Clients binary executables:
    - `/usr/bin/NXDNGateway`
    - `/usr/bin/NXDNParrot`
    - `/usr/bin/NXDNReflector`
- Configuration files:
    - `/etc/nxdn/NXDNGateway.ini`
    - `/etc/nxdn/NXDNGateway.ini-vanilla`
    - `/etc/nxdn/NXDNReflector.ini`
    - `/etc/nxdn/NXDNReflector.ini-vanilla`
- SystemD unit files:
    -`/usr/lib/systemd/system/nxdn-gateway.service`
    -`/usr/lib/systemd/system/nxdn-parrot.service`
    -`/usr/lib/systemd/system/nxdn-reflector.service`
- Environment files:
    - `/etc/default/nxdn-parrot`
- Common data files:
    -`/var/lib/nxdn/NXDN.csv`
    -`/var/lib/nxdn/NXDNHosts.txt`

All binaries are under `/usr/bin` folder.

All configuration files are under `/etc/nxdn` directory, and there are 2 copies of every one.
All `-vanilla` config file are set as read-only and contains the official unmodified version
of the file as released by the developers on Github, stored for reference.

The only service which does not use a config file and expect params on command line is the Parrot.
Configured as an environment variable, the listening port for the Parrot service can be modified
in `/etc/default/nxdn-parrot` file, which is already configure to be imported on Parrot unit file.

All common databse files are placed under `/var/lib/nxdn`, owned by the same not privileged user
`nxdn` (the same directory is also the HOME dir). A system cron is installed during package
installation which take care of downloading all databases from internet every day, at 2:00am.

All log files are placed under `/var/log/nxdn`. Files are rotated automatically by the services,
so no logrotate configuration is installed, for the moment.

To `enable` or `disable` services at boot, just run:

```bash
systemctl enable nxdn-gateway.service
systemctl disable nxdn-gateway.service

systemctl enable nxdn-parrot.service
systemctl disable nxdn-parrot.service

systemctl enable nxdn-reflector.service
systemctl disable nxdn-reflector.service
```

To `start`, `stop` or `restart` services, run:

```bash
systemctl start nxdn-gateway.service
systemctl stop nxdn-gateway.service
systemctl restart nxdn-gateway.service

systemctl start nxdn-parrot.service
systemctl stop nxdn-parrot.service
systemctl restart nxdn-parrot.service

systemctl start nxdn-reflector.service
systemctl stop nxdn-reflector.service
systemctl restart nxdn-reflector.service
```

### Dependencies

All clients are plain C++ tools which have no system dependencies. Only Gateway uses
`libgps`, so you have to install the pre-compiled library using apt.

NXDNGateway require a modern version of `libgps`, which is already available on
**Ubuntu Focal (20.04)**, but if you are using **Debian Buster (10.x)** you will have to
enable backports repositories using this command:

```bash
echo "deb http://ftp.debian.org/debian buster-backports main" >> /etc/apt/sources.list
```

Now you can update package lists and install the specific version of `libgps`.

```bash
apt clean
apt update
apt install libgps26
```

If you just install the NXDNClients package, you will need only the runtime package,
but if you want to build the package yourself, you will need to install also the
related development packages.

On **Ubuntu Focal (20.04)**, use this command:

```bash
apt install libgps-dev
```

On **Debian Buster (10.x)**, since debian backports repository seems to adds only
runtime libraries, you have to manually choose and download the related development
one. Be sure that both the runtime and development package have the same version.

At the moment of writing this guide, it can be manually installed with the following
commands:

```bash
wget http://ftp.debian.org/debian/pool/main/g/gpsd/libgps-dev_3.20-12~bpo10+1_amd64.deb
dpkg -i libgps-dev_3.20-12~bpo10+1_amd64.deb
```

### Install the package

Debian package can be installed on the usual way:

```bash
dpkg -i NXDNclients-<version>-<arch>.deb
```

### Building the package

Clone the project from Github, enter in its directory and run this:

```bash
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
make -j4
make package
```

The created package will be inside the `build` directory, will be compiled for the same
architecture of the machine running the build, and will have a name like:

`NXDNclients-<version>-<arch>.deb`
