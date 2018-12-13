FROM alpine/git

RUN apk add --no-cache bash

SHELL ["/bin/bash", "-c"]

# Must set all 3 with --build-arg
ARG GH_USER
RUN test -n "$GH_USER"
ENV GH_USER=$GH_USER
ARG REPO
RUN test -n "$REPO"
ENV REPO=$REPO
ARG UPSTREAM
RUN test -n "$UPSTREAM"
ENV UPSTREAM=$UPSTREAM
ARG BRANCH
RUN test -n "$BRANCH"
ENV BRANCH=$BRANCH

VOLUME /workspace

WORKDIR /workspace

COPY ["updateForkedBranch.sh", "updateForkedBranch.sh"]

RUN ["chmod", "+x", "updateForkedBranch.sh"]

ENTRYPOINT ["bash", "updateForkedBranch.sh"]