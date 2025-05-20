# 🏠 SystemPro – Real Estate App

A modern and feature-rich **Flutter** application designed for the real estate market.  
Easily scalable, responsive, and built with clean architecture principles.

[![forthebadge](https://forthebadge.com/images/badges/made-with-flutter.svg)](https://flutter.dev/)

---

## 🚀 Features

- 🌓 **Theming** – Supports both Light & Dark modes for a customizable user experience.
- 🌍 **Localization** – Multi-language support for broader reach.
- ❤️ **Favorites** – Users can save and manage their favorite listings.
- 🔍 **Advanced Filters** – Filter properties by category, price, location, and amenities.
- 🔁 **Pagination & Caching** – Smooth infinite scroll with offline-first support.
- 🔐 **Secure Environment Config** – Using `.env` file to manage API keys and secrets.
- 📦 **Firebase App Distribution** – Seamless app deployment and testing.
- ⚙️ **CI/CD** – Automated builds using **Fastlane** and **GitHub Actions**.

---

## 🛠️ Tech Stack

| Layer | Tools |
|-------|-------|
| **Language** | ![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white) |
| **Framework** | ![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white) |
| **State Management** | Bloc / Cubit |
| **Networking** | Dio + Retrofit |
| **Design** | ![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white) |
| **Version Control** | ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) |
| **CI/CD** | Firebase App Distribution, Fastlane, GitHub Actions |

---

## 📂 Folder Structure

![Folder Structure](https://chat.openai.com/cdn-cgi/imagedelivery/Xw4zI-yyME3w8e1j0dnH3A/file_000000004df461f88e49fb34cf7fdcb0/public)

## 📁 Folder Structure

The project follows a **modular and clean architecture** pattern. Below is a GitHub-friendly visual structure:

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


📧 Contact
For questions, feedback, or contributions:

Email: <hussein.mohmed1907@gmail.com>

GitHub: SystemPro Repository

📄 License
This project is open-source and available under the MIT License.
