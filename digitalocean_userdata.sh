Skip to content
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@durailive 
Learn Git and GitHub without any code!
Using the Hello World guide, you’ll start a branch, write comments, and open a pull request.


wardviaene
/
jenkins-course
32
2241.2k
Code
Issues
1
Pull requests
1
Actions
Projects
Wiki
Security
Insights
jenkins-course/jenkins-slave/digitalocean_userdata.sh
@wardviaene
wardviaene docker URL update
Latest commit a9969c5 on Jun 2
 History
 1 contributor
31 lines (26 sloc)  896 Bytes
  
#!/bin/bash

# install dependencies
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# get gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# add docker repo
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# update repository
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker

# jenkins setup
mkdir -p /var/jenkins_home/.ssh
cp /root/.ssh/authorized_keys /var/jenkins_home/.ssh/authorized_keys
chmod 700 /var/jenkins_home/.ssh
chmod 600 /var/jenkins_home/.ssh/authorized_keys
chown -R 1000:1000 /var/jenkins_home
docker run -p 2222:22 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --restart always -d wardviaene/jenkins-slave
© 2020 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
Found 2 out of 2 items
