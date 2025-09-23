create_bucket = true
name          = "team-c-ntd-bucket"
bucket_prefix = "ntd-"
force_destroy = true

object_lock_enabled          = false
enable_transfer_acceleration = true


acl = "private"

attach_public_policy    = true
block_public_acls       = true
block_public_policy     = true
ignore_public_acls      = true
restrict_public_buckets = true

attach_cloudtrail_policy       = true
attach_elb_log_delivery_policy = false
attach_lb_log_delivery_policy  = false
attach_iam_policy              = false
iam_policy                     = ""

control_object_ownership = true
object_ownership         = "BucketOwnerEnforced"

cors_rules = []

server_side_encryption_configuration = []

logging = {
  target_bucket = "ot-cloud-kit-bucket"
  target_prefix = "logs/"
}

versioning = {
  enabled    = true
  status     = "Enabled"
  mfa_delete = false
}


lifecycle_rules = [
  {
    id     = "log-transition"
    status = "Enabled"

    transitions = [
      {
        days          = 30
        storage_class = "STANDARD_IA"
      },
      {
        days          = 60
        storage_class = "GLACIER"
      }
    ]
    expiration_days = 365
  }
]

metric_configuration = []

elb_service_accounts = {}

elb_identifier      = "logdelivery.elb.amazonaws.com"
lb_identifier       = "logdelivery.elasticloadbalancing.amazonaws.com"
log_delivery_folder = "logs"

lb_log_delivery_conditions = {}#
################ Naming Convension #####################

env = "dev"
app = "otcloud-kit"
owner = "opstree"
region = "us-east-1"