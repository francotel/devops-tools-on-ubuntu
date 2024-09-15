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
echo "  - Docker 🐳"
echo "  - Kubernetes (kubectl) ☸️"
echo "  - Ansible 📜"
echo "  - Terraform 🌍"
echo "  - Jenkins 🏗️"
echo "  - AWS CLI ☁️"
echo "  - Azure CLI ☁️"
echo "  - Google Cloud SDK ☁️"
echo "  - Helm ⛵"
echo "  - Prometheus 📈"
echo "  - Grafana 📊"
echo "  - GitLab Runner 🏃‍♂️"
echo "  - HashiCorp Vault 🔐"
echo "  - HashiCorp Consul 🌐"
echo ""

# Function to install Docker
install_docker() {
    # sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Start and enable Docker
    sudo systemctl start docker
    sudo systemctl enable docker

    echo "Docker installed successfully."
}

# Function to install Kubernetes (kubectl)
install_kubernetes() {
    curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    echo "Kubernetes (kubectl) installed successfully."
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
    rm terraform_1.9.0_linux_amd64.zip
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
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm awscliv2.zip
    echo "AWS CLI installed successfully."
}

# Function to install Azure CLI
install_azurecli() {
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    echo "Azure CLI installed successfully."
}

# Function to install Google Cloud SDK
install_gcloud() {
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-419.0.0-linux-x86_64.tar.gz
    tar -xvzf google-cloud-sdk-419.0.0-linux-x86_64.tar.gz
    ./google-cloud-sdk/install.sh
    echo "Google Cloud SDK installed successfully."
}

# Function to install Helm
install_helm() {
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
    echo "Helm installed successfully."
}

# Function to install Prometheus
install_prometheus() {
    curl -LO https://github.com/prometheus/prometheus/releases/download/v2.47.0/prometheus-2.47.0.linux-amd64.tar.gz
    tar xvf prometheus-2.47.0.linux-amd64.tar.gz
    sudo mv prometheus-2.47.0.linux-amd64 /usr/local/bin/prometheus
    rm prometheus-2.47.0.linux-amd64.tar.gz
    echo "Prometheus installed successfully."
}

# Function to install Grafana
install_grafana() {
    sudo apt install -y software-properties-common
    sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
    sudo apt update
    sudo apt install -y grafana
    sudo systemctl start grafana-server
    sudo systemctl enable grafana-server
    echo "Grafana installed successfully."
}

# Function to install GitLab Runner
install_gitlab_runner() {
    curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
    chmod +x /usr/local/bin/gitlab-runner
    echo "GitLab Runner installed successfully."
}

# Function to install HashiCorp Vault
install_vault() {
    curl -LO https://releases.hashicorp.com/vault/1.13.0/vault_1.13.0_linux_amd64.zip
    unzip vault_1.13.0_linux_amd64.zip
    sudo mv vault /usr/local/bin/
    rm vault_1.13.0_linux_amd64.zip
    echo "HashiCorp Vault installed successfully."
}

# Function to install HashiCorp Consul
install_consul() {
    curl -LO https://releases.hashicorp.com/consul/1.14.2/consul_1.14.2_linux_amd64.zip
    unzip consul_1.14.2_linux_amd64.zip
    sudo mv consul /usr/local/bin/
    rm consul_1.14.2_linux_amd64.zip
    echo "HashiCorp Consul installed successfully."
}

# Function to install all tools
install_all() {
    install_docker
    install_kubernetes
    install_ansible
    install_terraform
    install_jenkins
    install_awscli
    install_azurecli
    install_gcloud
    install_helm
    install_prometheus
    install_grafana
    install_gitlab_runner
    install_vault
    install_consul
    echo "All tools installed successfully."
}

# Main menu
echo "Please select an option:"
echo "1. Install Docker"
echo "2. Install Kubernetes (kubectl)"
echo "3. Install Ansible"
echo "4. Install Terraform"
echo "5. Install Jenkins"
echo "6. Install AWS CLI"
echo "7. Install Azure CLI"
echo "8. Install Google Cloud SDK"
echo "9. Install Helm"
echo "10. Install Prometheus"
echo "11. Install Grafana"
echo "12. Install GitLab Runner"
echo "13. Install HashiCorp Vault"
echo "14. Install HashiCorp Consul"
echo "15. Install ALL tools"
read -p "Enter the number corresponding to your choice: " tool_choice

case $tool_choice in
    1) install_docker ;;
    2) install_kubernetes ;;
    3) install_ansible ;;
    4) install_terraform ;;
    5) install_jenkins ;;
    6) install_awscli ;;
    7) install_azurecli ;;
    8) install_gcloud ;;
    9) install_helm ;;
    10) install_prometheus ;;
    11) install_grafana ;;
    12) install_gitlab_runner ;;
    13) install_vault ;;
    14) install_consul ;;
    15) install_all ;;
    *) echo "Invalid choice, exiting." ;;
esac
