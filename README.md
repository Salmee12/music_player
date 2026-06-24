# 🎵 Music Player App

A full-stack music streaming application built with Flutter and FastAPI.  
The app provides a modern music playback experience with user authentication, persistent sessions, secure password handling, and cloud-based media storage.

## 📱 Features

### 🔐 Authentication & Security
- User registration and login
- Persistent authentication sessions
- Secure password hashing
- Protected user data
- Token-based authentication

### 🎶 Music Features
- Browse available songs
- Stream music from cloud storage
- Music player controls
- Play / Pause / Seek functionality
- Song information display
- User-based music experience

### ☁️ Cloud & Backend
- FastAPI backend architecture
- REST API communication
- CDN-based music storage
- Efficient media delivery
- Backend-managed user and music data

## 🏗️ Tech Stack

### Frontend
- Flutter
- Dart
- Material UI
- State Management

### Backend
- FastAPI (Python)
- REST APIs
- Authentication system

### Storage
- CDN-based audio storage
- Cloud media delivery

### Security
- Password hashing
- Secure authentication flow

## 📂 Project Architecture

```
Music Player App

├── Flutter Application
│   ├── UI Components
│   ├── Authentication Screens
│   ├── Music Player
│   ├── API Services
│   └── State Management
│
└── FastAPI Backend
    ├── Authentication
    ├── User Management
    ├── Music APIs
    └── Database Integration
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Python 3.x
- FastAPI environment setup

### Frontend Setup

Clone the repository:

```bash
git clone <repository-url>
```

Navigate to the Flutter project:

```bash
cd music_player
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

### Backend Setup

Navigate to backend:

```bash
cd backend
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Start FastAPI server:

```bash
uvicorn main:app --reload
```

## 🔄 Application Flow

1. User creates an account
2. Password is securely hashed before storage
3. User logs in through the Flutter application
4. Authentication session is persisted
5. Music data is fetched from the FastAPI backend
6. Audio files are delivered through CDN storage
7. User can stream and control music playback

## 🎯 Goals of the Project

This project was built to demonstrate:

- Full-stack mobile application development
- Flutter application architecture
- Backend API integration
- Secure authentication implementation
- Cloud media handling
- Real-world app development practices

## 📸 Screenshots

(Add screenshots here)

## 🔮 Future Improvements

- Playlist creation
- Music recommendations
- Offline downloads
- Social sharing
- Background playback
- Push notifications

## 👨‍💻 Author

Your Name

GitHub: Your GitHub Profile
