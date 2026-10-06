# Sari Sari Store — POS

Offline-first Point of Sale for sari-sari stores. Built with Flutter.

Manage products, sell with cash or utang, track customer credit, and review sales — all on-device with optional Supabase cloud sync.

**Version 1.0.0** · Flutter 3.x · Riverpod · Drift · Supabase

---

## Features

### Point of Sale
- Product grid with images, category chips, and search
- Cart: add, remove, adjust quantities, discounts
- **Cash** — amount received + automatic change
- **Utang** — charge to a customer balance
- **Partial payment** — split cash + utang
- Optional transaction photo
- Live stock checks (blocks overselling)
- Auto invoice numbers (`INV…`)

### Inventory
- CRUD products and categories
- Product images (gallery / camera / URL)
- Low-stock alerts and dedicated low-stock tab
- Manual stock adjustments with reasons
- Barcode / SKU field
- Cost + price for profit estimates

### Utang (Customer Credit)
- Customer profiles (name, phone, address, notes)
- Running balance
- Record payments
- Per-customer history
- PDF customer statements

### Reports
- Sales totals, transaction count, items sold
- Profit estimate from product costs
- Best-selling products
- Outstanding utang + top debtors
- Periods: Today · 7 Days · This Month · This Year

### Cloud Sync (optional / premium)
- Supabase backup and multi-device access
- Auto-sync after sales
- Restore on a new device

### Settings & Data
- Store name & address (receipts / PDFs)
- Transaction photo toggle
- Local DB backup
- Product CSV export
- In-app feedback

### UI / Design System
- Material 3 theme with store-green palette
- Design tokens: radius, shadows, semantic colors
- Product cards: in-cart highlight, low-stock badge, out-of-stock overlay
- Sticky cart bar with checkout CTA + haptics
- Polished empty states and bottom navigation

---

## Tech Stack

| Layer | Choice |
|---|---|
| Framework | Flutter 3.x / Dart 3.x |
| State | Riverpod 2.x (`flutter_riverpod`, `riverpod_annotation`) |
| Local DB | Drift (SQLite) + `sqlite3_flutter_libs` |
| Navigation | `go_router` (shell) + imperative routes for sheets/forms |
| Cloud | `supabase_flutter` |
| Connectivity | `connectivity_plus` |
| Images | `image_picker`, `crop_your_image` |
| PDF | `pdf`, `printing` |
| UI helpers | `flutter_slidable`, Material 3 |

Primary target: **Android**. iOS / desktop runners are present but not the main focus.

---

## Project Structure

```
lib/
├── app/                      # Theme, router (MainShell), providers, splash, sync
├── core/
│   ├── constants/            # App constants, supabase_config.example.dart
│   ├── utils/                # Currency, dates, IDs, connectivity
│   └── widgets/              # Lazy pages, skeleton loaders
├── data/
│   ├── db/                   # Drift database, tables, DAOs
│   └── services/             # Backup, images, PDF, sync
└── features/
    ├── auth/                 # Login, account, upgrade
    ├── pos/                  # Sell screen + cart state
    ├── products/             # Catalog, categories, stock adjust
    ├── invoices/             # History + detail
    ├── utang/                # Customers + credit
    ├── reports/              # Analytics
    └── settings/             # Store settings, feedback
```

SQL schema for cloud: `supabase_schema.sql`  
Icon notes: `update_icon_instructions.md`

---

## Getting Started

### Prerequisites
- Flutter SDK **3.0+** (Dart **3.0+**)
- Android Studio or VS Code + Flutter plugins
- Android device or emulator

### Install & run

```bash
git clone https://github.com/Pastor/Sari-Sari-Store-POS-System.git
cd Sari-Sari-Store-POS-System

flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

### Optional: your own Supabase project

1. Create a project at [supabase.com](https://supabase.com)
2. Run `supabase_schema.sql` in the SQL editor
3. Copy `lib/core/constants/supabase_config.example.dart` → `supabase_config.dart`
4. Set `supabaseUrl` and `supabaseAnonKey` (Project Settings → API)

The anon key is public; access is enforced with RLS.

### Launcher icon

See `update_icon_instructions.md`. Asset path used by `flutter_launcher_icons`: `assets/images/logo.png`.

---

## Usage

### Sale
1. **Sell** → tap products into the cart  
2. Adjust qty / discount  
3. Open cart → **Cash** or **Utang**  
4. Cash: enter amount received → change is calculated  
5. Utang: pick or create a customer  
6. Optional photo → checkout → invoice created  

### Utang
1. **Utang** → customers and balances  
2. Open a customer → history, payments, PDF statement  

### Products
1. **Products** → **+**  
2. Name, price, stock, unit, category  
3. Image from gallery/camera or related sources  
4. Save  

### Reports
1. **Reports** → choose period  
2. Review sales, profit, best sellers, debtors  

---

## Database

**Tables:** `categories` · `products` · `customers` · `invoices` · `invoice_items` · `customer_payments` · `stock_movements`

**Schema version:** 6  

Migrations run automatically. First launch seeds **8 default categories** only — no sample products.

Money is stored as **integer cents** (₱). Use `formatCurrency` / `parseToCents` in `lib/core/utils/currency.dart`.

---

## Design notes

Theme entry: `lib/app/theme.dart` (`AppTheme`)

- Primary: deep store green  
- Semantic: success / warning / danger (+ soft backgrounds)  
- Tokens: `radiusSm|Md|Lg|Xl`, `shadowSm|Md|Lg|Cart`  
- POS cards and cart bar follow these tokens for consistent spacing and elevation  

---

## Roadmap

- [ ] GCash / additional payment methods  
- [ ] Expense tracking  
- [ ] Supplier management  
- [ ] Receipt printer support  
- [ ] Multi-user (cloud)  

---

## License

MIT — see [LICENSE](LICENSE).

---

## About

Built for sari-sari store owners in the Philippines.

Developer: Edwin Perez · kmezta1968@gmail.com  

**Sari Sari Store** · v1.0.0
