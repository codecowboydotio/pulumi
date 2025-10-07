"""An AWS Python Pulumi program"""

import pulumi
from pulumi_aws import s3
import pulumi_aws as aws
import pulumi_random as random
import json

config = pulumi.Config()
project_name = config.get("project_nane", "svk")
bucket_name = config.get("bucket_name")


# Random suffix for bucket
random = random.RandomString("random",
    length=6,
    upper=False,
    special=False
)

suffix = random.id.apply(lambda id: f"{project_name}-{bucket_name}-{id}")

# Create an AWS resource (S3 Bucket)

website_bucket = aws.s3.Bucket("websiteBucket",
    bucket=suffix,
    force_destroy=True,
)

bucket_config = aws.s3.BucketWebsiteConfiguration("bucket_config",
    bucket=website_bucket.id,
    index_document={
        "suffix": "index.html",
    },
    error_document={
        "key": "error.html",
    },
    routing_rules=[{
        "condition": {
            "key_prefix_equals": "docs/",
        },
        "redirect": {
            "replace_key_prefix_with": "documents/",
        },
    }])


website_bucket_public_access_block = aws.s3.BucketPublicAccessBlock("access_block",
    bucket=website_bucket.id,
    block_public_acls=False,
    block_public_policy=False,
    ignore_public_acls=False,
    restrict_public_buckets=False
)

policy_arn = website_bucket.arn.apply(lambda arn: f"{arn}/*")
bucket_policy_document = {
    "Version": "2012-10-17",
    "Statement": [
        {
           "Sid": "Statement1",
           "Effect": "Allow",
           "Principal": {
             "AWS": "469568072720",
           },
           "Action": "*",
           "Resource": [
             website_bucket.arn,
             policy_arn,
           ],
        },
        {
            "Sid": "Statement2",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket",
            ],
            "Resource": [
                policy_arn,
                website_bucket.arn,
            ],
        }
    ]
}

# Convert the Python dictionary to a JSON string
#bucket_policy_json = json.dumps(bucket_policy_document)

# Attach the bucket policy to the S3 bucket
website_bucket_policy = aws.s3.BucketPolicy("website-bucket-policy",
    bucket=website_bucket.id, # Referencing the ID of the bucket created above
    policy=bucket_policy_document # The JSON policy document
)

# Upload a simple index.html file to the S3 bucket
index_html = aws.s3.BucketObject("indexHtml",
    bucket=website_bucket.id,
    key="index.html",
    content_type="text/html",
    source=pulumi.FileAsset("index.html"), # Assuming an index.html file exists in the same directory
)

s3_origin_id = "myS3Origin"
distribution_resource = aws.cloudfront.Distribution("distributionResource",
    default_root_object="index.html",
    default_cache_behavior={
        "allowed_methods": [
          "DELETE",
          "GET",
          "HEAD",
          "OPTIONS",
          "PATCH",
          "POST",
          "PUT",
        ],
        "viewer_protocol_policy": "allow-all",
        "cached_methods": [
          "GET",
          "HEAD",
        ],
        "target_origin_id": s3_origin_id,
    #    "max_ttl": 0,
    #    "min_ttl": 0,
        "forwarded_values": {
            "cookies": {
                "forward": "none",
            },
            "query_string": False,
            #"headers": ["string"],
            #"query_string_cache_keys": ["string"],
        },
    #    "default_ttl": 0,
    #    "field_level_encryption_id": "string",
    #    "origin_request_policy_id": "string",
    #    "realtime_log_config_arn": "string",
    #    "response_headers_policy_id": "string",
    #    "smooth_streaming": False,
    #    "compress": False,
    #    "trusted_key_groups": ["string"],
    #    "trusted_signers": ["string"],
    #    "cache_policy_id": "string",
    },
    enabled=True,
    origins=[{
        "domain_name": website_bucket.bucket_regional_domain_name,
        "origin_id": s3_origin_id,
    }],
    restrictions={
        "geo_restriction": {
            "restriction_type": "whitelist",
            "locations": [
              "AU",
              "CA",
            ],
        },
    },
    viewer_certificate={
    #    "acm_certificate_arn": "string",
        "cloudfront_default_certificate": True,
    #    "iam_certificate_id": "string",
    #    "minimum_protocol_version": "string",
    #    "ssl_support_method": "string",
    }
)

# Export the name of the bucket
pulumi.export('website URL', bucket_config.website_endpoint)
pulumi.export('dist', distribution_resource)
