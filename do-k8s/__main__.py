"""A DigitalOcean Python Pulumi program"""

import pulumi
import pulumi_digitalocean as do
from pulumi_command import local


stack_config = pulumi.Config("cfg")
var_cluster_name = stack_config.require("cluster-name")
var_node_name = stack_config.require("node-name")
var_node_size = stack_config.require("node-size")
var_node_count = int(stack_config.require("node-count"))
var_region = stack_config.require("region")


cluster = do.KubernetesCluster("do-cluster", 
    name = var_cluster_name,
    region = var_region,
    version = "latest",
    node_pool = do.KubernetesClusterNodePoolArgs( 
        name = var_cluster_name + "-" + var_node_name,
        size = var_node_size,
        node_count = var_node_count,
    ),
);

pulumi.export('foo', cluster)
pulumi.export('kubeconfig', cluster.kube_configs)

# pulumi stack output kubeconfig --show-secrets | jq -r .[].raw_config > kubeconfig.json
