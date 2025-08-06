# data-processing-pipeline

In this project, we'll be configuring a data processing pipeline where the data will first go to the S3 bucket and will trigger a lambda function.

The tools used in this project are: AWS, Terraform, S3, Lambda, SNS, Dynamodb Table, KMS, CloudWatch, IAM, .JSON File.

The screenshot below is how your project file layout should be once everything is configured.

<img width="216" height="672" alt="project layout" src="https://github.com/user-attachments/assets/eb1e83ee-b597-4b0e-96c7-c5ccf6982683" />

Next, create a file for your provider and you may call it provider.tf. Remember all your terraform configuration files end with .tf.

<img width="294" height="89" alt="provider" src="https://github.com/user-attachments/assets/2af25e22-e791-4ff7-a5ab-7d0d62d1ef2a" />
<img width="218" height="84" alt="aws region" src="https://github.com/user-attachments/assets/9889d3b8-d6d5-4070-af2c-de9c4a6aeeb1" />

Next, create a file for your S3 configuration and you just call it s3-bucket.tf. The data will received through your S3 bucket.

<img width="427" height="86" alt="S3 bucket" src="https://github.com/user-attachments/assets/2e7275aa-6d6b-4416-82bd-94c48a7712f3" />
<img width="331" height="80" alt="S3 bucket name" src="https://github.com/user-attachments/assets/54b28f31-f8ed-423d-a3d3-acf0d8e85ea3" />

Next in same S3 bucket file, configure a s3 bucket object resource. This resource will deploy any file that's in our local file explorer(.JSON) to our S3 bucket.

<img width="332" height="153" alt="S3 object" src="https://github.com/user-attachments/assets/80dbee0a-a936-4bde-98c6-2e56c5b37329" />

Next in the same S3 bucket file, configure a s3 bucket event notification resource. This resource will trigger services when certain events occur.

<img width="532" height="192" alt="S3 bucket notification" src="https://github.com/user-attachments/assets/894a571b-59bd-4c0c-827e-c230fa644880" />

Next, create a new file for your IAM policies and you can call it iam_roles.tf. Here we'll create a iam policy for lambda, it assume an executive role so that our lambda has permission to have access to our AWS services.

<img width="383" height="286" alt="iam role" src="https://github.com/user-attachments/assets/abf5e7ce-d56e-48a4-96a4-d8d9b1ad32d3" />
<img width="258" height="79" alt="iam role name" src="https://github.com/user-attachments/assets/a4d4ae9d-dcac-4333-abaa-6f01f36ee9e4" />

Next in the same iam_role.tf file, create a iam role policy attachment resoure. This resource attaches our policy to the lambda function.

<img width="651" height="79" alt="iam role policy attachment" src="https://github.com/user-attachments/assets/8c4c4f5e-4805-4692-8185-c5bd9374332d" />

Next, create a new file for your lambda function and you may name it lambda_function.tf. This resource will process our data and we'll only be charged for the milliseconds when the function is running.

<img width="408" height="367" alt="lambda function" src="https://github.com/user-attachments/assets/a81cac85-7de0-4561-b5f7-c3abc8fe25d3" />
<img width="285" height="79" alt="lambda function name" src="https://github.com/user-attachments/assets/a1e56b82-0cfc-47ba-83e9-ecebdfb722c1" />
<img width="331" height="80" alt="S3 bucket name" src="https://github.com/user-attachments/assets/7cea7db6-b600-453e-9393-ba4ffb08916c" />

