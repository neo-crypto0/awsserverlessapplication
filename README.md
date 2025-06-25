## Serverless Web App on AWS – Lambda, S3, DynamoDB, API Gateway, CloudFront, WAF, CodePipeline, and CloudWatch
This repository contains a serverless application on AWS that performs CRUD (Create, Read, Update, Delete) operations for managing employee records. The architecture implements a secure, scalable, and cost-effective solution using AWS managed services.

### 🔧 Features
	• Serverless architecture built using AWS services
	• Fully automated CI/CD with AWS CodePipeline
	• Real-time application monitoring and logging using CloudWatch
	• RESTful API for managing employees (Create, Read, Delete)
	• Static frontend hosted via Amazon S3 + CloudFront CDN
	• Backend logic implemented using AWS Lambda (Python)
	• Secure with AWS WAF, IAM roles, and scoped permissions

### 🧱 Architecture Overview

![image](https://github.com/user-attachments/assets/65fffe4a-c05a-4245-8aa1-d40d33cdbc97)

	• Frontend: HTML/JS static site hosted on Amazon S3
	• Backend: Python-based Lambda functions
	• API Layer: RESTful API via Amazon API Gateway
	• Database: Amazon DynamoDB for storing employee data
	• CDN: CloudFront for global distribution and HTTPS access
	• Security: AWS WAF + IAM roles + Security Groups + NACLs
	• CI/CD: AWS CodePipeline with source, build, and deploy stages
	• Monitoring: AWS CloudWatch for logs, alarms, and metrics

### 🧰 Prerequisites
	Before diving into building this serverless solution, it is important to ensure you have the following:
 
	• AWS Account: You need an active AWS account to access and configure the various services such as Lambda, S3, API Gateway, DynamoDB, etc.
	• AWS IAM: Familiarity with AWS Identity and Access Management (IAM) is essential to manage user permissions, roles, and policies, especially for Lambda execution, DynamoDB access, and CodePipeline operations.
	• Knowledge of AWS Lambda: You should have a basic understanding of AWS Lambda — how to create functions, configure triggers, assign permissions, and deploy code using the console or CLI.
	• Basic Knowledge of Python: Since all the backend logic is written in Python, it's important to be comfortable reading and writing simple Python scripts, especially for request parsing and interacting with DynamoDB.
	• Understanding of REST APIs: Have a working knowledge of REST principles and HTTP methods like GET, POST, and DELETE, as these will be used when interacting with your API Gateway endpoints from the frontend.
	• Basic Knowledge of CI/CD (Optional but Recommended): Knowing how AWS CodePipeline works will help you understand the automated build and deployment flow from source control (like GitHub) to Lambda and S3.
	• CloudWatch Awareness: Familiarity with AWS CloudWatch will help you monitor logs, create alarms, and debug issues in Lambda, API Gateway, and other integrated services.

### Snapshots from the application

#### API Gateway
![apigateway](https://github.com/user-attachments/assets/29b74199-a44c-4e31-b600-2def60fbf2d2)

#### Cloud Front
![cloudfront](https://github.com/user-attachments/assets/c2bd39ed-7878-4193-a17e-48ee632752fc)

#### Cloudwatch Logs
![cloudwatch](https://github.com/user-attachments/assets/d40539bc-6927-43c6-b343-185ec3df63b7)

#### Code Pipeline
![codeapplication](https://github.com/user-attachments/assets/4b208266-62bf-4a14-b07c-e948cc6942b6)

#### DynamoDB
![dynamodb](https://github.com/user-attachments/assets/a5815731-8e38-4da2-b484-75bf68984816)

#### Lambda Function
![lambdafunction](https://github.com/user-attachments/assets/8e53c85b-1e9f-4c96-9b5d-8b947aa6b5bb)

#### S3 bucket 
![s3bucket](https://github.com/user-attachments/assets/cca6849e-88e5-4117-bd46-51a6beac77a5)

#### Web ACL (WAF)
![webacl](https://github.com/user-attachments/assets/12d7da62-b0f6-4ef5-b491-6a90e126a6ff)

#### Application
![application](https://github.com/user-attachments/assets/6c95740b-b391-4b0b-b3ff-b465fb7788f0)


