# data-processing-pipeline

In this project, we'll be configuring a data processing pipeline where the data will first go to the S3 bucket and will trigger a lambda function.

The tools used in this project are: AWS, Terraform, S3, Lambda, SNS, Dynamodb Table, KMS, CloudWatch, IAM, .JSON File.

The screenshot below is how your project file layout should be once everything is configured.

<img width="216" height="672" alt="project layout" src="https://github.com/user-attachments/assets/eb1e83ee-b597-4b0e-96c7-c5ccf6982683" />

# Provider.tf file:
Next, create a file for your provider and you may call it provider.tf. Remember all your terraform configuration files end with .tf.

<img width="294" height="89" alt="provider" src="https://github.com/user-attachments/assets/2af25e22-e791-4ff7-a5ab-7d0d62d1ef2a" />
<img width="218" height="84" alt="aws region" src="https://github.com/user-attachments/assets/9889d3b8-d6d5-4070-af2c-de9c4a6aeeb1" />

# S3-bucket.tf file:
Next, create a file for your S3 configuration and you just call it s3-bucket.tf. The data will received through your S3 bucket.

<img width="427" height="86" alt="S3 bucket" src="https://github.com/user-attachments/assets/2e7275aa-6d6b-4416-82bd-94c48a7712f3" />
<img width="331" height="80" alt="S3 bucket name" src="https://github.com/user-attachments/assets/54b28f31-f8ed-423d-a3d3-acf0d8e85ea3" />

Next in same S3 bucket file, configure a s3 bucket object resource. This resource will deploy any file that's in our local file explorer(.JSON) to our S3 bucket.

<img width="332" height="153" alt="S3 object" src="https://github.com/user-attachments/assets/80dbee0a-a936-4bde-98c6-2e56c5b37329" />

Next in the same S3 bucket file, configure a s3 bucket event notification resource. This resource will trigger services when certain events occur.

<img width="532" height="192" alt="S3 bucket notification" src="https://github.com/user-attachments/assets/894a571b-59bd-4c0c-827e-c230fa644880" />

# iam_roles.tf file:
Next, create a new file for your IAM policies and you can call it iam_roles.tf. Here we'll create a iam policy for lambda, it assume an executive role so that our lambda has permission to have access to our AWS services.

<img width="383" height="286" alt="iam role" src="https://github.com/user-attachments/assets/abf5e7ce-d56e-48a4-96a4-d8d9b1ad32d3" />
<img width="258" height="79" alt="iam role name" src="https://github.com/user-attachments/assets/a4d4ae9d-dcac-4333-abaa-6f01f36ee9e4" />

Next in the same iam_role.tf file, create a iam role policy attachment resoure. This resource attaches our policy to the lambda function.

<img width="651" height="79" alt="iam role policy attachment" src="https://github.com/user-attachments/assets/8c4c4f5e-4805-4692-8185-c5bd9374332d" />

# lambda_function.tf file:
Next, create a new file for your lambda function and you may name it lambda_function.tf. This resource will process our data and we'll only be charged for the milliseconds when the function is running.

<img width="408" height="367" alt="lambda function" src="https://github.com/user-attachments/assets/a81cac85-7de0-4561-b5f7-c3abc8fe25d3" />
<img width="285" height="79" alt="lambda function name" src="https://github.com/user-attachments/assets/a1e56b82-0cfc-47ba-83e9-ecebdfb722c1" />
<img width="331" height="80" alt="S3 bucket name" src="https://github.com/user-attachments/assets/7cea7db6-b600-453e-9393-ba4ffb08916c" />

# CloudWatch.tf file:
Next, create a new file for your cloudwatch resource and you can name it cloudwatch.tf.
In the cloudwatch.tf file, create a cloudwatch log group resource. This resource is container in AWS cloudwatch thats holds log streams. 
A cloudwatch log group like a folder and log stream is a file inside the folder which is created per resource.

<img width="392" height="176" alt="cloudwatch log group" src="https://github.com/user-attachments/assets/2288aa58-8e04-4a4a-b8ed-1b36d46baa63" />
<img width="365" height="75" alt="cloudwatch log group name" src="https://github.com/user-attachments/assets/6e3d6eaf-2c48-4163-8226-87fa202de705" />

# kms_key.tf:
Next, create a file for your kms key resources and you can name it kms_key.tf. A kms key is managed service that allows you to create and control encryption keys for your data.

<img width="372" height="94" alt="kms key" src="https://github.com/user-attachments/assets/2fd59e1c-89ed-4ac8-894c-e010aa266012" />

In the same kms_key.tf file, create a kms key policy resource. This resource is a IAM based policy that defines who can use or manage the KMS key and what actions they perform.

<img width="386" height="364" alt="kms key policy" src="https://github.com/user-attachments/assets/fbf16a33-3260-4f99-ac32-92d26f996977" />

# sns_topic.tf file:
Next, create a new file for your sns topic resources and you can name it sns_topic.tf. The sns topic resource is used to send notifications from cloud services or apps to other systems or users.

<img width="328" height="59" alt="sns topic" src="https://github.com/user-attachments/assets/a9206f07-98ae-4150-9468-98ab13d091cd" />

Next in the same sns_topic.tf file, create a sns topic subscription. This resource connects a destination to the sns topic.

<img width="477" height="105" alt="sns topic subscription" src="https://github.com/user-attachments/assets/fbf9eaee-f45d-4c94-bd04-704e5b2e7f8d" />

# dynamodb_table.tf file:
Next, create a new file and you can name it dynamodb_table.tf. This resource is where all the data will be stored once it has passed from the S3 bucket.

<img width="444" height="588" alt="dynamodb table top" src="https://github.com/user-attachments/assets/55deacdf-7caf-42d1-b75d-e2c779311176" />
<img width="423" height="134" alt="dynamodb table bottem" src="https://github.com/user-attachments/assets/7aa4952c-c396-4896-98aa-b6b649309300" />

# lambda.zip folder:
Optionally, you can create a demo .JSON folder to be deployed into the S3 bucket. 

<img width="433" height="327" alt="mycompany-sales-data-market json file" src="https://github.com/user-attachments/assets/253aa608-5cf2-406e-849e-9563e3db6861" />

Please make sure you compress the file and put it's destination to lambda.zip. You can use this command "Compress-Archieve -Path .\lambda\lambda.zip-DestinationPath .\lambda.zip"

# outputs.tf file:
Next, create a outputs.tf file. Here we will have a few outputs as a best practice.

<img width="457" height="62" alt="lambda invoke arn output" src="https://github.com/user-attachments/assets/b7213d5d-19ad-4b35-8d7e-66fd96932a94" />
<img width="345" height="60" alt="sns topic arn output" src="https://github.com/user-attachments/assets/d87e800e-c5c6-4f72-ae6a-1ba1c2893acc" />
<img width="483" height="61" alt="lambda function name output" src="https://github.com/user-attachments/assets/a33e9a6c-de02-44e3-87e2-a5d8c3fa5476" />

# Deployment:
Once you have all the resources configured then it's time to use the terraform init coomand to initialize the project folder.

Once that is done, then you can use the terraform plan command make sure you are deployed all the resources configured

<img width="997" height="419" alt="terraform plan top" src="https://github.com/user-attachments/assets/1cc0d0ea-90b7-47ba-b2be-f0251f549608" />
<img width="1077" height="461" alt="terraform plan bottem" src="https://github.com/user-attachments/assets/d33e2ecd-48ab-4425-a1db-2c6bf2fce4d2" />

Once that is done, and you are ready to deploy then you can use the terraform apply command. This command will deployed the resources configured.

<img width="1002" height="423" alt="terraform apply top" src="https://github.com/user-attachments/assets/64374824-9436-4c77-bdee-515f5ddc21cc" />
<img width="520" height="475" alt="terraform apply yes" src="https://github.com/user-attachments/assets/bde2c17d-23ff-4736-a323-c8b771d00600" />
<img width="1136" height="628" alt="terraform apply done" src="https://github.com/user-attachments/assets/86d03dd4-915b-4da4-b568-2bb5d1eeabc6" />

The screenshots below are the resources deployed into my AWS account.

<img width="1053" height="388" alt="S3 bucket deploy" src="https://github.com/user-attachments/assets/64b27d06-cebb-4c6b-88e0-e2123349ec51" />
<img width="1078" height="253" alt="sns topic deploy" src="https://github.com/user-attachments/assets/9e9cd9b3-2053-4064-a5b9-606939eb2457" />
<img width="1078" height="254" alt="sns topic subscription deploy" src="https://github.com/user-attachments/assets/400d7042-d808-44ac-b081-7989a19437af" />
<img width="1093" height="48" alt="cloudwatch log group deploy" src="https://github.com/user-attachments/assets/6b6a38ed-ceb5-48fd-8efd-06f0104c96b3" />
<img width="1083" height="276" alt="dynamodb table deploy" src="https://github.com/user-attachments/assets/be777e8d-d31a-4cd6-bdfc-5d95b411f7fe" />
<img width="1076" height="386" alt="lambda function deploy" src="https://github.com/user-attachments/assets/77eff8ee-db98-4407-ac13-8ff942108293" />
<img width="1053" height="42" alt="lambda iam role deploy" src="https://github.com/user-attachments/assets/98cc23af-e31e-47db-a002-b53b99bbad9b" />

You should get a AWS Notification-Subscription Confirmation email.

Once you are done with the deployment and do not want to incur costs then you should use the terraform destroy command. This command will delete all the resources that was deployed. 

<img width="1134" height="263" alt="terraform destroy top" src="https://github.com/user-attachments/assets/f57abb16-c31c-4388-85a7-e40d14b69633" />
<img width="1138" height="496" alt="terraform destroy yes" src="https://github.com/user-attachments/assets/398e5e59-9a91-4791-b38b-6471871d9c70" />
<img width="1113" height="498" alt="terraform destroy complete" src="https://github.com/user-attachments/assets/e680c701-caa5-4318-a1e0-af0cfd44060f" />
