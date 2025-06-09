# 🧑‍💻 AWS Storage – Part 2 Code Snippets

---

## 🔹 EBS (Elastic Block Store)

### ✅ Create a new EBS volume (8 GiB gp3 in us-east-1a):
```bash
aws ec2 create-volume \
  --availability-zone us-east-1a \
  --size 8 \
  --volume-type gp3
```
### 🔗 Attach volume to an EC2 instance:
```bash
aws ec2 attach-volume \
  --volume-id vol-0abc123456789xyz0 \
  --instance-id i-0abc123456789xyz0 \
  --device /dev/xvdf
  ```
### 📸 Create a snapshot: (for moving across AZ)
```bash
aws ec2 create-snapshot \
  --volume-id vol-0abc123456789xyz0 \
  --description "Snapshot from CLI"
  ```
## 🔹 EFS (Elastic File System)
### ✅ Create a file system:
```bash
aws efs create-file-system \
  --performance-mode generalPurpose \
  --throughput-mode bursting
  ```
### 🌐 Create mount targets in subnets (within your VPC):
```bash
aws efs create-mount-target \
  --file-system-id fs-12345678 \
  --subnet-id subnet-abc123 \
  --security-groups sg-123456
```

###📎 Create an access point:
```bash
aws efs create-access-point \
  --file-system-id fs-12345678 \
  --posix-user Uid=1000,Gid=1000 \
  --root-directory 'Path=/mydir,CreationInfo={OwnerUid=1000,OwnerGid=1000,Permissions=755}'
```
##🔹 AWS Backup
###📂 Create a backup vault:
```bash
aws backup create-backup-vault \
  --backup-vault-name my-vault \
  --encryption-key-arn arn:aws:kms:region:acct-id:key/key-id
```
### 📝 Create a backup plan (simple JSON plan required):
```bash
aws backup create-backup-plan \
  --backup-plan file://backup-plan.json
```
```json
{
  "BackupPlanName": "daily-backup",
  "Rules": [{
    "RuleName": "Daily",
    "TargetBackupVaultName": "my-vault",
    "ScheduleExpression": "cron(0 5 ? * * *)",
    "StartWindowMinutes": 60,
    "CompletionWindowMinutes": 180,
    "Lifecycle": {
      "DeleteAfterDays": 30
    }
  }]
}
```
###🔒 Assign resources to the plan:
```bash
aws backup create-backup-selection \
  --backup-plan-id your-plan-id \
  --backup-selection file://backup-selection.json
```
backup-selection.json example:
```json
{
  "SelectionName": "select-ebs",
  "IamRoleArn": "arn:aws:iam::acct-id:role/service-role/AWSBackupDefaultServiceRole",
  "Resources": [
    "arn:aws:ec2:region:acct-id:volume/vol-0abc123456789xyz0"
  ]
}
```
