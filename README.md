# Mini Calculator 

A clean, responsive, and high-performance cross-platform mini calculator built with **Flutter and Dart** using **VS Code** and **Android Studio**. This project demonstrates fundamental mobile development concepts, including state management, modular component creation, and custom UI design.

## Features
* **Core Math Operations:** Supports addition (+), subtraction (-), multiplication (×), and division (÷).
* **Live Operator Feedback:** The screen dynamically displays the selected operation symbol immediately when clicked.
* **Component-Based Architecture:** Uses a fully modular design with extracted custom widgets (`CalcButton`).
* **Dark Theme:** Features a modern, high-contrast dark user interface out of the box.

##  Tech Stack & Workspace
* **Framework:** Flutter
* **Language:** Dart
* **IDE:** VS Code & Android Studio
* **Architecture:** Stateful Widget with custom component extraction




##  Getting Started

Follow these steps to run the calculator application locally on your machine.

### Prerequisites
Make sure you have the [Flutter SDK installed](https://flutter.dev) and configured on your PC.

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com
   cd mini_calculator
   ```

2. **Fetch dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   Ensure you have an active emulator running or a physical device connected (`flutter devices`), then run:
   ```bash
   flutter run
   ```

## Project Structure
```text
lib/
│
├── widgets/
│   └── calc_button.dart   # Extracted custom reusable button component
└── main.dart              # Core stateful logic engine and primary calculator layout
```
