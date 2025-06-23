Serverless Web App on AWS – Lambda, S3, DynamoDB, API Gateway, CloudFront, WAF, CodePipeline, and CloudWatch
This repository contains a serverless application on AWS that performs CRUD (Create, Read, Update, Delete) operations for managing employee records. The architecture implements a secure, scalable, and cost-effective solution using AWS managed services.

🔧 Features
	• Serverless architecture built using AWS services
	• Fully automated CI/CD with AWS CodePipeline
	• Real-time application monitoring and logging using CloudWatch
	• RESTful API for managing employees (Create, Read, Delete)
	• Static frontend hosted via Amazon S3 + CloudFront CDN
	• Backend logic implemented using AWS Lambda (Python)
	• Secure with AWS WAF, IAM roles, and scoped permissions

🧱 Architecture Overview
	• Frontend: HTML/JS static site hosted on Amazon S3
	• Backend: Python-based Lambda functions
	• API Layer: RESTful API via Amazon API Gateway
	• Database: Amazon DynamoDB for storing employee data
	• CDN: CloudFront for global distribution and HTTPS access
	• Security: AWS WAF + IAM roles + Security Groups + NACLs
	• CI/CD: AWS CodePipeline with source, build, and deploy stages
	• Monitoring: AWS CloudWatch for logs, alarms, and metrics

🧰 Prerequisites
Before diving into building this serverless solution, it is important to ensure you have the following:
	• AWS Account: You need an active AWS account to access and configure the various services such as Lambda, S3, API Gateway, DynamoDB, etc.
	• AWS IAM: Familiarity with AWS Identity and Access Management (IAM) is essential to manage user permissions, roles, and policies, especially for Lambda execution, DynamoDB access, and CodePipeline operations.
	• Knowledge of AWS Lambda: You should have a basic understanding of AWS Lambda — how to create functions, configure triggers, assign permissions, and deploy code using the console or CLI.
	• Basic Knowledge of Python: Since all the backend logic is written in Python, it's important to be comfortable reading and writing simple Python scripts, especially for request parsing and interacting with DynamoDB.
	• Understanding of REST APIs: Have a working knowledge of REST principles and HTTP methods like GET, POST, and DELETE, as these will be used when interacting with your API Gateway endpoints from the frontend.
	• Basic Knowledge of CI/CD (Optional but Recommended): Knowing how AWS CodePipeline works will help you understand the automated build and deployment flow from source control (like GitHub) to Lambda and S3.
	• CloudWatch Awareness: Familiarity with AWS CloudWatch will help you monitor logs, create alarms, and debug issues in Lambda, API Gateway, and other integrated services.

