# AWS Route 53 & CloudFront Notes

---

## 1️⃣ Amazon Route 53

### What is Route 53?

- AWS managed **DNS** (Domain Name System) web service
- Translates domain names to IP addresses
- Highly available and scalable

### Key Features

- **Routing Policies**  
  - Simple  
  - Weighted  
  - Latency-based  
  - Failover  
  - Geolocation  
  - Geoproximity (with traffic biasing)  
  - Multi-value answer

- **Health Checks & Failover**  
  - Monitor endpoints  
  - Route traffic away from unhealthy resources  

- **Domain Registration**  
  - Buy/manage domain names  
  - Integrates with DNS routing  

### Use Cases

- Directing users to nearest endpoint for low latency  
- Disaster recovery with failover routing  
- Load balancing with weighted policies  
- Geo-restriction or content localization

---

## 2️⃣ Amazon CloudFront

### What is CloudFront?

- AWS **Content Delivery Network (CDN)**
- Distributes content globally from edge locations
- Speeds up delivery of static and dynamic content  

### Key Features

- **Edge locations** worldwide for caching content  
- Supports HTTP/HTTPS, streaming, WebSockets  
- Custom SSL/TLS certificates (via AWS Certificate Manager)  
- Origin support: S3, EC2, Elastic Load Balancer, custom origins  
- Cache behaviors & invalidations  
- Geo-restriction and signed URLs/cookies for access control  

### Use Cases

- Speeding up website, video streaming, API responses  
- Protecting origin with DDoS mitigation (AWS Shield)  
- Serving dynamic content with low latency

---

## Exam Tips: Route 53 vs CloudFront

| Feature         | Route 53                                | CloudFront                        |
|-----------------|----------------------------------------|---------------------------------|
| Purpose         | DNS routing                            | Content delivery & caching       |
| Works at        | DNS layer (domain to IP resolution)   | Network edge caching & delivery  |
| Supports        | Health checks, failover, routing policies | Caching, SSL, geo restrictions   |
| Use case        | Directing user requests to endpoints   | Speeding up content delivery     |

---

## Quick Facts

- Route 53’s **geoproximity** routing allows traffic biasing based on location + weights  
- CloudFront caches at edge locations, reducing load on origin servers  
- Use Route 53 health checks to route traffic away from unhealthy endpoints  
- CloudFront can integrate with AWS WAF for additional security  

---

