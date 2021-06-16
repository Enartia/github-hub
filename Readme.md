# Docker image for GitHub hub tool #
This image will allow running git along with GitHub hub tool in order to communicate with GitHub through command line. We use it in CircleCI configuration files to perform tasks such as automatic creation and update of pull requests.

# Prerequisites #
- [Docker Desktop](https://docs.docker.com/desktop/)

# Development workflow ##
- If you don't already have the repository in your local repositories folder, clone it.

        git clone git@github.com:Enartia/github-hub.git

- Make sure you have the latest changes of the `main` branch.

        git checkout main
        git pull origin main

- Create a branch based on your issue key, *e.g.* DEV-3043.

        git checkout -b DEV-3043

- Make changes in the Dockerfile and config.yml.
- Test your changes by building the Docker image and then run it.

        docker build -t github-hub . --build-arg HUB_VERSION=2.14.2
        docker run -ti github-hub hub version

- If everything went well, you should see something like:

        git version 2.32.0
        hub version 2.14.2

- Commit your changes and push them.

        git add .
        git commit -m "DEV-3043 Add my cool changes"
        git push origin DEV-3043 --force-with-lease

- Create a pull request.
- After your PR is reviewed and merged, the latest Docker image will be published in [Docker Hub](https://hub.docker.com/r/papaki/github-hub) along with the tag that corresponds to the GitHub hub version.