import pulumi
import pulumi_digitalocean as digitalocean

python_sample = digitalocean.App("python-sample", spec={
    "name": "python-sample",
    "region": "ams",
    "services": [{
        "name": "py-service",
        "instance_count": 1,
        "instance_size_slug": "apps-s-1vcpu-1gb",
        "git": {
            "repo_clone_url": "https://github.com/codecowboydotio/do-pulumi-app",
            "branch": "main",
        },
    }],
})
