#!/bin/sh
curl -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GITHUB_TOKEN}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/opiopan/DigViewer/releases |\
python3 -c "
    import json, sys
    data = json.load(sys.stdin, encoding='utf-8')
    print("<latest>%s</latest>"%(data[0]["name"]))
" > "${OUTPUT_FILE}"
