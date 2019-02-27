#!/usr/bin/env bash



# Delete the old dir
echo "==> Removing old directory..."
rm -f bin/*
rm -rf pkg/*
rm -rf release/*
mkdir -p bin/
mkdir -p release/

if ! which gox > /dev/null; then
    echo "==> Installing gox..."
    go get -u github.com/mitchellh/gox
fi

# Build!
echo "==> Building..."
gox \
    -os="linux" \
    -arch="amd64" \
    -output "pkg/linux_amd64/jwtgenerator" \
    .

cp pkg/linux_amd64/jwtgenerator bin/

# Done!
echo
echo "==> Results:"
ls -hl bin/
