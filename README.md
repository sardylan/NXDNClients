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

### Building

If you want to build DEB package, clone the project, enter in its directory and run this:

```bash
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
make -j4
make package
```

The created package will be inside the `build` directory, will be compiled for the same
architecture of the machine running the build, and will have a name like:

`nxdn_clients-<version>-<arch>.deb`

At the moment, **only the Reflector** is configured to be assembled in a package.

### Install

`deb` package can be installed on the usual way:

```bash
dpkg -i nxdn_clients-<version>-<arch>.deb
```

### Configurations

The package contains:

- Reflector binary executable: `/usr/bin/NXDNReflector`
- Configuration file: `/etc/nxdn/NXDNReflector.ini`
- SystemD unit file: `/usr/lib/systemd/system/nxdn.service`
- Log file: `/var/log/nxdn/NXDNReflector.log`

The system service is configured to run the following command:

`/usr/bin/NXDNReflector /etc/nxdn/NXDNReflector.ini`

as non-privileged user called `nxdn`, which will be created on package install.

System service is not configure to run at boot by default. Must be enabled as usual using `systemctl` command.

**Be sure to check `NXDNReflector.ini` configuration before enabling the service.**

To `enable` or `disable` the service at boot, just run:

```bash
systemctl enable nxdn.service
systemctl disable nxdn.service
```

To `start`, `stop` or `restart` the service, run:

```bash
systemctl start nxdn.service
systemctl stop nxdn.service
systemctl restart nxdn.service
```
