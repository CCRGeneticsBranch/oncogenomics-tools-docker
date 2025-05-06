# oncogenomics-tools-docker

1. clone docker repo
   ```
   git clone https://github.com/CCRGeneticsBranch/oncogenomics-tools-docker
   cd oncogenomics-tools-docker
   ```
2. clone oncogenomics tools
   ```
   git clone https://github.com/CCRGeneticsBranch/oncogenomics-tools app
   ```
3. create .env file
   ```
    FLASK_SECRET_KEY=
    TIER="dev"
    HOME_URI=oncogenomics-tools.cancer.gov
    MOUNT=/mnt/otl
    
    #mysql
    DATABASE_URL=

    #mysql container
    MYSQL_ROOT_PASSWORD=
    MYSQL_DATABASE=
    MYSQL_USER=
    MYSQL_PASSWORD=
    
    #iTrust
    OAUTH_ISSUER=https://stsstg.nih.gov
    OAUTH_CLIENT=
    OAUTH_SECRET=
    
    AUTH_ENDPOINT=/auth/oauth/v2/authorize
    TOKEN_ENDPOINT=/auth/oauth/v2/token
    USERINFO_ENDPOINT=/openid/connect/v1.1/userinfo
   ```
5. build image
   ```
   ./build.sh
   ```
7. startup/shutdown server
   ```
   ./up.sh or ./down.sh
   
   ```
