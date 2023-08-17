#!/bin/sh
curl -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GITHUB_TOKEN}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/opiopan/DigViewer/releases |\
python3 -c "
import json, sys, re
data = json.load(sys.stdin)
print('<latest>%s</latest>'%(re.sub('^[vV]', '', data[0]['name'])))
" > "${OUTPUT_FILE}"
