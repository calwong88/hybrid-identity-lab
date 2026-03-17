# Hybrid Identity Lab (Active Directory + Microsoft Entra ID)

## Overview
This project demonstrates a hybrid identity lab integrating on-premises Active Directory with Microsoft Entra ID using Microsoft Entra Connect.

The environment simulates a real enterprise setup where identities are managed on-premises and synchronized to the cloud.

## Lab Components
- DC01 - Active Directory Domain Controller
- SYNC01 - Microsoft Entra Connect Sync Server
- CLIENT01 - Windows 11 domain-joined workstation
- Microsoft Entra ID - Cloud identity platform

## Features Implemented
- Active Directory Domain Services
- Organizational Units and security groups
- Department-based file shares and NTFS permissions
- Group Policy mapped drives
- Microsoft Entra Connect user synchronization
- Hybrid Microsoft Entra joined device
- Security Defaults enabled

## Architecture
```text
CLIENT01
   │
   ▼
DC01
   │
   ▼
SYNC01
   │
   ▼
Microsoft Entra ID