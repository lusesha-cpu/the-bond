#!/bin/bash
# The Bond by NGM - publish to Firebase Hosting
set -e
cd ~ && rm -rf thebond && mkdir thebond && cd thebond
curl -sL "https://raw.githubusercontent.com/lusesha-cpu/the-bond/main/bundle.b64?$(date +%s)" | tr -d '\n' | base64 -d > tb.tgz
echo "bundle sha: $(sha256sum tb.tgz | cut -c1-16)"
tar xzf tb.tgz && rm tb.tgz
firebase deploy --only hosting --project the-bond-ngm --non-interactive
echo DEPLOY_DONE
