# GitLab CI/CD

## GitLab Full-Stack Build Test Deploy

```yml
# Image for Pages Deployment
image:
  name: node:lts

variables:
  APPLICATION: taskmaster-client

# Shared Build Script
.script-run-build: &script-run-build |
  echo "Current Application:"$APPLICATION

  # Ensure directory for the app exists
  if [ ! -d "$APPLICATION" ]; then
    echo "CURRENT APP not set, or directory does not exist - nothing to build!"
  else
    cd $APPLICATION
    echo "Create subfolder in GitLab public folder"
    mkdir ../public/$APPLICATION
    npm install --loglevel=error
    npm run build --loglevel=error
    echo "Copy build folder to GitLab public folder"
    cp -p -r build/* ../public/$APPLICATION
  fi
  echo "Return to the root directory"
  cd ..

# Cache for Node Modules
cache:
  key: ${CI_COMMIT_REF_SLUG}-${CI_JOB_NAME}
  paths:
    - ${CI_PROJECT_DIR}/$APPLICATION/node_modules/
  policy: pull-push

# Pages Deployment Job
pages:
  stage: deploy
  script:
    - CI="" # Ignore warnings
    - sed -i "s|</body>|<div style=\"float:left\"><small>Built on GitLab branch <code>$CI_COMMIT_REF_NAME</code> commit <code>$CI_COMMIT_SHORT_SHA</code> $(date)</small></div></body>|g" public/index.html
    - echo "Check current directory"
    - pwd
    - APPLICATION=$APPLICATION
    - *script-run-build
    - echo "URL for TaskMaster:"$CI_PAGES_URL/$APPLICATION
  artifacts:
    paths:
      - public

# Test Runner Job
test:
  image:
    name: kalrabb/swen344-pg-py-base:latest

  services:
    - postgres:14

  variables:
    POSTGRES_DB: swen610
    POSTGRES_USER: swen610
    POSTGRES_PASSWORD: whowatchesthewatchmen
    PYTHON_RUN: python3
    PYTHONPATH: "${PYTHONPATH}:${CI_PROJECT_DIR}"

  before_script:
    - apt-get update && apt-get install -y curl
    - pip install -r requirements.txt
    - cp config/gitlab-credentials.yml config/db.yml
    - $PYTHON_RUN --version

  script:
    - $PYTHON_RUN taskmaster-server/server.py & # fire up the server before we run our tests
    - for i in {1..10}; do curl -s http://localhost:5000/manage/version && break || sleep 2; done # wait for the server to start
    - echo "Server started. Running tests."
    - $PYTHON_RUN -m unittest -v # run the unit tests; -v prints the test being run

  stage: test
  ```
