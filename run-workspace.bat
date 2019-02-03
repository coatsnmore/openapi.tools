SET USER_WORKSPACE=//c//devl//openapi.tools
SET IMAGE_NAME=coatsn/jekyll-workspace

docker build -t %IMAGE_NAME% .

REM docker run -it %IMAGE_NAME% /bin/bash
docker run -d -v %USER_WORKSPACE%:/site -p 4000:4000 -it %IMAGE_NAME%