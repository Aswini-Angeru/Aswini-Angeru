!/bin/bash

# Set your JFrog Artifactory URL and API credentials
JFROG_URL="https://your-jfrog-instance/artifactory/api"
JFROG_REPO="libs-release"  # or any repository where your libraries are hosted
OUTPUT_FILE="open_range_libraries.txt"

# Make a GET request to JFrog Artifactory API to fetch libraries with open versions
curl -u "your_username:your_password_or_token" \
    "${JFROG_URL}/search/aql" \
    -d 'items.find({"repo":"'"${JFROG_REPO}"'", "name": {"$match": "*.jar"}})' \
    | jq '.results[] | .name' > $OUTPUT_FILE

echo "Library list saved to $OUTPUT_FILE"