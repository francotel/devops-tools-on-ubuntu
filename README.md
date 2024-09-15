# 🚀 DevOps Tools on Ubuntu

Welcome to **DevOps Tools on Ubuntu**, a script that automates the installation of essential DevOps tools on an Ubuntu system. This project is designed to simplify the setup process for those who need to quickly install and configure DevOps tools on their machines.

## 📖 Table of Contents

- [Introduction](#introduction)
- [Tools Installed](#tools-installed)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## 🛠️ Introduction

This repository contains a Bash script (`install_tools.sh`) that installs popular DevOps tools on an Ubuntu machine. Whether you're setting up a fresh development environment or configuring a CI/CD pipeline, this script helps you get up and running quickly.

## 🧰 Tools Installed

The script installs the following DevOps tools:

- 🐳 **Docker**: Containerization platform
- ☸️ **Kubernetes (kubectl)**: Command-line tool for controlling Kubernetes clusters
- 📦 **Ansible**: Configuration management tool
- 🌍 **Terraform**: Infrastructure as code software
- ⚙️ **Jenkins**: Automation server for CI/CD
- 🔧 **Git**: Version control system
- 🟢 **Node.js**: JavaScript runtime (optional for some DevOps workflows)

You can customize the script to include or exclude specific tools as per your needs.

## 🧑‍💻 Prerequisites

- A machine running **Ubuntu 20.04** or later
- Sudo privileges to install software packages

## ⚙️ Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/devops-tools-on-ubuntu.git
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

## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request with improvements, new features, or bug fixes.
