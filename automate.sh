cd /opt

# save the artifact details in a json file
curl -u newuser:nexus123 -X GET 'http://206.189.1.136:8081/service/rest/v1/components?repository=npmrepo&sort=version' | jq "." > artifact.json

# grab the download url from the saved artifact details using 'jq' json processor tool
artifactDownloadUrl=$(jq '.items[].assets[].downloadUrl' artifact.json --raw-output)

# fetch the artifact with the extracted download url using 'wget' tool
wget --http-user=newuser  --http-password=nexus123 $artifactDownloadUrl



apt update

apt install npm

apt install openjdk-8-jre-headless


tar -zxvf bootcamp-node-project-1.0.0.tgz


cd package 

npm install

node server.js
