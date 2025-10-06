"""An AWS Python Pulumi program"""

import pulumi
from pulumi_aws import s3
import pulumi_random as random

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
bucket = s3.Bucket('my-bucket',
  bucket=suffix
)


# Export the name of the bucket
pulumi.export('bucket_name', bucket.id)
pulumi.export('bucket_name2', suffix)
