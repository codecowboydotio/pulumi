"""A DigitalOcean Python Pulumi program"""

import pulumi
import pulumi_digitalocean as do

import pulumi
import pulumi_digitalocean as digitalocean


# Get my ssh key identifier
stack_config = pulumi.Config("cfg")
var_ssh_key_name = stack_config.require("ssh-key-name")
var_image=stack_config.require("image-name")
var_vm_name=stack_config.require("vm-name")

ssh_key = do.get_ssh_key(name=var_ssh_key_name)

# Create a web server
web = do.Droplet("web",
    name=var_vm_name,
    image=var_image,
    region=do.Region.SYD1,
    size="s-1vcpu-512mb-10gb",
    ssh_keys=[ssh_key.id],
)

pulumi.export('public_ip', web.ipv4_address)

