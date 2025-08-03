# Website  - https://neerajs.info

# Static Website on AWS with Terraform & GitHub Actions

This repository sets up and manages a static website hosted on **AWS S3** using **Terraform** for infrastructure provisioning and **GitHub Actions** for automation.


## 🚀 Features

- Static website hosted on AWS S3
- Terraform remote backend with S3 state file and DynamoDB lock
- Public access configuration for website hosting
- CI/CD pipeline using GitHub Actions:
  - `terraform.yml` provisions infrastructure
  - `deploy.yml` syncs website content to S3
- Optional: Delivered via **CloudFront** for low latency and global distribution
            Domain and DNS managed via **Route 53

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

After deployment, access the site at:

https://s3.ap-southeast-2.amazonaws.com/neerajs.info/index.html

## 🔐 Secrets Required (in GitHub repo settings)

Set the following GitHub Secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

---

## 🧪 Manual Usage (Local)

bash
cd terraform
terraform init
terraform plan
terraform apply


## 📌 Additional Steps: Set Up the Secure Static Website
1. Create Domain in Route 53

    Register or import the domain
    Ensure a hosted zone is created automatically or manually

2. Request ACM Certificate (here in ap-southeast-2)

    Use DNS validation
    Add validation records via Route 53
    Wait until the certificate is issued

3. Create S3 Bucket (name should match domain name)
    Store static site files (e.g., HTML, CSS, JS)
    Keep bucket private — content will be served via CloudFront

4. Create CloudFront Distribution

    Set the S3 bucket as the origin
    Attach the ACM certificate for HTTPS
    Add the custom domain (neerajs.info) as an alias

5. Map the Domain (Route 53 Record)

    Create an A (alias) record pointing to the CloudFront distribution
    Set a low TTL for quicker DNS propagation

