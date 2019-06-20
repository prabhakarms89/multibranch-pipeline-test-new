sudo yum update
mkdir azagent;cd azagent;curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.152.1/vsts-agent-linux-x64-2.152.1.tar.gz;tar -zxvf vstsagent.tar.gz; if [ -x "$(command -v systemctl)" ]; then ./config.sh --deploymentgroup --deploymentgroupname "Dev Server Group" --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/punjabidrashti/ --work _work --projectname 'Demo' --runasservice; sudo ./svc.sh install; sudo ./svc.sh start; else ./config.sh --deploymentgroup --deploymentgroupname "Dev Server Group" --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/punjabidrashti/ --work _work --projectname 'Demo'; ./run.sh; fi
sudo yum install java
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
            sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
            
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
           
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
           
sudo yum install jenkins -y
sudo service jenkins status
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins -y
sudo service jenkins start
sudo service jenkins status
sudo service jenkins restart
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
ce64753d2a3d42bb9da73de5607da96fce64753d2a3d42bb9da73de5607da96f
sudo yum install git
sudo service git status
service git start
sudo service git start
mkdir azagent;cd azagent;curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.152.1/vsts-agent-linux-x64-2.152.1.tar.gz;tar -zxvf vstsagent.tar.gz; if [ -x "$(command -v systemctl)" ]; then ./config.sh --deploymentgroup --deploymentgroupname "Dev Server Group" --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/punjabidrashti/ --work _work --projectname 'Demo' --runasservice; sudo ./svc.sh install; sudo ./svc.sh start; else ./config.sh --deploymentgroup --deploymentgroupname "Dev Server Group" --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/punjabidrashti/ --work _work --projectname 'Demo'; ./run.sh; fi
clear
exit
sudo service jenkins start
sudo service jenkins status
sudo service jenkins start
sudo service jenkinss tart
sudo service jenkins start
sudo service jenkinss tatus
sudo service jenkins status
sudo service jenkins start
sudo cd /var/lib/jenkins/workspace/multibranch-pipeline-test1@script
ls -a
sudo cd /var/lib/jenkins/workspace/multibranch-pipeline-test1@script/Jenkinsfile
sudo cd /var/lib/jenkins/workspace/multibranch-pipeline-test1
ls -a
ls -la
sudo service jenkins start
