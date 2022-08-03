# Git demo

In this section we demonstrate the use of git locally.

## Before class

Install [GitHub CLI](https://cli.github.com/), [Git](https://git-scm.com/downloads), [Windows Terminal](https://www.microsoft.com/en-au/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab) (or any other terminal), and [Dotnet SDK](https://dotnet.microsoft.com/download).

### Installing GitHub CLI

You can install the CLI using `winget` by running the following command on _Windows_:

```bash
winget install --id GitHub.cli
```

Use the following on _macOS_:

```bash
brew install gh
```

And for _Linux_:

```bash
./install-github-cli.sh
```

### Installing DotNet SDK

To install the DotNet SDK, you will need the following command on _Windows_ (feel free to install a higher version of DotNet):

```bash
winget install -e --id Microsoft.dotnet -v 3.1.410.15736
```

To install on _macOS_ refer to [this link](https://docs.microsoft.com/en-gb/dotnet/core/install/macos) and for _Linux_ [here](https://docs.microsoft.com/en-gb/dotnet/core/install/linux).

## During the class

Depending on whether you use PowerShell or Bash, use either the `powershell.azcli` or `bash.azcli` and run the commands in your terminal. I would normally use VS Code which makes it easier.
