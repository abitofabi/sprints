# 📦 S3 Essentials – AWS CLI & Boto3 Code Snippets
---

## 🛠️ AWS CLI Commands
Make sure you've configured AWS CLI using `aws configure` before running these.
---

### 📁 Bucket Operations
# Create a new bucket
```bash
aws s3 mb s3://my-abi-bucket
```
# List all buckets
```bash
aws s3 ls
```
# 📤 File Upload & Download
# Upload a file
```bash
aws s3 cp myfile.txt s3://my-abi-bucket/
```
# Download a file
```bash
aws s3 cp s3://my-abi-bucket/myfile.txt ./downloaded.txt
```
📂 Folder Upload/Download
# Upload a folder to S3
```bash
aws s3 cp myfolder/ s3://my-abi-bucket/myfolder/ --recursive
```
# Download a folder from S3
```bash
aws s3 cp s3://my-abi-bucket/myfolder/ ./myfolder/ --recursive
```
🧹 Delete Files or Folders
# Delete a single file
```bash
aws s3 rm s3://my-abi-bucket/myfile.txt
```
# Delete a folder recursively
```bash
aws s3 rm s3://my-abi-bucket/myfolder/ --recursive
```
🔁 Sync Local and S3 Folders
# Sync local to S3
```bash
aws s3 sync ./localfolder s3://my-abi-bucket/localfolder
```
# Sync S3 to local
```bash
aws s3 sync s3://my-abi-bucket/localfolder ./localfolder
```
## 🐍 Boto3 (Python) Snippets
Make sure you've installed boto3 with pip install boto3 and configured AWS credentials.
```python
import boto3

# Create S3 client
s3 = boto3.client('s3')

# ✅ List all buckets
response = s3.list_buckets()
for bucket in response['Buckets']:
    print(bucket['Name'])

# 📤 Upload a file
s3.upload_file('myfile.txt', 'my-abi-bucket', 'myfile.txt')

# 📥 Download a file
s3.download_file('my-abi-bucket', 'myfile.txt', 'downloaded.txt')

# 📜 List objects in a bucket
response = s3.list_objects_v2(Bucket='my-abi-bucket')
for obj in response.get('Contents', []):
    print(obj['Key'])

# 🧹 Delete a file
s3.delete_object(Bucket='my-abi-bucket', Key='myfile.txt')
```
