# UDocker

## Info

**U**tility **Docker** wrapper that allows to work with single image and single container.

## Installation

**Note**: installing may require root privileges

- Using make:

  ```
  Supported variables:
    DESTDIR       - default is ''
    PREFIX        - default is '/usr'
    INSTALL_DIR   - default is '$(DESTDIR)$(PREFIX)/bin'    

  Supported targets:
    install           - simply copy script into INSTALL_DIR
    install-symlink   - create symlink to script into INSTALL_DIR
    uninstall         - remove installed script from INSTALL_DIR

  Example with defaults:
    make install
  
  Example with custom PREFIX:
    make PREFIX="$HOME/.local" install
  ```

- Using curl and '.scripts/obtain-udocker':

  ```
  Suppored variables:
    DESTDIR - default is ''
    PREFIX  - default is '/usr'
  
  Example with defaults:
    bash -c "source <(curl -s https://raw.githubusercontent.com/infinitus-inanis/udocker/main/.scripts/obtain-udocker)"

  Example with custom PREFIX:
    bash -c "\
      export PREFIX="$HOME/.local" &&\
      source <(curl -s https://raw.githubusercontent.com/infinitus-inanis/udocker/main/.scripts/obtain-udocker)\
    "
  ```

## Usage

**UDocker** uses environment variables to work. They can be defined manually or by sourcing a script before execution (see: `udocker-cfg` template or `.example`):

```
Required:
  UDOCKER_IMAGE       - name of docker image to build (used in conjunction with UDOCKER_TAG)
  UDOCKER_TAG         - tag of docker container to build (used in conjunction with UDOCKER_IMAGE)
  UDOCKER_CONTAINER   - name of docker container to run or exec

Optional:
  UDOCKER_NAME        - name of application (used for logs and help)
  UDOCKER_BUILD_OPTS  - options passed to 'build' command (see: docker build --help)
  UDOCKER_RUN_OPTS    - options passed to 'run' command (see: docker run --help)
  UDOCKER_EXEC_OPTS   - options passed to 'exec' command (see: docker exec --help)
```

Available commands:

```
help    - print help text
build   - execute 'docker build $UDOCKER_BUILD_OPTS -t $UDOCKER_IMAGE:$UDOCKER_TAG .'
run     - execute 'docker run $UDOCKER_RUN_OPTS --name $UDOCKER_CONTAINER $UDOCKER_IMAGE:$UDOCKER_TAG $@'
exec    - execute 'docker exec $UDOCKER_EXEC_OPTS $UDOCKER_CONTAINER $@'
stop    - execute 'docker stop $UDOCKER_CONTAINER'
clean   - forcefully remove container $UROCKER_CONTAINER and image $UDOCKER_IMAGE:$UDOCKER_TAG
```