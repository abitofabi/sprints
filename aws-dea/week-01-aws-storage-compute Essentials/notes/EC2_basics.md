# EC2 Basics Notes

## 1. What is EC2?
- Elastic Compute Cloud (EC2) is AWS's service to provide resizable compute capacity in the cloud.
- Acts like a virtual server you can launch, manage, and scale.
- Supports different OSes, instance types, and configurations.

## 2. EC2 vs Azure Virtual Machines
- Both are Infrastructure as a Service (IaaS).
- EC2 instances are AWS virtual servers; Azure Virtual Machines are Microsoft's equivalent.

## 3. AMI (Amazon Machine Image)
- Template that contains OS and software to launch an EC2.
- Customizable; can create your own AMI.
- Amazon Linux 2 AMI is free tier eligible.

## 4. Key Pairs
- Secure login method for EC2 via SSH.
- Consists of a private key (.pem) and public key stored in AWS.
- Private key must be kept safe; no re-download.
- Best practice: Each user should have a unique key pair.
- Keys are region-specific.
- Used to securely SSH into instances.

## 5. EBS (Elastic Block Store)
- Persistent, network-attached virtual hard drive for EC2.
- Data persists independent of EC2 lifecycle unless deleted.
- Can have multiple EBS volumes per EC2 (up to ~28).
- Types: General Purpose SSD, Provisioned IOPS SSD, Throughput Optimized HDD, Cold HDD.
- Supports snapshots (backups) to S3.
- EBS volumes can only attach to one EC2 at a time.
- For shared storage, use EFS.

## 6. Elastic IP (EIP)
- Static public IPv4 address.
- Manually allocated and attached to EC2 instances.
- Stays fixed even if EC2 stops and starts.
- Useful for stable DNS, whitelisting, or failover.
- Free if attached; small cost if not attached.

## 7. Summary
- EC2 instances are virtual servers.
- AMI defines the instance OS and software.
- Key Pairs provide secure SSH access.
- EBS acts as durable storage.
- Elastic IP provides fixed public IP addresses.
