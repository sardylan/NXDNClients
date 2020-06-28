# NXDN Networking clients

These programs are clients for the NXDN networking built into the MMDVM Host.

The **Parrot** is very simple minded and can only handle one client at a time and
is therefore not suitable for use as a shared resource via the Internet.

The **Reflector** is used as a single talk group in the same way that it is with
P25. It also includes the option to link it to NXCore to allow for interchange
of audio between the two. At the NXCore end, it should be set up to receive the
traffic from only one talk group.

The **Gateway** allows for use of NXDN Talk Groups to control the access to the
various NXDN reflectors. It speaks the same language as Icom repeaters to the
MMDVM so can be used as a gateway for Icom NXDN repeaters. It also
includes experimental support for Kenwood NXDN repeaters.

The Gateway has an ini file that contain the parameters for running the
software. The filename of the ini file is passed as a parameter on the command
line. The Parrot takes the UDP port number to listen on as an argument.

The MMDVM .ini file should have the IP address and port number of the client in
the `[NXDN Network]` settings.

These programs build on 32-bit and 64-bit Linux as well as on Windows using
Visual Studio 2019 on x86 and x64.

This software is licenced under the GPL v2 and is intended for amateur and
educational use only. Use of this software for commercial purposes is strictly
forbidden.

## Debian/Ubuntu/Raspbian Package

### Dependencies

If you want to build DEB package, you have to first install all dependencies,
since NXDNGateway depends on a modern version of `libgps`.

On Debian Buster (10.4) you need to enable backports adding the following to
apt configuration:

```bash
echo "deb http://ftp.debian.org/debian buster-backports main" >> /etc/apt/sources.list
```

Update package lists and install the specific version of `libgps`.

```bash
apt clean
apt update
apt install libgps26
```

You will also need the related development package. Since debian backports seems
to adds only runtime libraries, you have to manually choose and download the related
one. Be sure that both the runtime and development package have the same version.

At the moment of writing this guide, it can be manually installed with the following
commands:

```bash
wget http://ftp.debian.org/debian/pool/main/g/gpsd/libgps-dev_3.20-12~bpo10+1_amd64.deb
dpkg -i libgps-dev_3.20-12~bpo10+1_amd64.deb
```

### Building

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

### Install

Debian package can be installed on the usual way:

```bash
dpkg -i NXDNclients-<version>-<arch>.deb
```

### Configurations

The package contains:

- Clients binary executables:
    - `/usr/bin/NXDNGateway`
    - `/usr/bin/NXDNParrot`
    - `/usr/bin/NXDNReflector`
- Configuration files:
    - `/etc/nxdn/NXDNGateway.ini`
    - `/etc/nxdn/NXDNReflector.ini`
- SystemD unit files:
    -`/usr/lib/systemd/system/nxdn-gateway.service`
    -`/usr/lib/systemd/system/nxdn-parrot.service`
    -`/usr/lib/systemd/system/nxdn-reflector.service`
- Common data files:
    -`/var/lib/nxdn/NXDN.csv`
    -`/var/lib/nxdn/NXDNHosts.txt`

The system services are configured to run processes as non-privileged user called `nxdn`, which will be created on package install.

Services are not configured to run at boot by default. Must be enabled using `systemctl` command.

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
