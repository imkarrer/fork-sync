#!/bin/bash

if [ ! -d cloud ]; then
	git clone git@github.com:${GH_USER}/${REPO}.git
	pushd cloud
	git remote add upstream git@github.com:${UPSTREAM}/cloud.git
	popd
fi

pushd cloud && git checkout -f ${BRANCH} && git fetch upstream && git rebase upstream/${BRANCH} && git push && echo "Updated ${BRANCH} " || (echo "Failed to update ${BRANCH}" && exit 1)