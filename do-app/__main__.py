import pulumi
import pulumi_digitalocean as digitalocean

stack_config = pulumi.Config("cfg")
var_app_name = stack_config.require("app-name")
var_app_size = stack_config.require("app-size")
var_service_name = stack_config.require("service-name")
var_branch = stack_config.require("branch")

python_sample = digitalocean.App("python-sample", spec={
    "name": var_app_name,
    "region": "ams",
    "services": [{
        "name": var_service_name,
        "instance_count": 2,
        "instance_size_slug": var_app_size,
        "git": {
            "repo_clone_url": "https://github.com/codecowboydotio/do-pulumi-app",
            "branch": var_branch,
        },
    }],
})

pulumi.export('app_url', python_sample.live_url)

