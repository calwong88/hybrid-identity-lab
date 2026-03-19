# Setup Guide: Hybrid Identity Lab

## 🧭 Overview
This guide walks through building a hybrid identity environment using:

- Active Directory Domain Services (AD DS)
- Microsoft Entra Connect
- Microsoft Entra ID (Azure)

The goal is to synchronize on-prem users and devices to the cloud.

---

## 🖥️ Lab Environment

| Machine   | Role                          |
|----------|-------------------------------|
| DC01     | Domain Controller (AD DS)     |
| SYNC01   | Entra Connect Server          |
| CLIENT01 | Domain-joined Windows client  |

---

## ⚙️ Step 1: Configure Domain Controller (DC01)

### Install AD DS
1. Open Server Manager  
2. Click Add Roles and Features  
3. Select:
   - Active Directory Domain Services  
   - DNS Server  
4. Complete installation  

---

### Promote to Domain Controller
1. Click "Promote this server to a domain controller"  
2. Choose "Add a new forest"  
3. Root domain name:

corp.local

4. Set DSRM password  
5. Complete setup and reboot  

---

## 👥 Step 2: Create Users & Groups

### Create Organizational Units
- IT  
- HR  
- Sales  

### Create Users
- alice.it  
- bob.hr  
- charlie.sales  

### Create Security Groups
- GG_IT_Users  
- GG_HR_Users  
- GG_Sales_Users  

### Assign Users to Groups
- Add each user to their respective department group  

---

## 📁 Step 3: Create File Shares

### Create Folder Structure

C:\Shares\IT  
C:\Shares\HR  
C:\Shares\Sales  

---

### Configure NTFS Permissions
- GG_IT_Users → Modify (IT folder)  
- GG_HR_Users → Modify (HR folder)  
- GG_Sales_Users → Modify (Sales folder)  

---

### Share the Folder

\\DC01\Company  

---

## 🧩 Step 4: Configure Group Policy (Drive Mapping)

1. Open Group Policy Management  
2. Create a new GPO: Department Drive Mapping  

### Configure Drive Mapping

Navigate to:

User Configuration → Preferences → Windows Settings → Drive Maps  

Create mappings:

- IT → I: drive  
- HR → H: drive  
- Sales → S: drive  

---

## 🔗 Step 5: Configure CLIENT01

### Set DNS
10.0.0.10  

### Join Domain
corp.local  

Login using:
corp\Administrator  

Restart the machine.

---

### Test User Login

corp\alice.it  
corp\bob.hr  
corp\charlie.sales  

---

## 🔄 Step 6: Configure SYNC01

### Join Domain
corp.local  

Login as:
corp\Administrator  

---

## ☁️ Step 7: Install Microsoft Entra Connect

1. Download Microsoft Entra Connect  
2. Run installer  
3. Choose Express Settings  

### Sign In
admin@yourtenant.onmicrosoft.com  

### Connect to AD DS
corp\Administrator  

---

## 🔁 Step 8: Force Sync

Run on SYNC01:

Import-Module ADSync  
Start-ADSyncSyncCycle -PolicyType Delta  

---

## 💻 Step 9: Hybrid Join Device

On CLIENT01, run:

dsregcmd /status  

Expected:

AzureAdJoined : YES  
DomainJoined  : YES  

---

## ☁️ Step 10: Verify in Microsoft Entra ID

Check:
- Users → Synced from on-prem  
- Devices → CLIENT01 shows as Hybrid Joined  

---

## 🧪 Validation Checklist

- Domain created  
- Users and groups created  
- File shares working  
- Client joined to domain  
- Users synced to Entra ID  
- Device hybrid joined  

---

## ⚠️ Common Issues

### Domain join fails
- Check DNS (must point to DC01)

### Sync not working
Run:
Start-ADSyncSyncCycle -PolicyType Delta  

### corp.local not resolving
- Disable IPv6 in lab if needed  

---

## 👤 Author

Calvin Wong

https://www.linkedin.com/in/calvinkmwong/