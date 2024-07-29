name: SSH deploy on push
on:
  push:
    branches:
      - main 

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Deploy wp-content to server
      env:
        DEPLOY_KEY: ${{ secrets.DEPLOY_KEY }}
        SERVER_USER: ${{ secrets.SERVER_USER }}
        SERVER_HOST: ${{ secrets.SERVER_HOST }}
        SERVER_PATH: ${{ secrets.SERVER_PATH }}
      run: |
        echo "$DEPLOY_KEY" > deploy_key
        chmod 600 deploy_key
        rsync -avz -e "ssh -i deploy_key -o StrictHostKeyChecking=no" / $SERVER_USER@$SERVER_HOST:$SERVER_PATH