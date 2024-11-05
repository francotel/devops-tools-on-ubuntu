# 🚀 DevOps Tools on Ubuntu

Welcome to **DevOps Tools on Ubuntu**, a script that automates the installation of essential DevOps tools on an Ubuntu system. This project is designed to simplify the setup process for those who need to quickly install and configure DevOps tools on their machines.

## 📖 Table of Contents

- [Introduction](#introduction)
- [Tools Installed](#tools-installed)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Vagrant Setup](#vagrant-setup)
- [Contributing](#contributing)
- [License](#license)

## 🛠️ Introduction

This repository contains a Bash script (`install_tools.sh`) that installs popular DevOps tools on an Ubuntu machine. Whether you're setting up a fresh development environment or configuring a CI/CD pipeline, this script helps you get up and running quickly.

## 🧰 Tools Installed

The script installs the following DevOps tools:

- 🐳 **Docker + LazyDocker** - Platform for containerization  
- ☸️ **Kubernetes (kubectl)** - Command-line tool to control Kubernetes clusters  
- 📜 **Ansible** - Configuration management tool  
- 🌍 **Terraform** - Infrastructure as code software  
- ⚙️ **Jenkins** - Automation server for CI/CD  
- ☁️ **AWS CLI** - Command-line interface for AWS  
- ☁️ **Azure CLI** - Command-line interface for Azure  
- ☁️ **Google Cloud SDK** - Google Cloud Platform SDK  
- ⛵ **Helm** - Package manager for Kubernetes  
- 🏃‍♂️ **GitLab Runner** - CI/CD executor for GitLab  
- 🔐 **HashiCorp Vault** - Secrets manager  
- 🌐 **HashiCorp Consul** - Service mesh and service discovery  
- 💿 **HashiCorp Packer** - Automated image creation tool  
- 💰 **Infracost** - Infrastructure cost estimation  
- 👀 **k9s** - TUI interface for Kubernetes  
- 🏗️ **minikube** - Local Kubernetes cluster  
- 🐍 **k3s** - Lightweight Kubernetes distribution  
- 🗒️ **VS Codium** - Code editor  
- 📮 **Postman** - API platform  
- 🛠️ **Vagrant** - Virtual machine manager  

You can customize the script to include or exclude specific tools as per your needs.

## 🧑‍💻 Prerequisites

- A machine running **Ubuntu 20.04** or later
- Sudo privileges to install software packages

## ⚙️ Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/francotel/devops-tools-on-ubuntu.git
   ```

2. Navigate to the project directory:

   ```bash
   cd devops-tools-on-ubuntu
   ```

3. Make the script executable:

   ```bash
   chmod +x install-tools.sh
   ```

4. Run the script to install the tools:

   ```bash
   sudo ./install-tools.sh
   ```

The script will take care of installing the necessary packages and dependencies.

## 🏃 Usage

Once the script has finished running, the DevOps tools will be installed and ready for use. You can start using them as per your project's requirements.

For example:

   ```bash
To check Docker's installation: docker --version
To verify Ansible: ansible --version
To confirm Terraform: terraform --version
   ```

Feel free to modify the script if you want to add more tools or tweak the installation process for your specific setup.

## 🏗️ Vagrant Setup

If you want to use Vagrant to set up an Ubuntu virtual machine and clone this repository, follow these steps:

1. **Clone this repository to your local machine:**

   ```bash
   git clone https://github.com/your-username/devops-tools-on-ubuntu.git
   ```
2. Navigate to the project directory:

   ```bash
   cd devops-tools-on-ubuntu
   ```

3. Run Vagrant to set up the virtual machine:

   ```bash
   vagrant up
   ```
This command will set up the Ubuntu VM, install Git, and clone the repository.

4. SSH into the VM:

   ```bash
   vagrant ssh
   ```

5. Once inside the VM, navigate to the directory where the repository was cloned:

   ```bash
   cd /home/vagrant/devops-tools-on-ubuntu
   ```

Run the installation script manually:

   ```bash
   chmod +x install-tools.sh
   sudo ./install-tools.sh
   ```
6. Destroy Vagrant

    ```bash
    vagrant destroy
    ```
    
## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request with improvements, new features, or bug fixes.

##  🤝 **Let's Connect!**

If you find this repository useful and want to see more content like this, follow me on LinkedIn to stay updated on more projects and resources!

[![LinkedIn](https://seeklogo.com/images/L/linkedin-logo-E871D8437B-seeklogo.com.png)](https://www.linkedin.com/in/franconavarro/)

If you’d like to support my work, you can buy me a coffee. Thank you for your support!

[![BuyMeACoffee](https://cdn.icon-icons.com/icons2/2699/PNG/512/buymeacoffee_official_logo_icon_169440.png)](https://www.buymeacoffee.com/francotel)