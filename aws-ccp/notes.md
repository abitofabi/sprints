# 📦 AWS Storage Services – Exam Cheat Sheet

## 1. Amazon S3 – Object Storage
- **Type**: Object storage
- **Best for**: Backups, static files, big data lakes, archives
- **Keywords**: "object storage", "scalable", "archive", "static website hosting"
- **Access**: HTTPS API, not mountable as a filesystem
- **Variants**: S3 Standard, IA, Glacier, Deep Archive

---

## 2. Amazon EBS – Block Storage
- **Type**: Block storage (like virtual hard disk)
- **Best for**: Storage for a single EC2 instance (databases, boot volumes)
- **Keywords**: "low latency", "attach to one EC2", "persistent disk"
- **Access**: Single EC2 at a time
- **Note**: Snapshots go to S3

---

## 3. Amazon EFS – File Storage
- **Type**: Fully managed NFS (Network File System)
- **Best for**: Shared file system for many EC2s or **on-prem servers**
- **Keywords**: "file storage", "POSIX-compliant", "scalable", "massive parallel access"
- **Access**: Multiple EC2 or on-prem servers can mount concurrently
- **Use case**: Centralized storage for HPC, AI/ML training, web apps

---

## 4. AWS Storage Gateway – Hybrid
- **Type**: Hybrid storage between on-prem & AWS
- **Flavors**:
  - **File Gateway** → On-prem file system backed by S3  
  - **Volume Gateway** → Block storage, cached/backup in AWS  
  - **Tape Gateway** → Replace physical tape archives
- **Keywords**: "on-premises + AWS integration", "cache", "extend local storage"
- **Access**: Applications think it’s local, data syncs to AWS

---

## 5. Amazon FSx (extra)
- **Type**: Managed specialized file systems
  - **FSx for Windows** → SMB
  - **FSx for Lustre** → High performance (HPC, ML training)
- **Keywords**: "Windows workloads", "HPC", "Lustre"

---

# 🎯 Exam Quick Picks
- **Object storage** → S3  
- **Block storage, single EC2** → EBS  
- **Shared file system, parallel access** → EFS  
- **On-prem + AWS hybrid** → Storage Gateway  
- **Windows / HPC special cases** → FSx