# 🏠 SystemPro – Real Estate App

A modern and feature-rich **Flutter** application designed for the real estate market.  
Easily scalable, responsive, and built with clean architecture principles.

[![Made with Flutter](https://forthebadge.com/images/badges/made-with-flutter.svg)](https://flutter.dev/)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/HusseinMohamed99/SystemPro/flutter.yml?style=flat-square)
![GitHub Last Commit](https://img.shields.io/github/last-commit/HusseinMohamed99/SystemPro?style=flat-square)

---

## 🚀 Features

- 🌓 **Theming** – Supports both Light & Dark modes
- 🌍 **Localization** – Multi-language (e.g. Arabic 🇸🇦, English 🇺🇸)
- ❤️ **Favorites** – Save and manage favorite listings
- 🔍 **Advanced Filters** – Filter by category, price, location, and amenities
- 🔁 **Pagination & Caching** – Infinite scroll with offline support
- 🔐 **Secure Environment** – Uses `.env` for secrets & keys
- 📦 **Firebase App Distribution** – Easy testing and releases
- ⚙️ **CI/CD** – Automated builds with **Fastlane** & **GitHub Actions**

---

## 🛠️ Tech Stack

| Layer              | Tools |
|-------------------|-------|
| **Language**       | ![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white) |
| **Framework**      | ![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white) |
| **State Management** | Bloc / Cubit |
| **Networking**     | Dio + Retrofit |
| **Design**         | ![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white) |
| **CI/CD**          | Firebase App Distribution, Fastlane, GitHub Actions |
| **Version Control**| ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) |

---

## 📁 Folder Structure

```text
lib/
├── core/                     # App-wide utilities, constants, theming, extensions
│   ├── helpers/              # Common helper functions (e.g., time, formatting)
│   ├── theming/              # App colors, text styles, dimensions
│   ├── routing/              # Route names and navigation helpers
│   └── widgets/              # Reusable shared widgets (e.g., buttons, images, loaders)
│
├── features/                 # Feature-based module organization
│   ├── Home/
│   │   ├── data/             # Models, DTOs, API-related logic
│   │   ├── logic/            # Cubit or BLoC + state files
│   │   └── ui/               # Screens and widgets for Home
│   ├── Search/
│   ├── Favorites/
│   └── ...                   # Add more features as needed
│
├── main.dart                 # App entry point
```

---

## 🧰 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/HusseinMohamed99/SystemPro.git
cd systempro
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Setup environment variables

```bash
cp .env.example .env
# ثم قم بإضافة المفاتيح المطلوبة (API, Firebase وغيرها)
```

### 4. Run the app

```bash
flutter run
```

---

## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.  
Please read our [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## 📬 Contact

- Email: [hussein.mohmed1907@gmail.com](mailto:hussein.mohmed1907@gmail.com)  
- GitHub: [SystemPro Repository](https://github.com/HusseinMohamed99/SystemPro)

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

**SystemPro** © 2025 — Built with ❤️ in Flutter
