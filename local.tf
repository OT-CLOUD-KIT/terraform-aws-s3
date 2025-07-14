locals {
  # Standard tag components
  base_name = "${var.env}-${var.bu}-${var.app}"

  common_tags = {
    "BusinessUnit" = var.bu
    "Program"      = var.program
    "Application"  = var.app
    "Environment"  = var.env
    "Team"         = var.team
    "Region"       = var.region
    "ManagedBy"    = "Terraform"
  }
}


locals {
  create_bucket      = var.create_bucket
  create_bucket_acl  = var.acl != null && var.acl != "null"
  attach_policy      = var.attach_elb_log_delivery_policy || var.attach_lb_log_delivery_policy || var.attach_iam_policy || var.attach_cloudtrail_policy
  cors_rules         = var.cors_rules
}