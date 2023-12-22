#########################
# Install python 3.11
#########################
sudo apt-get install -y software-properties-common # install this so we get access to add-apt-repository
sudo add-apt-repository -y ppa:deadsnakes/ppa      # this allows packages not yet fully integrated into ubuntu
sudo apt-get update && apt-get upgrade -y          # update apt-get so it includes these packages
sudo apt-get install -y python3.11


#########################
# Install poetry
#########################
curl -sSL https://install.python-poetry.org | python3.10 - # curl poetry and run through python3.10 
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc   # Add poetry to PATH in your .bashrc or equivalent
source ~/.bashrc                                           # reload .bashrc so poetry is present



#########################
# Install Docker
#########################
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common # Install required packages for Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - # Add Docker GPG key
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" # Add Docker repository
sudo apt-get update                                   # Update package lists again
sudo apt-get install -y docker-ce                     # Install Docker
sudo usermod -aG docker $(whoami)                     # Add current user to Docker group
sudo systemctl start docker                           # start docker
sudo systemctl enable docker                          # start docker every time the instance boots



#########################
# Install kubernetes
#########################
# Download kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl # Make it executable
sudo mv kubectl /usr/local/bin/ # Move it to your local bin
 


#########################
# Install Minikube
#########################
# Download Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube # Make it executable
sudo mv minikube /usr/local/bin/ # Move it to your local bin



#########################
# Install jq
#########################
sudo apt install jq



echo "NOW RESTART THIS INSTANCE SO CHANGES CAN BE ENACTED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
