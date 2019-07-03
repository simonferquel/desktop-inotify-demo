#! /bin/sh

# this sets DOTNET_USE_POLLING_FILE_WATCHER=0 to force dothent watch to not use polling.
# this Docker Desktop Linux workspaces leverage the native Linux file system (and thus supports inotify)

echo "browse http://$(ifconfig eth0 | grep 'inet ' | cut -d: -f2 | awk '{print $2}'):2612"
docker run --rm -it -p 2612:80 -v $(pwd):/app/ -w /app/aspnetapp -e DOTNET_USE_POLLING_FILE_WATCHER=0  mcr.microsoft.com/dotnet/core/sdk:2.2 dotnet watch run
