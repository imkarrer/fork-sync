#!/bin/bash

if [ ! -d ${REPO} ]; then
	git clone git@github.com:${GH_USER}/${REPO}.git
	pushd ${REPO}
	git remote add upstream git@github.com:${UPSTREAM}/${REPO}.git
	popd
fi

pushd ${REPO} && git checkout -f ${BRANCH} && git fetch upstream && git rebase upstream/${BRANCH} && git push && echo "Updated ${BRANCH} " || (echo "Failed to update ${BRANCH}" && exit 1)