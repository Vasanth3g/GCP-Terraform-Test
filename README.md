# GCP-Terraform-Test
Terraform Webserver Load Balancer Deployment

Pre-requisite:

    - Terraform v1.1.9
    - GCP (with credentials)
    
1. Clone the repo for setup GCP Load Balancer

    ``` git clone https://github.com/Vasanth3g/GCP-Terraform-Test.git  ```

2. Download the credentials from GCP like below.
    ```
    {
      "type": "service_account",
      "project_id": "my-project",
      "private_key_id": "5a230d**********",
      "private_key": "-----BEGIN PRIVATE KEY----- ********   END PRIVATE KEY-----\n",
      "client_email": "*******@developer.gserviceaccount.com",
      "client_id": "1050***********",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/824080028473-compute%40developer.gserviceaccount.com"
    }
    ```

3. Replace the file into auth directory.

    ``` cp <file> auth/<file> ```

4. Below parameters needs to be change for your project:

    - Replace wherever project name and region on terraform files with respect to your account.
    - network parameter need to change as per your project on network-firewall.tf
    - instance groups under group paramter also need to change as per your project on gcp_lb.tf


5. Initiate the teraform configuration without errors

    ```terraform init ```

6. Plan the teraform without errors

    ``` terraform plan ```

7. Above 5 & 6 th steps compiled then execute below step to apply resources in GCP

    ``` terraform apply --auto-approve ```

8. After applied resources, wait for around 10 min to setup all the webserver configs.
    ```
    ......
    module.gce-lb-http.google_compute_health_check.default["default"]: Refreshing state... [id=projects/true-loader-349707/global/healthChecks/group-http-lb-hc-default]
    module.gce-lb-http.google_compute_global_address.default[0]: Refreshing state... [id=projects/true-loader-349707/global/addresses/group-http-lb-address]
    module.gce-lb-http.google_compute_firewall.default-hc[0]: Refreshing state... [id=projects/true-loader-349707/global/firewalls/group-http-lb-hc-0]
    google_compute_instance.web-server-1: Refreshing state... [id=projects/true-loader-349707/zones/asia-south2-a/instances/test-vm-1]
    google_compute_instance.web-server-2: Refreshing state... [id=projects/true-loader-349707/zones/asia-south2-a/instances/test-vm-2]
    google_compute_firewall.allow-http: Refreshing state... [id=projects/true-loader-349707/global/firewalls/fw-allow-http]
    module.gce-lb-http.google_compute_backend_service.default["default"]: Refreshing state... [id=projects/true-loader-349707/global/backendServices/group-http-lb-backend-default]
    module.gce-lb-http.google_compute_url_map.default[0]: Refreshing state... [id=projects/true-loader-349707/global/urlMaps/group-http-lb-url-map]
    google_compute_instance_group.webservers: Refreshing state... [id=projects/true-loader-349707/zones/asia-south2-a/instanceGroups/terraform-webservers]
    module.gce-lb-http.google_compute_target_http_proxy.default[0]: Refreshing state... [id=projects/true-loader-349707/global/targetHttpProxies/group-http-lb-http-proxy]
    module.gce-lb-http.google_compute_global_forwarding_rule.http[0]: Refreshing state... [id=projects/true-loader-349707/global/forwardingRules/group-http-lb]
    ```
9. Run below command to get load balancer public IP like below
    ```
        vasanthm@Vasanths-MacBook-Air GCP % terraform show | grep ip_address
        ip_address            = "*.*.*.*"
    ```
