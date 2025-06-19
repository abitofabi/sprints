# 🧊 SnowPro Sprint – Day 3 Notes

## 📘 Topics Covered:
- Access Control (RBAC)
- Resource Monitors
- JSON & Semi-Structured Data

## 🧠 Key Concepts:

### 🔐 Access Control (RBAC)
- Roles: ACCOUNTADMIN,SECURITYADMIN, SYSADMIN, PUBLIC, custom roles
- Privileges granted to roles, not users directly
- ACCOUNTADMIN - highest provilege ; PUBLIC default privilege
- USERADMIN subset of SECURITYADMIN : used for creating user
- SYSADMIN : used for creating roles
- Use `GRANT`, `REVOKE`, `SHOW GRANTS`
- Best practice: Use least privilege model

###  ⏳ Resource Monitors
 - Monitor warehouse usage in credits
 - Can suspend/notify when limits reached

### 📄 JSON & Semi-Structured Data
 - Use VARIANT type to store JSON
 - Use FLATTEN, LATERAL, GET_PATH, OBJECT_KEYS
