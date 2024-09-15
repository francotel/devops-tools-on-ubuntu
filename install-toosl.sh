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
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo systemctl start docker
    sudo systemctl enable docker
    echo "Docker installed successfully."
}

# Function to install Kubernetes (kubectl)
install_kubernetes() {
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
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
    curl -LO https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
    unzip terraform_1.5.0_linux_amd64.zip
    sudo mv terraform /usr/local/bin/
    rm terraform_1.5.0_linux_amd64.zip
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
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-446.0.0-linux-x86_64.tar.gz
    tar -xvzf google-cloud-sdk-446.0.0-linux-x86_64.tar.gz
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
    curl -LO https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz
    tar xvf prometheus-2.26.0.linux-amd64.tar.gz
    sudo mv prometheus-2.26.0.linux-amd64 /usr/local/bin/prometheus
    rm prometheus-2.26.0.linux-amd64.tar.gz
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
    curl -LO https://releases.hashicorp.com/vault/1.10.0/vault_1.10.0_linux_amd64.zip
    unzip vault_1.10.0_linux_amd64.zip
    sudo mv vault /usr/local/bin/
    rm vault_1.10.0_linux_amd64.zip
    echo "HashiCorp Vault installed successfully."
}

# Function to install HashiCorp Consul
install_consul() {
    curl -LO https://releases.hashicorp.com/consul/1.14.0/consul_1.14.0_linux_amd64.zip
    unzip consul_1.14.0_linux_amd64.zip
    sudo mv consul /usr/local/bin/
    rm consul_1.14.0_linux_amd64.zip
    echo "HashiCorp Consul installed successfully."
}

# Main script execution
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

echo "All tools installed successfully!"
