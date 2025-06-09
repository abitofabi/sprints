🔨 Mini Projects for Each AWS DEA Sprint Week
✅ Week 1 – Storage + Compute
Mini Project: “Simple Resume Website on S3 with EC2 Backup”
📦 Use:

S3 static hosting for HTML resume page

Set bucket policy + enable versioning + test lifecycle rules

Launch a small EC2 instance → backup snapshot → terminate → restore

🔧 Concepts Practiced: S3 permissions, lifecycle, EC2 launch, AMI, snapshot, backups
📁 Output Folder: week1/projects/static-site-ec2-backup

✅ Week 2 – Data Engineering Core
Mini Project: “Serverless CSV to Parquet ETL with Glue + Athena Query”
📦 Use:

Upload a raw CSV to S3

Use AWS Glue Crawler to catalog it

Transform to Parquet with Glue ETL

Query the data in Athena

🔧 Concepts Practiced: Glue Catalog, PySpark script, Athena query
📁 Output Folder: week2/projects/csv-parquet-etl

✅ Week 3 – Databases & Warehousing
Mini Project: “Movie Ratings App with DynamoDB & Redshift”
📦 Use:

Store real-time ratings in DynamoDB

Batch export to S3 (TTL + Streams)

Load into Redshift for analytics

🔧 Concepts Practiced: NoSQL design, Redshift copy command, partition keys
📁 Output Folder: week3/projects/movie-ratings-pipeline

✅ Week 4 – Extras & Exam Edge
Mini Project: “Live Log Monitoring with Lambda + SNS Alerts”
📦 Use:

Push logs to CloudWatch

Trigger Lambda on log pattern match (e.g., errors)

Send SNS notification

🔧 Concepts Practiced: Event-driven architecture, Serverless alerts, Lambda
📁 Output Folder: week4/projects/log-monitoring-alerts

🗃️ Optional Bonus Projects (Post Sprint)
If you have spare time:

🌤️ Personal Budget Tracker (S3 + Glue + Athena + QuickSight)

📈 Crypto Price Tracker (Lambda + API + DynamoDB + S3 Dashboard)

🍽️ Smart Meal Planner (your AI project using AWS stack)


