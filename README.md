# 🌐 Cloud Portfolio Website

[![GitHub Actions](https://github.com/SreekuttanCL/cloud-portfolio-aws/workflows/Deploy/badge.svg)](https://github.com/SreekuttanCL/cloud-portfolio-aws/actions)  
[![Terraform](https://img.shields.io/badge/Terraform-v1.14.3-blue?logo=terraform&logoColor=white)](https://www.terraform.io/)  

---

## Overview

This repository contains my **personal portfolio website** hosted on **AWS**, showcasing practical skills in:

- **AWS S3** – static website hosting  
- **AWS CloudFront** – CDN for global content delivery  
- **AWS ACM** – SSL/TLS certificate  
- **AWS Route 53** – DNS management  
- **Terraform** – infrastructure as code  
- **GitHub Actions** – CI/CD automation  

The project demonstrates **end-to-end cloud deployment** and is ideal for **junior to mid-level cloud engineer portfolios**.

---

## Live Website

🌐 [https://www.sreekuttancl.com](https://www.sreekuttancl.com)

---

## Architecture Diagram

![Architecture Diagram](https://raw.githubusercontent.com/SreekuttanCL/cloud-portfolio-aws/main/assets/architecture-diagram.png)


---

## Features

- Fully **static website hosting** on S3  
- **HTTPS-enabled** via ACM  
- **Global content delivery** with CloudFront  
- **Custom domain** management with Route 53  
- **CI/CD pipeline** automatically deploys changes from GitHub  
- Infrastructure fully managed with **Terraform**

---

## Getting Started

1. **Clone the repo**

git clone https://github.com/SreekuttanCL/cloud-portfolio-aws.git
cd cloud-portfolio-aws

2. Initialize Terraform

cd terraform
terraform init
terraform plan
terraform apply

3. Deploy Website

- Changes to website/ are automatically deployed via GitHub Actions


**Author:** Sreekuttan Chandran Latha
**GitHub:** [https://github.com/SreekuttanCL](https://github.com/SreekuttanCL)
**LinkedIn:** [https://www.linkedin.com/in/sreekuttancl/](https://www.linkedin.com/in/sreekuttancl)








