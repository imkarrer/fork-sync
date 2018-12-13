
<p align="center"><img src="img/forksink.jpg"></p>


0. Clone this repo and setup ssh access to github.

1. Build the docker image.  For this example we use `master` as a placeholder for your docker container name, which should resemble what branch and upstream you are keeping in sync.  We will use `master` in this example.

`docker build --build-arg GH_USER=<github_username> --build-arg REPO=<github_repo_name> --build-arg UPSTREAM=<upstream_owner_name> --build-arg BRANCH=master -t fork-sync/master:1.0 .`

2. Run the following to initialize the container and update your branch.

`docker run -it -v <path_to_gh_sshkey>:/root/.ssh --name master fork-sync/master:1.0`

3. Run the following to update your branch now that the container exists

`docker start master`