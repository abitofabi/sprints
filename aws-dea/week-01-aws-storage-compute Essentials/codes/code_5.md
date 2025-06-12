
# No Code day 
- Focused on conceptual understanding and hands-on setup in AWS Console/CLI.
# AWS vs Azure Networking Concepts (Day 5 Focus) 🌐⚔️

| Concept               | AWS Term                    | Azure Equivalent              | Notes                                                       |
|-----------------------|-----------------------------|------------------------------|-------------------------------------------------------------|
| Virtual Network       | VPC (Virtual Private Cloud)  | Virtual Network (VNet)        | Both provide isolated, private network environments         |
| Subnet                | Subnet                      | Subnet                       | Same concept — segment networks into smaller IP ranges      |
| Firewall              | Security Group              | Network Security Group (NSG) | Both are stateful firewalls controlling instance/network traffic |
| Firewall (Subnet level)| Network ACL (NACL)          | NSG applied to subnet         | AWS NACLs are stateless; Azure NSGs are stateful even at subnet level |
| Route Control         | Route Tables                | Route Tables                 | Direct traffic between subnets, internet gateways, etc.     |
| Internet Access       | Internet Gateway (IGW)      | Internet Gateway (via VNet Gateway) | Connects virtual network to internet                       |
| NAT                   | NAT Gateway                 | NAT Gateway                  | Enables outbound internet for private subnets               |

---

## Quick Tips

- AWS **NACLs** are stateless, so rules must allow both inbound and outbound traffic explicitly.  
- Azure NSGs are **stateful**, similar to AWS Security Groups.  
- Both platforms allow granular control over traffic for security and routing.
