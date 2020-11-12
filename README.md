[![Build](https://github.com/uroesch/DBeaverPortable/workflows/build-package/badge.svg)](https://github.com/uroesch/DBeaverPortable/actions?query=workflow%3Abuild-package)
[![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/uroesch/DBeaverPortable?include_prereleases)](https://github.com/uroesch/DBeaverPortable/releases)
[![Runs on](https://img.shields.io/badge/runs%20on-Win64-blue)](#runtime-dependencies)
[![Depends on](https://img.shields.io/badge/depends%20on-Java-blue)](https://portableapps.com/apps/utilities/OpenJDKJRE64)
![GitHub All Releases](https://img.shields.io/github/downloads/uroesch/DBeaverPortable/total?style=flat)

# DBeaver Community Edtion Portable for PortableApps.com

<img src="App/AppInfo/appicon_128.png" align=left>

[DBeaver Community Edition](https://dbeaver.io) is a free multi-platform 
database tool for developers, database administrators, analysts and all 
people who need to work with databases. Supports all popular databases: 
MySQL, PostgreSQL, SQLite, Oracle, DB2, SQL Server, Sybase, MS Access, 
Teradata, Firebird, Apache Hive, Phoenix, Presto, etc.

With DBeaver you are able to manipulate your data like in a regular 
spreadsheet, create analytical reports based on records from different 
data storages, export information in an appropriate format. For advanced 
database users DBeaver suggests a powerful SQL-editor, plenty of 
administration features, abilities of data and schema migration, 
monitoring database connection sessions, and a lot more.

## Runtime dependencies
* 64-bit version of Windows.
* 64-bit version of Java e.g.
  [OpenJDK JRE 64](https://portableapps.com/apps/utilities/OpenJDKJRE64),
  [OpenJDK 64](https://portableapps.com/apps/utilities/OpenJDK64),
  [JRE 64](https://portableapps.com/apps/utilities/java_portable_64) or
  [JDK 64](https://portableapps.com/apps/utilities/jdkportable64) 

## Support matrix

| OS              | 32-bit             | 64-bit              | 
|-----------------|:------------------:|:-------------------:|
| Windows XP      | ![ns][ns]          | ![nd][nd]           | 
| Windows Vista   | ![ns][ns]          | ![ps][ps]           | 
| Windows 7       | ![ns][ns]          | ![ps][ps]           |  
| Windows 8       | ![ns][ns]          | ![ps][ps]           |  
| Windows 10      | ![ns][ns]          | ![fs][fs]           |

Legend: ![ns][ns] not supported;  ![nd][nd] no data; ![ps][ps] supported but not verified; ![fs][fs] verified;`

## Status 
This PortableApps project is in beta stage. 

## Todo
- [ ] Documentation

## Installation

The Packages found under the release page are not digitally signed so there the installation
is a bit involved. 

After download the `.paf.exe` installer trying to install may result in a windows defender
warning.

<img src="Other/Images/info_defender-protected.png" width="260">

To unblock the installer and install the application follow the annotated screenshot below.

<img src="Other/Images/howto_unblock-file.png" width="600">

1. Right click on the executable file.
2. Choose `Properties` at the bottom of the menu.
3. Check the unblock box. 

## Build

### Prerequisites

* [PortableApps.com Launcher](https://portableapps.com/apps/development/portableapps.com_launcher)
* [PortableApps.com Installer](https://portableapps.com/apps/development/portableapps.com_installer)
* [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7)
* [Wine (Linux / MacOS only)](https://www.winehq.org/) or [Docker (Linux)](https://www.docker.com/)

### Build

#### Windows 10

To build the installer run the following command in the root of the git
repository.

```
powershell -ExecutionPolicy ByPass -File Other/Update/Update.ps1
```

#### Linux (Wine)

To build the installer under Linux with Wine and PowerShell installed run the 
command below.
```
pwsh Other/Update/Update.ps1
```

#### Linux (Docker)

For a Docker build run the following command. 

```
curl -sJL https://raw.githubusercontent.com/uroesch/PortableApps/master/scripts/docker-build.sh | bash 
```

[nd]: Other/Icons/no_data.svg
[ns]: Other/Icons/no_support.svg
[ps]: Other/Icons/probably_supported.svg
[fs]: Other/Icons/full_support.svg
