# El Abd Coupon App

A Flutter mobile application designed for El Abd Foods to manage and redeem customer drink coupons using QR codes.

The application provides two user roles:

- **Customer** — Selects a free drink and displays a QR code for redemption.
- **Staff / Barista** — Scans the customer's QR code and verifies the coupon before confirming the redemption.

---

## 📱 Project Overview

The El Abd Coupon App is designed around a simple coupon redemption workflow.

A customer purchases a coupon that provides **5 free drinks**. Each time the customer wants to redeem a drink, they select their preferred drink from the application and generate a QR code.

The barista scans the QR code using the staff side of the application, reviews the coupon information, and confirms the redemption.

### Current Flow

```text
Customer
   │
   ├── Log in
   │
   ├── Select a drink
   │
   └── Generate QR Code
           │
           ▼
        Barista
           │
           ├── Scan QR Code
           │
           ├── Verify Coupon
           │
           └── Confirm Redemption
