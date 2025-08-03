# Website  - https://neerajs.info

# Static Website on AWS with Terraform & GitHub Actions

This repository sets up and manages a static website hosted on **AWS S3** using **Terraform** for infrastructure provisioning and **GitHub Actions** for automation.

---

## 📁 Directory Structure

.
├── .github/
│ └── workflows/
│ ├── deploy.yml # Workflow to sync website content (public_html) to S3
│ └── terraform.yml # Workflow to provision infrastructure using Terraform
│
├── public_html/
│ └── index.html # Website content (can add more HTML/CSS/JS files)
│
├── terraform/
│ ├── backend.tf # Terraform backend config (S3 + DynamoDB)
│ ├── main.tf # Main infrastructure resources
│ ├── outputs.tf # Output values
│ └── variables.tf # Variable definitions
│
└── README.md

## 🚀 Features

- Static website hosted on AWS S3
- Terraform remote backend with S3 state file and DynamoDB lock
- Public access configuration for website hosting
- CI/CD pipeline using GitHub Actions:
  - `terraform.yml` provisions infrastructure
  - `deploy.yml` syncs website content to S3

---

## 🔧 GitHub Actions Workflows

### `terraform.yml`
- Manually triggered
- Runs Terraform commands inside `terraform/` directory
- Provisions/updates:
  - S3 bucket
  - Bucket policy & website configuration
  - Remote backend (S3 + DynamoDB)

### `deploy.yml`
- Manually triggered
- Syncs `public_html/` folder to the configured S3 bucket
- **Does not** use the `--delete` flag to preserve S3 contents

---

## 🌍 Website URL

After deployment, access your site at:

https://s3.ap-southeast-2.amazonaws.com/neerajs.info/index.html

## 🔐 Secrets Required (in GitHub repo settings)

Set the following GitHub Secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

---

## 🧪 Manual Usage (Local)

```bash
cd terraform
terraform init
terraform plan
terraform apply
