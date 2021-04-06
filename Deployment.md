# Deployment

## Setting Up GCP Project

We will setup the GCP Project with a Service Account to enable Terraform to access our GCP resources.

### Go to GCP Cloud Console

![image](https://user-images.githubusercontent.com/59161665/113643275-91eced00-9647-11eb-8c69-2fc775bf2269.png)

### Press the Dropdown Bar

![image](https://user-images.githubusercontent.com/59161665/113643532-28211300-9648-11eb-860c-0a8798b65593.png)

### Press New Project 

![image](https://user-images.githubusercontent.com/59161665/113643590-45ee7800-9648-11eb-9679-f5424d90696f.png)

### Set up the Project with a billing account

![image](https://user-images.githubusercontent.com/59161665/113643736-91a12180-9648-11eb-8480-10794049325e.png)

### Go to IAM & Admin and select Service Accounts

![image](https://user-images.githubusercontent.com/59161665/113645531-aaabd180-964c-11eb-9374-015a2bbd3468.png)

### Create a Service Account

![image](https://user-images.githubusercontent.com/59161665/113645673-ee9ed680-964c-11eb-8e58-3bb5f958ce23.png)

### Go to IAM & Admin and select IAM

![image](https://user-images.githubusercontent.com/59161665/113645783-27d74680-964d-11eb-9fc5-3ebba5191899.png)

### Press Add

![image](https://user-images.githubusercontent.com/59161665/113645839-43dae800-964d-11eb-8f89-d71639ce6864.png)

### Enter the created Service Accounts and Grant it the role of Kubernetes Engine Service Agent

![image](https://user-images.githubusercontent.com/59161665/113645946-6ff66900-964d-11eb-879f-72e094ef6003.png)

### Done!

We should be done with the setup on the GCP side 

## Terraform: Cluster Deployment

In this section, we will create the GKE cluster and node pool using Terraform.
Make sure your terraform binary file is in the same folder as your terraform file.

### GCP information

Open the variables.tf file:
* Enter your GCP Project ID by overwriting REPLACE_ME 
* Enter your Service account as shown in the member section of the IAM page by overwriting REPLACE_ME

### Run Terraform init

``` bash
terraform init
```

![image](https://user-images.githubusercontent.com/59161665/113648055-99b18f00-9651-11eb-837b-0c50458f790c.png)

![image](https://user-images.githubusercontent.com/59161665/113648095-a9c96e80-9651-11eb-97cd-ae15009b65a6.png)

### Run Terraform plan

``` bash
terraform plan
```

### Run Terraform apply

``` bash
terraform apply
```

When prompted for "yes", type yes and press enter.






