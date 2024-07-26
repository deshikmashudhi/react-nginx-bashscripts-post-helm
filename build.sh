
#!/bin/bash
sudo docker rmi -f $(sudo docker images -q) ##this is not recommned step, i am deleting existing images to save space
sudo rm -r gold ## these steps are not recommened instead you can modify script as shown below
sudo mkdir gold
cd gold/
sudo git clone https://github.com/Hari0o/Gold_Site_Ecommerce.git
cd Gold_Site_Ecommerce/
git_commit=$(git rev-parse HEAD)
sudo docker build -t react-nginx:$git_commit -f golddockerfile .
sudo docker tag react-nginx:$git_commit sagarkakkala385/react-nginx:$git_commit ##make sure you did docker login
sudo docker push sagarkakkala385/react-nginx:$git_commit


##recommended script###
##!/bin/bash
#cd gold/Gold_Site_Ecommerce
#sudo git pull
#sudo docker build -t react-nginx -f goldockerfile .
#sudo docker tag react-nginx:latest sagarkakkala385/react-nginx:latest ##make sure you did docker login
#sudo docker push sagarkakkala385/react-nginx:latest
