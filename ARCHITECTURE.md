# Architecture: Hybrid Identity Lab

## Overview
This document explains the architecture and data flow of the hybrid identity environment built in this lab.

The design integrates an on-premises Active Directory environment with Microsoft Entra ID using Microsoft Entra Connect.

---

## High-Level Architecture

```text
CLIENT01 (Windows 11)
   │
   │  Domain Login / GPO / File Access
   ▼
DC01 (Active Directory Domain Controller)
   │
   │  Directory Sync (Users, Groups, Password Hash)
   ▼
SYNC01 (Microsoft Entra Connect)
   │
   │  Secure Sync (Outbound to Azure)
   ▼
Microsoft Entra ID (Azure)