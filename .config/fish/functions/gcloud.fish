#!/usr/bin/env fish

function gcloud -d "Run Google Cloud commands"
  set cmd gcloud

  docker run --rm -ti \
    -v (pwd):(pwd) \
    -v $HOME/.config/gcloud:/root/.config/gcloud \
    -v $HOME/.kube:/root/.kube \
    frealmyr/cloud-sdk-editors:latest gcloud $argv
end

