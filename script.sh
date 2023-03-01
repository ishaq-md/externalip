#!/bin/bash

# Define variables
BUCKET_NAME=mi-dev-env
LOCAL_FILE=addresses_ips.txt
REMOTE_FILE=addresses_ips.txt

# Get md5 checksum of local file
LOCAL_MD5=$(md5sum "$LOCAL_FILE" | awk '{print $1}')

# Check if remote file exists
if gsutil -q stat "gs://${BUCKET_NAME}/${REMOTE_FILE}"; then
  # Get md5 checksum of remote file
  REMOTE_MD5=$(gsutil hash -h "gs://${BUCKET_NAME}/${REMOTE_FILE}" | awk '{print $3}')

  # Compare md5 checksums
  if [[ "$LOCAL_MD5" == "$REMOTE_MD5" ]]; then
    echo "Files are the same, skipping upload."
    exit 0
  fi
fi

# Upload file to GCS
gsutil cp "$LOCAL_FILE" "gs://${BUCKET_NAME}/${REMOTE_FILE}"
echo "File uploaded to GCS."
