import pulumi
import pulumi_gcp as gcp

# Get some provider-namespaced configuration values
provider_cfg = pulumi.Config("gcp")
gcp_project = provider_cfg.require("project")
gcp_region = provider_cfg.get("region", "us-central1")
# Get some additional configuration values
config = pulumi.Config()
nodes_per_zone = config.get_int("nodesPerZone", 1)
prefix = config.get("prefix")

# Create a new network
gke_network = gcp.compute.Network(
    "svk-gke-network",
    auto_create_subnetworks=False,
    description="A virtual network for your GKE cluster(s)"
)

# Create a subnet in the new network
gke_subnet = gcp.compute.Subnetwork(
    "svk-gke-subnet",
    ip_cidr_range="10.128.0.0/12",
    network=gke_network.id,
    private_ip_google_access=True
)

# Create a cluster in the new network and subnet
gke_cluster = gcp.container.Cluster(
    "svk-gke-cluster",
    addons_config={
        "dns_cache_config": {
            "enabled": True
        },
    },
    binary_authorization={
        "evaluation_mode": "DISABLED"
    },
    datapath_provider="ADVANCED_DATAPATH",
    description="A GKE cluster",
    initial_node_count=1,
    ip_allocation_policy={
        "cluster_ipv4_cidr_block": "/14",
        "services_ipv4_cidr_block": "/20"
    },
    location=gcp_region,
    #enable_autopilot=False,
    master_authorized_networks_config={
        "cidr_blocks": [{
            "cidr_block": "0.0.0.0/0",
            "display_name": "All networks"
        }]
    },
    network=gke_network.name,
    networking_mode="VPC_NATIVE",
    private_cluster_config={
        "enable_private_nodes": False,
        "enable_private_endpoint": False,
        "master_ipv4_cidr_block": "10.100.0.0/28"
    },
    remove_default_node_pool=True,
    release_channel={
        "channel": "STABLE"
    },
    subnetwork=gke_subnet.name,
    workload_identity_config={
        "workload_pool": f"{gcp_project}.svc.id.goog"
    }
)

# Create a GCP service account for the nodepool
gke_nodepool_sa = gcp.serviceaccount.Account(
    "svk-gke-nodepool-sa",
    account_id=pulumi.Output.concat(prefix, "-np-1-sa"),
    #account_id=pulumi.Output.concat(gke_cluster.name, "-np-1-sa"),
    display_name="Nodepool 1 Service Account"
)

# Create a nodepool for the cluster
gke_nodepool = gcp.container.NodePool(
    "svk-gke-nodepool",
    cluster=gke_cluster.id,
    node_count=nodes_per_zone,
    node_config={
        "machine_type": "n1-standard-4",
        "oauth_scopes": ["https://www.googleapis.com/auth/cloud-platform"],
        "service_account": gke_nodepool_sa.email
    }
)

# Build a Kubeconfig to access the cluster
cluster_kubeconfig = pulumi.Output.all(
    gke_cluster.master_auth.cluster_ca_certificate,
    gke_cluster.endpoint,
    gke_cluster.name).apply(lambda l:
    f"""apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: {l[0]}
    server: https://{l[1]}
  name: {l[2]}
contexts:
- context:
    cluster: {l[2]}
    user: {l[2]}
  name: {l[2]}
current-context: {l[2]}
kind: Config
preferences: {{}}
users:
- name: {l[2]}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: gke-gcloud-auth-plugin
      installHint: Install gke-gcloud-auth-plugin for use with kubectl by following
        https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
      provideClusterInfo: true
""")

# Export some values for use elsewhere
pulumi.export("networkName", gke_network.name)
pulumi.export("networkId", gke_network.id)
pulumi.export("clusterName", gke_cluster.name)
pulumi.export("clusterId", gke_cluster.id)
pulumi.export("kubeconfig", cluster_kubeconfig)

# pulumi stack output kubeconfig --show-secrets > kubeconfig.json

