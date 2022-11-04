# Bastion Host

<!--
https://github.com/thethgomes/aws-lab-bastion/blob/main/README.md

https://www.youtube.com/watch?v=PNjBp5R98Lk
https://www.youtube.com/watch?v=oJnWUbpJduA
https://github.com/chicalicdan/aws-bastionhost-ssh-tunnel
https://github.com/haandol/bastionhost-rds-tutorial/blob/384110c9059ecd07a1ba1c618d6f08bf11da402e/README.md
https://aws.amazon.com/premiumsupport/knowledge-center/rds-connect-using-bastion-host-linux/
https://www.youtube.com/watch?v=lFTSs8UT_sA
-->

![Bastion Host](/assets/images/aws/bastion-host.jpg)

**Keywords:** Tunneling

## Alternative

- AWS Systems Manager (SSM) / Fleet Manager

## Glossary

- AWS Elastic Computer Cloud (EC2)
- Database Migration Service (DMS)
- Remote Desktop Protocol (RDP)
- Secure Shell (SSH)
- Virtual Private Clouds (VPC)

## Terms

- Subnet

<!--
ssh \
  -i ./denglobal.pem \
  -L 33060:dellglobal-prod-aurora.cluster-c5143nzu1j0i.us-east-1.rds.amazonaws.com:3306 \
  ec2-user@18.170.40.178
-->

<!--
IAM Role: EC2_SSM_core
-->

<!--
https://github.com/aws/amazon-ssm-agent
-->
