#!/bin/sh
ls -ld `dirname ${OUTPUT_FILE}`
curl -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GITHUB_TOKEN}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/opiopan/DigViewer/releases > "${OUTPUT_FILE}"