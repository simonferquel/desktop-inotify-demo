# Linux Workspace with inotify demo

This sample highlights that Linux Workspaces in Docker Desktop with WSL2 leverages native file system APIs for providing better performance, and inotify support

It must be cloned inside WSL2. Use VS Code remote to WSL to show/edit the code.

## Highlights

- ./start.sh:

It allows to develop the app in a container (no need for the dotnet tools on the dev machine)
It prints the current IP of the WSL VM for easier browsing.

It starts a dev container with `docker run --rm -it -p 2612:80 -v $(pwd):/app/ -w /app/aspnetapp -e DOTNET_USE_POLLING_FILE_WATCHER=0  mcr.microsoft.com/dotnet/core/sdk:2.2 dotnet watch run` 
DOTNET_USE_POLLING_FILE_WATCHER=0 means that we force dotnet watch to work with inotify.

Once running, modify anything in the C# code (like the messages in the Home/About controller action).
dotnet watch should pick up the file change