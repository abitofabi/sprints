# AWS DEA-C01: EC2 Basics - Commands and Examples

## 1. Setting permissions on .pem file
```bash
chmod 400 my-key.pem
```
2. SSH into EC2 instance
```bash
ssh -i my-key.pem ec2-user@<ec2-public-ip>
```
# For Ubuntu AMI:
```bash
ssh -i my-key.pem ubuntu@<ec2-public-ip>
```

3. Add a new Linux user and setup SSH access
```bash
sudo adduser abinaya
sudo mkdir /home/abinaya/.ssh
sudo nano /home/abinaya/.ssh/authorized_keys
# Paste the new user's public key here
sudo chown -R abinaya:abinaya /home/abinaya/.ssh
```
4. Viewing attached EBS volumes inside EC2
```bash
lsblk
```
5. Mounting a new EBS volume
```bash
sudo mkfs -t ext4 /dev/xvdf   # Format new volume (example device)
sudo mkdir /data
sudo mount /dev/xvdf /data
```
