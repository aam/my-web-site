# Fast fail the script on failures.
set -e

if [ $TRAVIS_BRANCH = "master" ]; then
  echo
  echo "Installing gcloud"
  echo

  curl -o /tmp/google-cloud-sdk-91.0.1-linux-x86_64.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-91.0.1-linux-x86_64.tar.gz 
  tar xzf /tmp/google-cloud-sdk-91.0.1-linux-x86_64.tar.gz -C /tmp
  source '/tmp/google-cloud-sdk/path.bash.inc'

  which gcloud

  gcloud auth activate-service-account --key-file service-account.json
  gcloud -q preview app deploy --version=1 --project=my-website-1168 app.yaml
fi
