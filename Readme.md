# Docker image for GitHub hub tool #
This image will allow running git along with [GitHub hub](https://hub.docker.com/r/papaki/github-hub) tool in order to communicate with GitHub through command line. We use it in CircleCI configuration files to perform tasks such as automatic creation and update of pull requests.

# Prerequisites #
- [Docker Desktop](https://docs.docker.com/desktop/) for local usage.
- [Make](https://www.gnu.org/software/make/) for [development](Development.md).
    - To install on Windows, you can either:
        - Download [Make for Windows](http://gnuwin32.sourceforge.net/packages/make.htm) or 
        - [Install Chocolatey](https://chocolatey.org/install) and then call:

                choco install make

# Usage #
In order to use the image in CircleCI you can reference it as:

    - image: papaki/github-hub

If you want to get it from [Docker Hub](https://hub.docker.com/r/papaki/github-hub) for local usage you can use:

    docker pull papaki/github-hub