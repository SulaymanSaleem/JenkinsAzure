# JenkinsAzure
Creating VMs in Azure for a Jenkins server which deploys a Python server via a build slave

In Azure, pull the repo and run the VMsetup.sh file with the command ./VMsetup.sh
This will take a while to set up

Sign in to the JenkinsHostVM by using the command ssh {public ip for the JenkinsHostVM}
Once this is complete,we will install Jenkins on the JenkinsHostVM

to do this use the command: git clone https://github.com/SulaymanSaleem/Jenkins
then run the command cd into Jenkins
Then run the command: ./install.sh
this should install Jenkins on the host VM

We will now install java on the Jenkins slave

exit out of JenkinsVMHost by typing exit.
You will now be on your orgininal CLI for azure
Sign-in to JenkinsSlaveVM by using the command: ssh {public ip for the JenkinsSlaveVM}
run the command: sudo apt install -y wget vim openjdk-8-jdk openjdk-8-jre
this will install Java

exit now and on your browser we will setup the node on Jenkins via the browser.
To do this get the public ip for the JenkinsHostVM and in brower in the URL bar, enter:
{public ip for the JenkinsHostVM}:8080
