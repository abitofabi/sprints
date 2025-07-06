# AWS Storage Extras – Cheat Sheet 🧠

This guide covers key AWS services used for data transfer, hybrid storage, and legacy system compatibility. Each service addresses unique enterprise needs — from FTP to exabyte transfers to tape emulation.

---

## ❄️ Snow Family – Physical Data Transfer

| Service         | Description                                                               | Use Case                              |
|-----------------|---------------------------------------------------------------------------|----------------------------------------|
| **Snowcone**     | Smallest device (~8 TB), rugged, supports edge compute & data sync        | Edge locations, IoT, light field ops   |
| **Snowball**     | Moves TBs–PBs of data, supports compute (EC2, Lambda)                     | Large on-prem data to AWS              |
| **Snowmobile**   | TRUCK-SIZED transfer of exabytes of data                                  | Full data center migration             |

> ❗ *Used when network transfer is too slow or impossible.*

---

## 🔁 AWS DataSync – Fast Network-Based Data Transfer

| Feature                   | Description                                  |
|---------------------------|----------------------------------------------|
| Online transfer tool      | Sync files/folders over a network            |
| One-time or scheduled     | Automate transfers from on-prem to AWS       |
| Supports NFS, SMB, S3, EFS, FSx | Integrates well with most file systems  |

> ⚡ For regular or one-time **online transfers**, faster than custom scripts.

---

## 📁 AWS Transfer Family – FTP/SFTP/FTPS Gateway

| Feature              | Description                                      |
|----------------------|--------------------------------------------------|
| Managed SFTP/FTP/FTPS | Legacy-compatible file transfer endpoint         |
| Backend Storage      | Usually integrates with S3                       |
| Secure Access        | IAM & logging support                            |

> 💡 *When legacy clients still use SFTP but you want AWS scalability.*

---

## 🧠 AWS Storage Gateway – Hybrid Cloud Bridge

Connects on-prem environments to AWS storage services seamlessly.

### Types:

| Gateway Type     | Description                                             | Storage Backend     |
|------------------|---------------------------------------------------------|----------------------|
| **File Gateway**  | Mount S3 as a network drive (NFS/SMB), with local cache| S3                   |
| **Volume Gateway**| Mount block devices on-prem; async backups to AWS     | EBS Snapshots        |
| **Tape Gateway**  | Emulates physical tape libraries                       | Glacier Deep Archive |

> 🏛 *Perfect for enterprises with legacy infrastructure that can’t migrate overnight.*

---

## 🧵 Tape Gateway – For Legacy Tape-Based Backups

| Step                     | Description                                      |
|--------------------------|--------------------------------------------------|
| 🎞️ Virtual Tape Library  | Appears as a real tape system to backup apps     |
| 📦 Cached to S3          | Recent backups stored in S3                      |
| 🧊 Archived to Glacier DA | After 30 days, data auto-moves to Deep Archive  |
| 🔁 Restore option         | Can retrieve tapes (takes hours)                |

> 🧓 *Used by banks, hospitals, & mainframe-heavy clients with tape workflows.*

---

## 🧩 Amazon FSx – Fully Managed File Systems

Choose FSx when you need a native file system (vs. object or block storage):

| FSx Variant              | Protocol & Use Case                            |
|--------------------------|------------------------------------------------|
| **FSx for Windows**       | SMB, AD-integrated, for .NET & Windows apps   |
| **FSx for Lustre**        | High-perf, HPC, ML, analytics workloads       |
| **FSx for OpenZFS**       | Unix, POSIX workloads needing ZFS             |
| **FSx for NetApp ONTAP**  | NetApp-compatible, snapshots, hybrid setups   |

> 📂 *Use FSx when apps need traditional file system behavior.*

---

## 🔚 TL;DR When to Use What

| Need                                  | Use This                       |
|---------------------------------------|--------------------------------|
| Massive offline data transfer         | Snowball/Snowcone/Snowmobile  |
| Automated online file transfer        | DataSync                      |
| Legacy SFTP/FTP into AWS              | Transfer Family               |
| Mount S3/NFS/SMB on-prem              | File Gateway                  |
| Virtual block device w/ AWS backup    | Volume Gateway                |
| Legacy tape backups                   | Tape Gateway + Glacier        |
| Windows/Linux-native file systems     | FSx variants                  |

---
