#### Only for reference , changes made in IAM GUI.
### Sample IAM Inline Policy: Allow S3 PutObject in specific bucket
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::my-tamil-bucket/*"
    }
  ]
}
```
### Sample Permission Boundary Policy: Limit S3 to GetObject only
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-tamil-bucket/*"
    }
  ]
}
```
### Sample IAM Role Trust Policy for EC2
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```
### Sample IAM Role Permission Policy for S3 Access
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::my-tamil-bucket/*"
    }
  ]
}
```
### Sample Secrets Manager policy to allow read access to a secret
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret"
      ],
      "Resource": "arn:aws:secretsmanager:region:account-id:secret:my-db-secret"
    }
  ]
}
```
### Sample WAF Rule (basic IP block example)
```json
{
  "Name": "BlockBadIP",
  "Priority": 1,
  "Action": { "Block": {} },
  "Statement": {
    "IPSetReferenceStatement": {
      "ARN": "arn:aws:wafv2:region:account-id:ipset/blocked-ips"
    }
  },
  "VisibilityConfig": {
    "SampledRequestsEnabled": true,
    "CloudWatchMetricsEnabled": true,
    "MetricName": "BlockBadIP"
  }
}
```
