# Cloud Portfolio on AWS

## Overview

This project demonstrates a **production-grade, low-cost, serverless static website architecture on AWS**, built incrementally from beginner to mid-level cloud engineering concepts.

The portfolio is deployed at a **custom domain with HTTPS**, uses **private S3 access**, and is delivered globally via **CloudFront CDN**.

---

## Architecture Diagram

```
┌───────────────┐
│    End User   │
│  (Web Browser)│
└───────┬───────┘
        │ HTTPS (443)
        ▼
┌──────────────────────────┐
│      Amazon CloudFront   │
│  • Global CDN            │
│  • HTTPS via ACM         │
│  • Default Root: index   │
└──────────┬───────────────┘
           │ OAC (Signed Requests)
           ▼
┌──────────────────────────┐
│      Amazon S3 Bucket    │
│  • Static Website Files  │
│  • Private (No Public)   │
│  • index.html, css, etc  │
└──────────────────────────┘

Route 53 (DNS)
└── sreekuttancl.com → CloudFront Distribution

ACM (us-east-1)
└── Public SSL Certificate (DNS Validated)
```

---

## Phases Breakdown

### Phase 0: Git & Project Setup

* Created local Git repository
* Pushed source code to GitHub
* Structured project for future AWS expansion

---

### Phase 1: Website Design & Content

* Built responsive HTML/CSS portfolio
* Sections: About, Skills, Projects, Contact
* Optimized for clarity and recruiter readability

---

### Phase 2: Static Hosting with Amazon S3

* Created S3 bucket for static website files
* Uploaded `index.html`, CSS, and assets
* Disabled public access after CloudFront integration

---

### Phase 3: CloudFront CDN + Security

* Created CloudFront distribution
* Configured **Origin Access Control (OAC)**
* Restricted S3 access to CloudFront only
* Set default root object (`index.html`)
* Enabled HTTPS via ACM

---

### Phase 4: Custom Domain with Route 53 & ACM

* Registered and configured custom domain: `sreekuttancl.com`
* Created **public hosted zone** in Route 53
* Requested **ACM public certificate (us-east-1)** for:

  * `sreekuttancl.com`
  * `www.sreekuttancl.com`
* Validated certificate using DNS (CNAME records)
* Attached ACM certificate to CloudFront
* Created Route 53 **Alias A records** pointing domain to CloudFront

Result:

* ✅ HTTPS enabled
* ✅ Custom domain live
* ✅ Private S3 origin
* ✅ Global low-latency delivery

---

## Security Best Practices Applied

* S3 bucket is **not publicly accessible**
* Access allowed only via CloudFront using OAC
* HTTPS enforced using ACM-managed certificates
* No hardcoded credentials or secrets

---

## Cost Considerations

* S3 storage: cents per month
* CloudFront: near zero for low traffic
* ACM certificates: free
* Route 53 hosted zone: ~$0.50/month

Designed to remain **well under $1/month** for a personal portfolio.

---

## Future Enhancements

* CI/CD with GitHub Actions
* Serverless contact form (API Gateway + Lambda + DynamoDB)
* Infrastructure as Code (Terraform)
* Monitoring with CloudWatch

---

**Author:** Sreekuttan Chandran Latha
**GitHub:** [https://github.com/SreekuttanCL](https://github.com/SreekuttanCL)
**LinkedIn:** [https://www.linkedin.com/in/sreekuttancl/](https://www.linkedin.com/in/sreekuttancl/)


