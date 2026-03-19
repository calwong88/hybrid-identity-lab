# Architecture: Hybrid Identity Lab

## 🧭 Overview
This document explains the architecture, components, and identity flow of the hybrid identity environment.

The lab integrates:
- On-premises Active Directory (AD DS)
- Microsoft Entra Connect
- Microsoft Entra ID (Azure)

This architecture reflects how modern enterprises bridge on-prem infrastructure with cloud identity systems.

---

## 🏗️ High-Level Architecture

## Architecture Diagram

![Architecture](./IMAGES/enterprise-architecture-diagram.png)

---

## 🧩 Core Components

### 🖥️ DC01 — Domain Controller
**Role:**
- Active Directory Domain Services (AD DS)
- DNS Server

**Responsibilities:**
- Stores users and groups
- Authenticates domain users
- Applies Group Policy (GPO)
- Hosts file shares

---

### 🔄 SYNC01 — Microsoft Entra Connect Server
**Role:**
- Synchronization engine between on-prem AD and Entra ID

**Responsibilities:**
- Syncs:
  - Users
  - Groups
  - Password hashes (Password Hash Sync)
- Maintains identity consistency across environments

---

### 💻 CLIENT01 — Domain-Joined Device
**Role:**
- End-user workstation

**Responsibilities:**
- Authenticates against DC01
- Receives Group Policy
- Accesses shared resources
- Registers with Microsoft Entra ID (Hybrid Join)

---

### ☁️ Microsoft Entra ID
**Role:**
- Cloud identity provider

**Responsibilities:**
- Stores synchronized identities
- Manages device registration
- Enables cloud authentication
- Applies security policies (Security Defaults)

---

## 🔄 Identity Flow

### 1️⃣ On-Prem Authentication
```text
User → CLIENT01 → DC01
```

- User logs into Windows using domain credentials
- DC01 validates authentication

---

### 2️⃣ Directory Synchronization
```text
DC01 → SYNC01 → Microsoft Entra ID
```

- Users and groups sync to the cloud
- Password Hash Sync enables cloud authentication

---

### 3️⃣ Device Registration (Hybrid Join)
```text
CLIENT01 → Microsoft Entra ID
```

- Device automatically registers in Entra ID
- Device shows as:
  - Hybrid Azure AD Joined

---

## 🔐 Security Model

### Authentication Layers
- On-Prem: Active Directory
- Cloud: Microsoft Entra ID

### Security Features Implemented
- Security Defaults enabled
- Multi-Factor Authentication (MFA) capability
- Legacy authentication blocked

---

## 🌐 Network Flow

```text
[ CLIENT01 ]
     │
     ▼
[ DC01 (AD DS + DNS + GPO) ]
     │
     ▼
[ SYNC01 (Entra Connect) ]
     │
     ▼
[ Microsoft Entra ID ]
```

---

## 🧠 Key Concepts Demonstrated

- Hybrid Identity Architecture
- Directory Synchronization
- Password Hash Synchronization (PHS)
- Hybrid Azure AD Join
- Identity Lifecycle Management
- Zero Trust Foundation (Security Defaults)

---

## 💼 Real-World Relevance

This architecture is commonly used in organizations where:

- Legacy systems rely on Active Directory
- Cloud services rely on Microsoft Entra ID
- Identity must exist across both environments

Common in:
- Enterprises
- Hybrid cloud deployments
- Microsoft 365 environments

---

## 🚀 Future Enhancements

- Conditional Access policies (requires P1)
- Microsoft Intune (device management)
- Self-Service Password Reset (SSPR)
- Identity Protection
- Privileged Identity Management (PIM)

---

## 👤 Author

Calvin Wong
