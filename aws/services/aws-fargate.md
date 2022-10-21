# AWS Fargate

## CLI

Use [AWS Copilot CLI](/aws/aws-copilot-cli.md).

## Solution

### Resume

- Fully Managed Infrastructure and Scaling
- Support for ECS and EKS
- Pay only for CPU and Memory Time Used

### Networking in Fargate

- Tasks run in Customer VPC
- ALB and NLB Support
- Advanced Task Level Networking

### Security with Fargate

- Who own what?
  - Fargate Service owns infrastructure
  - Customer owns and manages their tasks
- No SSH access to the infrastructure
- Cluster-level isolation for your containers

### Fargate Use Cases

- Long running services
- Highly variable workloads
- Monolithic app portability
- Batch jobs and microservices

### EC2 Use Cases

- Use EC2 Mode for RI and Spot Clusters
- Use EC2 Mode for Windows Containers
