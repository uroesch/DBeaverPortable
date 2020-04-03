[![Build](https://github.com/uroesch/DBeaverPortable/workflows/build-package/badge.svg)](https://github.com/uroesch/DBeaverPortable/actions?query=workflow%3Abuild-package)
[![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/uroesch/DBeaverPortable?include_prereleases)](https://github.com/uroesch/DBeaverPortable/releases)
[![Runs on](https://img.shields.io/badge/runs%20on-Win64-blue)](#runtime-dependencies)
[![Depends on](https://img.shields.io/badge/depends%20on-Java-blue)](https://portableapps.com/apps/utilities/OpenJDKJRE64)

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

## Build

### Prerequisites

* [PortableApps.com Launcher](https://portableapps.com/apps/development/portableapps.com_launcher)
* [PortableApps.com Installer](https://portableapps.com/apps/development/portableapps.com_installer)
* [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7)
* [Wine (Linux / MacOS only)](https://www.winehq.org/)

### Build

To build the installer run the following command in the root of the git repository.

```
powershell Other/Update/Update.ps1
```

[nd]: Other/Icons/no_data.svg
[ns]: Other/Icons/no_support.svg
[ps]: Other/Icons/probably_supported.svg
[fs]: Other/Icons/full_support.svg
