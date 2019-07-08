#! /bin/sh

# this sets DOTNET_USE_POLLING_FILE_WATCHER=0 to force dothent watch to not use polling.
# this Docker Desktop Linux workspaces leverage the native Linux file system (and thus supports inotify)

docker build -t dotnet-debug -f Dockerfile.debugger .
docker run --name aspnetapp --rm -it -p 2612:80 -v $(pwd):/app/ -w /app/aspnetapp -e DOTNET_USE_POLLING_FILE_WATCHER=0  dotnet-debug dotnet run
