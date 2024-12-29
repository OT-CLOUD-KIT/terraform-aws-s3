name = "s3-bucket-23082024"
elb_service_accounts = {
  ap-south-1 = "730335482706"
}

elb_identifier = "logdelivery.elasticloadbalancing.amazonaws.com"
lb_identifier  = "delivery.logs.amazonaws.com"

lb_log_delivery_conditions = [
  {
    test     = "StringEquals"
    variable = "s3:x-amz-acl"
    values   = ["bucket-owner-full-control"]
  },
  // Add more conditions as needed
]
