
#!/bin/bash
sudo docker container prune -f && sudo docker image prune -a -f && sudo docker volume prune -f && sudo docker network prune -f && sudo docker system prune -a -f
##this above step is not recommned step, i am deleting existing images to save space
sudo rm -r gold ## these steps are not recommened instead you can modify script as shown below
sudo mkdir gold
cd gold/
sudo git clone https://github.com/Hari0o/Gold_Site_Ecommerce.git
cd Gold_Site_Ecommerce/
git_commit=$(sudo git rev-parse HEAD)
sudo docker build -t react-nginx:$git_commit -f golddockerfile .
sudo docker tag react-nginx:$git_commit sagarkakkala385/react-nginx:$git_commit ##make sure you did docker login
sudo docker push sagarkakkala385/react-nginx:$git_commit
aws s3 rm s3://gitcommitids/new_value.txt
sudo touch new_value.txt
sudo chmod 777 new_value.txt
echo $git_commit > new_value.txt
aws s3 cp new_value.txt s3://gitcommitids/
rm new_value.txt


##recommended script###
##!/bin/bash
#cd gold/Gold_Site_Ecommerce
#sudo git pull
#sudo docker build -t react-nginx -f goldockerfile .
#sudo docker tag react-nginx:latest sagarkakkala385/react-nginx:latest ##make sure you did docker login
#sudo docker push sagarkakkala385/react-nginx:latest
