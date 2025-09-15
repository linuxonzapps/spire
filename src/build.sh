#!/bin/bash
set -e -o pipefail
read -ra arr <<< "$@"
version=${arr[1]}
trap 0 1 2 ERR
# Ensure sudo is installed
apt-get update && apt-get install sudo -y
bash /tmp/linux-on-ibm-z-scripts/Spire/${version}/build_spire.sh -y
tar cvfz spire-${version}-linux-s390x.tar.gz spire/bin/spire-agent spire/bin/spire-server spire/conf/agent/agent.conf spire/conf/server/server.conf
exit 0
