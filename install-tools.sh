#!/bin/bash

# Welcome Message
echo "############################################################################"
echo "#                                                                          #"
echo "#        DevOps Tool Installer by francotel                                #"
echo "#                                                                          #"
echo "#        Automate the installation of essential DevOps tools on Ubuntu     #"
echo "#                                                                          #"
echo "############################################################################"
echo ""
echo "Automate the installation of essential DevOps tools on your Ubuntu machine."
echo "Choose from a wide range of tools and get started quickly and easily."
echo ""
echo "Tools available for installation:"
echo " 1 - Docker + LazyDocker 🐳"
echo " 2 - Kubernetes (kubectl) ☸️"
echo " 3 - Ansible 📜"
echo " 4 - Terraform 🌍"
echo " 5 - Jenkins 🏗️"
echo " 6 - AWS CLI ☁️"
echo " 7 - Azure CLI ☁️"
echo " 8 - Google Cloud SDK ☁️"
echo " 9 - Helm ⛵"
echo " 10 - GitLab Runner 🏃‍♂️"
echo " 11 - HashiCorp Vault 🔐"
echo " 12 - HashiCorp Consul 🌐"
echo " 13 - HashiCorp Packer 💿"
echo " 14 - Infracost 💰"
echo " 15 - k9s 👀"
echo " 16 - minikube 🏗️"
echo " 17 - k3s 🐍"
echo " 18 - VS Codium 🗒️"
echo " 19 - Postman 📮"
echo " 20 - VirtualBox 💿"
echo " 21 - Install ALL tools"
echo ""
read -p "Enter the number corresponding to your choice: " tool_choice

# Function to VSCodium
install_vscodium() {
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
    echo 'deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
    sudo apt update && sudo apt install -y codium
    echo "VSCodium installed successfully."
}

# Function to install Docker
install_docker() {
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

    # Start and enable Docker
    sudo systemctl start docker
    sudo systemctl enable docker

    # Agrega el usuario actual al grupo docker
    sudo usermod -aG docker $USER

    # Directorio destino (puedes cambiarlo si es necesario)
    DIR="${DIR:-"$HOME/.local/bin"}"

    # Determina la arquitectura del sistema
    ARCH=$(uname -m)

    # Obtén la última versión disponible de LazyDocker
    GITHUB_LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/jesseduffield/lazydocker/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
    GITHUB_FILE="lazydocker_${GITHUB_LATEST_VERSION//v/}_$(uname -s)_${ARCH}.tar.gz"
    GITHUB_URL="https://github.com/jesseduffield/lazydocker/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

    # install/update the local binary
    sudo curl -L -o lazydocker.tar.gz $GITHUB_URL
    sudo tar xzvf lazydocker.tar.gz lazydocker
    sudo install -Dm 755 lazydocker -t "$DIR"
    sudo rm lazydocker lazydocker.tar.gz

    echo "Docker ha sido instalado y LazyDocker ha sido configurado correctamente."
}

# Function to install k9s
install_k9s() {
    sudo curl -sS https://webinstall.dev/k9s | bash
    echo "k9s installed successfully."
}

# Function to install minikube
install_minikube() {
    sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    sudo rm -f minikube-linux-amd64
    echo "minikube installed successfully."
}

# Function to install k3s
install_k3s() {
    sudo curl -sfL https://get.k3s.io | sh -
    echo "k3s installed successfully."
}

# Function to install kubectl
install_kubectl() {
    sudo curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    echo "kubectl installed successfully."
}

# Function to install Ansible
install_ansible() {
    sudo apt update
    sudo apt install -y ansible
    echo "Ansible installed successfully."
}

# Function to install Terraform
install_terraform() {
    sudo apt install zip -y
    sudo curl -LO https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_linux_amd64.zip
    sudo unzip terraform_1.9.0_linux_amd64.zip
    sudo mv terraform /usr/local/bin/
    sudo rm -f terraform_1.9.0_linux_amd64.zip
    echo "Terraform installed successfully."
}

# Function to install Jenkins
install_jenkins() {
    curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt update
    sudo apt install -y jenkins
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
    echo "Jenkins installed successfully."
}

# Function to install AWS CLI
install_awscli() {
    sudo apt install zip -y
    sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    sudo unzip awscliv2.zip
    sudo ./aws/install
    sudo rm -rf awscliv2.zip aws
    echo "AWS CLI installed successfully."
}

# Function to install Azure CLI
install_azurecli() {
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    echo "Azure CLI installed successfully."
}

# Function to install Google Cloud SDK
install_gcloud() {
    sudo apt install apt-transport-https ca-certificates gnupg curl -y
    sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    sudo apt update && sudo apt install google-cloud-cli -y
}

# Function to install Helm
install_helm() {
    sudo curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    sudo chmod 700 get_helm.sh
    sudo ./get_helm.sh
    sudo rm -f get_helm.sh
    echo "Helm installed successfully."
}

# Function to install GitLab Runner
install_gitlab_runner() {
    sudo curl -s https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
    echo "GitLab Runner installed successfully."
}

# Function to install HashiCorp Vault
install_vault() {
    sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
    sudo apt update && sudo apt install vault -y
    echo "HashiCorp Vault installed successfully."
}

# Function to install HashiCorp Consul
install_consul() {
    sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null 
    sudo apt update && sudo apt install consul -y
    echo "HashiCorp Packer installed successfully."
}

# Function to install HashiCorp Packer
install_packer() {
    sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
    sudo apt update && sudo apt install packer -y
    echo "HashiCorp Packer installed successfully."
}

# Function to install Infracost
install_infracost() {
    echo "Installing Infracost..."
    curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh
    echo "Infracost installed successfully."
}

# Function to install Postman
install_postman() {
    sudo snap install postman
}

install_virtualbox() {
    # Add VirtualBox repository key
    #wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -
    wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg


    # Add VirtualBox repository to sources list
    sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian raring non-free contrib" >> /etc/apt/sources.list.d/virtualbox.org.list'

    # Update package list and install specified VirtualBox version
    sudo apt-get update
    sudo apt-get install -y virtualbox

    # Add current user to vboxusers group
    sudo usermod -a -G vboxusers $(whoami)

    # Get the installed VirtualBox version
    INSTALLED_VER=$(vboxmanage --version)
    INSTALLED_VER=${INSTALLED_VER%%r*}

    # Download and install the extension pack for the installed version
    wget -O ~/Downloads/Oracle_VM_VirtualBox_Extension_Pack-$INSTALLED_VER.vbox-extpack http://download.virtualbox.org/virtualbox/$INSTALLED_VER/Oracle_VM_VirtualBox_Extension_Pack-$INSTALLED_VER.vbox-extpack
    echo "virtualbox extpack"
    sudo vboxmanage extpack install ~/Downloads/Oracle_VM_VirtualBox_Extension_Pack-$INSTALLED_VER.vbox-extpack

    echo "You must log out and log back in for user group changes to take effect."
}

# Function to install all tools
install_all() {
    install_vscodium
    install_virtualbox
    install_docker
    install_kubectl
    install_ansible
    install_terraform
    install_jenkins
    install_awscli
    install_azurecli
    install_gcloud
    install_helm
    install_gitlab_runner
    install_vault
    install_consul
    install_infracost
    install_k9s
    install_minikube
    install_k3s
    install_postman
    echo "All tools installed successfully."
}

case $tool_choice in
    1) install_docker ;;
    2) install_kubectl ;;
    3) install_ansible ;;
    4) install_terraform ;;
    5) install_jenkins ;;
    6) install_awscli ;;
    7) install_azurecli ;;
    8) install_gcloud ;;
    9) install_helm ;;
    10) install_gitlab_runner ;;
    11) install_vault ;;
    12) install_consul ;;
    13) install_packer ;;
    14) install_infracost ;;
    15) install_k9s ;;
    16) install_minikube ;;
    17) install_k3s ;;
    18) install_vscodium ;;
    19) install_postman ;;
    20) install_virtualbox ;;
    21) install_all ;;
    *) echo "Invalid choice, exiting." ;;
esac