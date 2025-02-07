import pulumi
import pulumi_gcp as gcp

provider_cfg = pulumi.Config("gcp")
gcp_project = provider_cfg.require("project")
gcp_region = provider_cfg.get("region", "us-central1")
config = pulumi.Config()
service_acct_name = config.get("svcacctname", "gar-svc-acct")

my_repo = gcp.artifactregistry.Repository("my-repo",
    location=gcp_region,
    repository_id="my-repository",
    description="example docker repository",
    format="DOCKER")

service_account = gcp.serviceaccount.Account("service_account",
    account_id=service_acct_name,
    display_name="Pulumi GAR service account")

project = gcp.projects.IAMBinding("project",
    project=gcp_project,
    role="roles/artifactregistry.reader",
    #role="roles/editor",
    members=[service_account.email.apply(lambda email: f"serviceAccount:{email}")])


pulumi.export("service_account", service_account)
pulumi.export("repository", my_repo)
pulumi.export("repository", project)

