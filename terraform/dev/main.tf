provider "aws" {
    region = "us-west-2"
}

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
resource "aws_connect_contact_flow" "connect_flow" {
    instance_id = var.connect_instance_id
    name = "Terraform_ivr_cf2"
    type = "CONTACT_FLOW"
    content = file("../contact-flows/terraform_ivr_cf2.json")
    description = "This flow was created by terraform"
    tags ={
        Environment = "DEV"
        Project = "AmazonConnectTerraform"
        Owner="Reddy"
    }
}

