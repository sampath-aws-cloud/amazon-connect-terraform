provider "aws" {
    region = "us-west-2"
}
/*
resource "aws_connect_contact_flow" "order_status_flow" {
    instance_id = var.connect_instance_id
    name = "Terraform_ivr_cf1"
    type = "CONTACT_FLOW"
    content = file("../contact-flows/terraform_ivr_cf2.json")
    description = "This flow was created by terraform"
    tags ={
        Environment = "DEV"
        Project = "AmazonConnectTerraform"
        Owner="Reddy"
    }
}
*/

#To deploy the multiple connect flows 

locals {
    flows = fileset("${path.root}/terraform/contact-flows","**/*.json")
}
resource "aws_connect_contact_flow" "flows" {
    for_each    = toset(local.flows)
    instance_id = var.connect_instance_id
    name        = replace(each.key, ".json","")
    type        = "CONTACT_FLOW"
    content     = file("${path.root}/terraform/contact-flows/${each.key}")
    description = "This flow was created by Terraform"
    tags ={
        Environment = "DEV"
        Project = "AmazonConnectTerraform"
        Owner="Reddy"
    }
}