#!/bin/sh
curl -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GITHUB_TOKEN}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/opiopan/DigViewer/releases |\
python3 -c "
import json, sys, re
data = json.load(sys.stdin)
version = re.sub('^[vV]', '', data[0]['name'])
url = [a for a in filter(lambda asset: re.search('\.[dD][mM][gG]\$', asset['name']), data[0]['assets'])][0]['browser_download_url']
print('{\"version\":\"%s\", \"url\":\"%s\"}'%(version, url))
" > "${OUTPUT_FILE}"
