# 🚀 Deploy WhatIsMyAdapter to Cloud Portainer

## 📋 Quick Deploy Steps

### **Step 1: Prepare Host Directories (SSH into your cloud server)**

```bash
# Create the whatismyadapter user (UID:1034, GID:100)
sudo groupadd -g 100 users 2>/dev/null || true  # Create group if not exists
sudo useradd -u 1034 -g 100 -m -s /bin/bash whatismyadapter || true

# Create directory structure
sudo mkdir -p /volume1/docker/whatismyadapter/{app,logs,nginx-logs,tmp,mysql,redis,mailpit}

# Set ownership to whatismyadapter user (UID:1034, GID:100)
sudo chown -R 1034:100 /volume1/docker/whatismyadapter

# Set proper permissions
sudo chmod -R 755 /volume1/docker/whatismyadapter

# Verify ownership
ls -ln /volume1/docker/whatismyadapter
```

**Expected output:** All directories should show `1034 100` as owner.

### **Step 2: Access Portainer**
Open your cloud Portainer URL (e.g., `https://your-server-ip:9443`)

### **Step 3: Create Stack Using Repository**

1. Click **"Stacks"** → **"+ Add stack"**
2. **Name:** `whatismyadapter`
3. **Build method:** Select **"Repository"**
4. **Repository configuration:**
   - **Repository URL:** `https://github.com/Robjects-Community/WhatIsMyAdaptor.git`
   - **Repository reference:** `main-clean` (or `portainer-stack`)
   - **Compose path:** `portainer-stacks/docker-compose-cloud.yml`

### **Step 4: Add Environment Variables**

Scroll to **"Environment variables"** and add these:

```bash
# CRITICAL - Required
SECURITY_SALT=YOUR-32-CHARACTER-RANDOM-STRING-HERE
MYSQL_ROOT_PASSWORD=your-secure-root-password
MYSQL_DATABASE=whatismyadapter_db
MYSQL_USER=adapter_user
MYSQL_PASSWORD=your-secure-db-password
REDIS_PASSWORD=your-secure-redis-password
REDIS_USERNAME=default
WILLOW_ADMIN_PASSWORD=your-secure-admin-password
WILLOW_ADMIN_EMAIL=admin@yourdomain.com

# Application Settings
APP_NAME=WhatIsMyAdapter
APP_FULL_BASE_URL=https://yourdomain.com
DEBUG=false

# User Permissions (IMPORTANT - must match server user)
DOCKER_UID=1034
DOCKER_GID=100

# Ports (adjust if needed)
WILLOW_HTTP_PORT=8080
MYSQL_PORT=3310
PMA_HTTP_PORT=8082
MAILPIT_HTTP_PORT=8025
MAILPIT_SMTP_PORT=1125
REDIS_COMMANDER_HTTP_PORT=8084

# Redis Commander
REDIS_COMMANDER_USERNAME=admin
REDIS_COMMANDER_PASSWORD=your-redis-commander-password

# Optional
APP_DEFAULT_TIMEZONE=America/Chicago
EXPERIMENTAL_TESTS=Off
```

### **Step 5: Deploy**

1. Click **"Deploy the stack"**
2. Wait 5-10 minutes for build to complete
3. Monitor logs in Portainer

### **Step 6: Verify Services**

Access your services:
- **Application:** `http://your-server:8080`
- **Admin Panel:** `http://your-server:8080/admin`
- **PHPMyAdmin:** `http://your-server:8082`
- **Mailpit:** `http://your-server:8025`
- **Redis Commander:** `http://your-server:8084`

---

## 📂 Directory Structure on Server

```
/volume1/docker/whatismyadapter/
├── app/              # Application code (from build) - Owner: 1034:100
├── logs/             # Application logs - Owner: 1034:100
├── nginx-logs/       # Nginx access/error logs - Owner: 1034:100
├── tmp/              # Cache and temp files - Owner: 1034:100
├── mysql/            # MySQL database files - Owner: 999:999 (MySQL default)
├── redis/            # Redis persistence - Owner: 1034:100
└── mailpit/          # Email storage - Owner: 1034:100
```

**User Details:**
- **Username:** `whatismyadapter`
- **UID:** `1034`
- **GID:** `100` (users group)

---

## 🔐 Generate Secure Passwords

```bash
# Generate SECURITY_SALT (32+ characters)
openssl rand -base64 32

# Generate strong passwords
openssl rand -base64 24
```

---

## 🛠️ Troubleshooting

### Build Fails
- **Check:** Repository access (make sure repo is public or credentials provided)
- **Check:** Branch name is correct (`main-clean` or `portainer-stack`)
- **Check:** Compose file path is correct: `portainer-stacks/docker-compose-cloud.yml`

### Permission Errors

```bash
# On your server, verify user exists
id whatismyadapter
# Should show: uid=1034(whatismyadapter) gid=100(users)

# Fix ownership if needed
sudo chown -R 1034:100 /volume1/docker/whatismyadapter

# Fix permissions
sudo chmod -R 755 /volume1/docker/whatismyadapter

# Check specific directories
ls -ln /volume1/docker/whatismyadapter/
```

### Container Won't Start
- **Check logs** in Portainer → Containers → [container name] → Logs
- **Verify** all required environment variables are set
- **Ensure** ports are not already in use
- **Verify** UID:1034 and GID:100 are set correctly in environment variables

### Database Connection Issues
- Wait 60-90 seconds for MySQL to fully initialize
- Check MySQL logs in Portainer
- Verify MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE are set correctly
- MySQL runs as its own user (999:999), not as whatismyadapter user

### Volume Permission Issues

If you see "permission denied" errors:

```bash
# Check current ownership
ls -ln /volume1/docker/whatismyadapter/

# Fix all directories
sudo chown -R 1034:100 /volume1/docker/whatismyadapter/app
sudo chown -R 1034:100 /volume1/docker/whatismyadapter/logs
sudo chown -R 1034:100 /volume1/docker/whatismyadapter/nginx-logs
sudo chown -R 1034:100 /volume1/docker/whatismyadapter/tmp
sudo chown -R 1034:100 /volume1/docker/whatismyadapter/redis
sudo chown -R 1034:100 /volume1/docker/whatismyadapter/mailpit

# MySQL directory should be owned by mysql user (999:999)
sudo chown -R 999:999 /volume1/docker/whatismyadapter/mysql

# Verify
ls -ln /volume1/docker/whatismyadapter/
```

---

## 🔄 Update Stack

1. Push changes to GitHub repository
2. In Portainer: **Stacks** → **whatismyadapter** → **Pull and redeploy**
3. Portainer will rebuild from latest repository code

---

## 🧹 Clean Up / Remove

To completely remove the stack:

1. **In Portainer:** Stacks → whatismyadapter → **Delete**
2. **On Server (SSH):**
   ```bash
   # WARNING: This deletes ALL data
   sudo rm -rf /volume1/docker/whatismyadapter
   
   # Optional: Remove the user
   sudo userdel whatismyadapter
   ```

---

## 📝 Important Notes

1. **First deployment takes 5-10 minutes** (building from source)
2. **MySQL needs 60-90 seconds** to initialize on first run
3. **Volumes are host-mounted** at `/volume1/docker/whatismyadapter`
4. **Data persists** between stack updates/restarts
5. **User UID:1034 and GID:100** must be consistent across environment variables and host
6. **Backup** your MySQL data regularly

---

## 🔒 Security Best Practices

1. **Create the whatismyadapter user** before deploying
2. **Use strong passwords** for all services
3. **Never use default passwords** in production
4. **Set up firewall rules** to restrict access
5. **Use SSL/TLS** for production deployments
6. **Regular backups** of `/volume1/docker/whatismyadapter`
7. **Monitor logs** for suspicious activity

---

## ✅ Post-Deployment Checklist

- [ ] User `whatismyadapter` (UID:1034, GID:100) created on server
- [ ] All directories owned by 1034:100
- [ ] All services showing as "running" in Portainer
- [ ] Application accessible at your domain/IP
- [ ] Admin panel login works
- [ ] PHPMyAdmin database connection works
- [ ] Check logs for any errors
- [ ] Set up SSL/TLS certificate (recommended)
- [ ] Configure firewall rules
- [ ] Set up automated backups

---

## 📊 Service User Mapping

| Service | User Inside Container | Volume Ownership |
|---------|----------------------|------------------|
| **willowcms** | 1034:100 (whatismyadapter) | 1034:100 |
| **redis** | 1034:100 (whatismyadapter) | 1034:100 |
| **mysql** | 999:999 (mysql) | 999:999 |
| **mailpit** | 1034:100 (whatismyadapter) | 1034:100 |
| **phpmyadmin** | 33:33 (www-data) | N/A |
| **redis-commander** | Root (default) | N/A |

---

**Ready to deploy? Follow the steps above! 🚀**
