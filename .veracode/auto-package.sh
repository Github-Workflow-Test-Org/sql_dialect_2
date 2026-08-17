#!/bin/bash
set -e

# Determine source and target directories.
pushd $(dirname "$0") >/dev/null 2>&1
repo_root=`git rev-parse --show-toplevel`
output_dir="$repo_root/.veracode/output/auto"
popd

if [ -d "$output_dir" ]; then
    echo Deleting $output_dir directory...
    rm -rf $output_dir
fi

# Run the packager.
veracode package --source $repo_root --type directory --output $output_dir --trust

