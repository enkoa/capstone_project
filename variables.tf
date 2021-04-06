# Provider info
# Enter your project ID into the REPLACE_ME section
variable "project_id" {
	default		= "REPLACE_ME"
}
variable "region" {
	default		= "us-central1"
}

# Cluster specs
# Feel fre to change any of the fields to meet your respective 
# cluster specs.
#
# Enter your Service Accoun into the REPLACE_ME section
variable "cluster_name" {
	default		= "my-gke-cluster"
}
variable "machine_type" {
	default		= "n1-standard-1"
}
variable "min_count" {
	default		= 1
}
variable "max_count" {
	default		= 3
}
variable "disk_size_gb" {
	default		= 50
}
variable "disk_type" {
	default		= "pd-standard"
}
variable "image_type" {
	default		= "COS"
}
variable "initial_node_count" {
	default		= 1
}
variable "service_account" {
	default		= "REPLACE_ME"
}

variable "ip_range_pods" { 
	default 		= ""
}
variable "ip_range_services" {
	default		= ""
}
variable "network" { 
	default 	= "default"
}
variable "subnetwork" {
	default		= ""
}






