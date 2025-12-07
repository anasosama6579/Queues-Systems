# Queues-Systems

A multi-platform project (Android / Web / Desktop) for modeling and simulating queueing systems.

## Project Overview

Queues-Systems is a comprehensive project that aims to implement and simulate queueing systems across different platforms — Android, Desktop (Windows), and Web. It can be used as a tool for studying queueing theory, testing different queue configurations, or integrating queue behavior into applications.

## Project Structure
Queues-Systems/
  ├── android/          
  ├── web/              
  ├── windows/         
  ├── lib/           
  ├── test/          
  ├── .gitignore  
  ├── pubspec.yaml       
  └── README.md       

## Features

- Implementation of core queueing logic in a shared library (`lib/`)  
- Platform-specific frontends / wrappers:  
  - Android app  
  - Windows desktop build  
  - Web frontend  
- Configurable queue parameters (e.g. arrival rate, service rate, queue discipline)  
- Support for simulation and analysis queue management  

## Supported Platforms

- Android (mobile)  
- Windows (desktop)  
- Web (browser)  

## Getting Started

### Prerequisites / Requirements

-  Dart and Flutter environment (depending on which platform you build)  
- For Android: Android SDK / NDK + Android Studio (or equivalent)  
- For Web: a capable web server or static hosting (if using a web frontend)  

