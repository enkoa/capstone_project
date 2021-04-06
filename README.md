# Capstone Project for Software Engineering

## Description

In this project, we will be deploying an instance of a containerized MongoDB to a kubernetes environment in the cloud using Terraform. In addition to deploying MongoDB, each instance data will be persist upon pod shutdown.

## Software Requirements

* any provider to host kubernetes environments (AWS, GCP, Azure). This tutorial will only include GCP. This requires enable billing.
* gcloud CLI tool: https://cloud.google.com/sdk/docs/install
* kubectl CLI tool: https://kubernetes.io/docs/tasks/tools/
* Terraform CLI tool: https://www.terraform.io/downloads.html

## Deployment

Check out Deployment.md on how to deploy this project in a Linux VM

## Testing

Check out Test.md on how to test if this project work

## Destroy

Check out Destroy.md on how to shutdown pods and destroy infrastructure.
