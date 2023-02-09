# LOCALS

locals {
  tags = merge(var.tags, { "Project" = var.project, "Environment" = terraform.workspace })
}

# MODULES & RESOURCES

module "alb" {
  source = "github.com/terraform-aws-modules/terraform-aws-alb"
  providers = {
    aws = aws.target
  }
  name   = "${terraform.workspace}-${var.project}-lb"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  # tbd
}

module "autoscaling" {
  source = "github.com/terraform-aws-modules/terraform-aws-autoscaling"
  providers = {
    aws = aws.target
  }
  # tbd
}
