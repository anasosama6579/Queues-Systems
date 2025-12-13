# Queue Theory - Learning Application

A comprehensive Flutter application for modeling, simulating, and visualizing queueing systems. This educational tool helps students and researchers understand queue theory concepts through interactive calculations and visualizations.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Supported Queue Models](#supported-queue-models)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [Platform Support](#platform-support)
- [Contributing](#contributing)

## 🎯 Overview

Queue Theory is a multi-platform Flutter application designed to help users learn and understand queueing systems. The app provides tools to calculate and visualize various queue metrics for both deterministic and stochastic queue models, making it an excellent educational resource for operations research, computer science, and industrial engineering students.

## ✨ Features

- **Multiple Queue Models**: Support for both deterministic and stochastic queueing systems
- **Interactive Calculations**: Real-time computation of queue metrics (waiting time, queue length, utilization, etc.)
- **Visual Charts**: Beautiful graphical representations using `fl_chart` library
- **Multiple Scenarios**: Different system configurations (with/without bulking, finite/infinite queues, single/multiple servers)
- **Cross-Platform**: Runs on Android, Windows Desktop, and Web
- **User-Friendly Interface**: Clean and intuitive Material Design UI

## 📊 Supported Queue Models

### Deterministic Systems (D/D/1/K-1)

1. **λ > μ Without Bulking**
   - Arrival rate greater than service rate
   - No customer batching

2. **λ > μ With Bulking**
   - Arrival rate greater than service rate
   - Customers arrive in batches

3. **μ > λ with Initial Customers**
   - Service rate greater than arrival rate
   - System starts with initial customers in queue

### Stochastic Systems

1. **M/M/1** - Single server, infinite queue capacity
   - Exponential inter-arrival times
   - Exponential service times
   - First-come-first-served (FCFS) discipline

2. **M/M/1/K** - Single server, finite queue capacity
   - Limited queue size (K customers)
   - Blocking when queue is full

3. **M/M/C** - Multiple servers, infinite queue capacity
   - C parallel servers
   - Shared queue

4. **M/M/C/K** - Multiple servers, finite queue capacity
   - C parallel servers
   - Limited queue size (K customers)

## 🚀 Installation

### Prerequisites

- Flutter SDK (version 3.6.1 or higher)
- Dart SDK
- Android Studio (for Android development)
- Visual Studio (for Windows desktop development)
- Chrome/Edge (for web development)

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd queue_theory
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   
   For Android:
   ```bash
   flutter run
   ```
   
   For Windows:
   ```bash
   flutter run -d windows
   ```
   
   For Web:
   ```bash
   flutter run -d chrome
   ```

## 💻 Usage

1. **Launch the application** on your preferred platform

2. **Choose System Type**
   - Select between "Deterministic System" or "Stochastic System"

3. **Select Specific Model**
   - Choose the queue model you want to analyze

4. **Input Parameters**
   - Enter required parameters:
     - **λ (lambda)**: Arrival rate
     - **μ (mu)**: Service rate
     - **K**: Queue capacity (for finite queues)
     - **C**: Number of servers (for multi-server systems)
     - **Time**: Simulation time (for deterministic systems)
     - **M**: Additional parameters as needed

5. **View Results**
   - Review calculated metrics
   - Explore interactive charts showing:
     - Customer number over time
     - Arrival patterns
     - Service patterns
     - Queue length variations

## 📁 Project Structure

```
queue_theory/
├── lib/
│   ├── charts/                    # Chart visualization widgets
│   │   ├── bulking_customer_number_chart.dart
│   │   ├── customer_arrives_chart.dart
│   │   ├── customer_number_chart.dart
│   │   └── ...
│   ├── function/                  # Calculation functions
│   │   ├── Deterministic System/
│   │   └── Stochastic System/
│   ├── models/                    # Data models
│   │   └── system_info.dart
│   ├── systems/                   # System UI screens
│   │   ├── choose_system.dart
│   │   ├── deterministic_system.dart
│   │   ├── stochastic_system.dart
│   │   ├── Deterministic System/
│   │   └── Stochastic System/
│   ├── widget/                    # Reusable UI components
│   │   ├── custom_container.dart
│   │   ├── custom_elevated_button.dart
│   │   └── custom_text_field.dart
│   └── main.dart                  # Application entry point
├── android/                       # Android platform files
├── windows/                       # Windows platform files
├── web/                          # Web platform files
├── test/                         # Unit and widget tests
└── pubspec.yaml                  # Project dependencies
```

## 🛠 Technologies Used

- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **fl_chart**: Charting library for data visualization
- **Material Design**: UI design system

## 📱 Platform Support

- ✅ **Android** - Mobile devices
- ✅ **Windows** - Desktop applications
- ✅ **Web** - Browser-based application

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute to this project:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📚 Educational Resources

This application is designed to help students understand:
- Queueing theory fundamentals
- Performance metrics (waiting time, queue length, utilization)
- Differences between deterministic and stochastic models
- Impact of system parameters on queue behavior

---

**Note**: This is a learning application designed for educational purposes in queue theory and operations research.
