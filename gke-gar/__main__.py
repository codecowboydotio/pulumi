# us-central1-docker.pkg.dev/annular-weaver-447910-j1/my-repository/swapi
import pulumi
import pulumi_gcp as gcp

my_repo = gcp.artifactregistry.Repository("my-repo",
    location="us-central1",
    repository_id="my-repository",
    description="example docker repository",
    format="DOCKER")

service_account = gcp.serviceaccount.Account("service_account",
    account_id="service-account-id",
    display_name="Service Account")

binding = gcp.serviceaccount.IAMBinding("foo",
    service_account_id=service_account.name,
    role="roles/viewer",
    members=[service_account.email.apply(lambda email: f"serviceAccount:{email}")])
pulumi.export("service_account", service_account)

