# Architecture: Hybrid Identity Lab

## Overview
This document explains the architecture, components, and identity flow of the hybrid identity environment.

The lab integrates:
- On-premises Active Directory
- Microsoft Entra Connect
- Microsoft Entra ID (Azure)

This mirrors how real enterprise environments manage identity across on-prem and cloud systems.

---

## 🏗️ High-Level Architecture

```text
CLIENT01 (Windows 11)
        │
        ▼
DC01 (Active Directory Domain Controller)
        │
        ▼
SYNC01 (Microsoft Entra Connect)
        │
        ▼
Microsoft Entra ID (Azure)