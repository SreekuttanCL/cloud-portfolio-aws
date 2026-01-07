# AWS Cloud Portfolio Website

This project is a personal cloud engineering portfolio built and hosted on AWS.
It demonstrates progressive AWS skills from basic static hosting to advanced
cloud-native and DevOps practices.

## Project Goals
- Build a production-style cloud portfolio
- Learn and demonstrate AWS core services
- Apply Infrastructure as Code and CI/CD
- Create a strong cloud engineering portfolio project

## Tech Stack (Planned)
- AWS S3, CloudFront, Route 53, ACM
- AWS Lambda, API Gateway, DynamoDB
- Terraform
- GitHub Actions

## Roadmap
- Phase 0: Git & Project Setup
- Phase 1: Static Website Hosting on S3
- Phase 2: Custom Domain & HTTPS
- Phase 3: CI/CD Automation
- Phase 4: Serverless Backend
- Phase 5: Infrastructure as Code
- Phase 6: Monitoring & Security

## Deployment (Phase 1)
The portfolio website is hosted as a static site using Amazon S3.
- Enabled static website hosting
- Configured public read access via bucket policy
- Deployed HTML and CSS assets

## Phase 2: CDN, HTTPS & Security
- Added CloudFront distribution for global content delivery
- Enabled HTTPS with CloudFront
- Secured S3 using Origin Access Control (OAC)
- Blocked all public access to S3 bucket

## Phase 3: Custom Domain with Route 53 & ACM

- **Registered custom domain**: `sreekuttancl.com`
- **Created a public hosted zone** in Route 53 to manage DNS
- **Requested ACM certificate** in `us-east-1` for both `sreekuttancl.com` and `www.sreekuttancl.com`
  - Validation method: DNS
- **Added DNS CNAME records** from ACM into Route 53 hosted zone to validate domain
- **Configured CloudFront** to use the ACM certificate
- **Pointed domain to CloudFront** using Route 53 alias records
- **HTTPS enabled** for both root and www subdomain
- Website is fully **secure, production-ready, and globally distributed**

