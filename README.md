# 📚 ITI Learning Platform  

An **educational Flutter application** built by our team to streamline learning for **Students, Admins, and Super Admins**. The app provides AI-powered study assistance, track-based courses, resource management, and role-based dashboards for seamless interaction.  

---

## 🚀 Features  

### 👨‍🎓 Student  
- Authentication (Login, Register, Forgot Password, Reset Password).  
- Personalized dashboard with:  
  - **Tracks & Courses** (Flutter, Data Analysis, Cybersecurity, etc.).  
  - **Questions & Answers** with AI-powered responses (Gemini AI).  
  - **Resources Section** for documents, guides, and references.  
  - **Starred Questions** to bookmark important Q&A.  
  - **Profile Management & Settings**.  
- Multilingual support (**English & Arabic**).  
- Light/Dark theme toggle.  

### 👨‍💻 Admin  
- Role-based access to an **Admin Panel**.  
- Create, send, and manage **Notifications**.  
- Manage user settings and logout functionality.  

### 🏛️ Super Admin  
- Full **Dashboard** to manage platform activity.  
- Add and manage **Tracks, Resources, and Items**.  
- Monitor system performance with quick actions.  

---
## 🛠️ Tech Stack  

- **Framework**: Flutter (Dart)  
- **State Management**: BLoC / Cubit  
- **Backend**: Firebase  
- **AI Integration**: Gemini API  
- **Persistence**: Shared Preferences (Cache Helper)  
- **Localization**: Flutter Intl (EN/AR)  
- **Theme Management**: Custom Light/Dark themes  
- **Navigation**: Custom Page Route Transitions  

---

## 🏗️ Project Architecture  

The project follows **Clean Architecture + MVVM + BLoC** for scalability and maintainability.  
```
├── 📁 core
│   ├── 📁 bloc_observer
│   ├── 📁 config
│   ├── 📁 functions
│   │   ├── 📁 navigations
│   │   ├── 📁 network
│   │   ├── 📁 transitions
│   │   └── 📁 validation
│   ├── 📁 helper
│   │   ├── 📁 cashe_helper
│   │   └── 📁 services
│   ├── 📁 routing
│   ├── 📁 theme
│   ├── 📁 utilities
│   └── 📁 widgets
├── 📁 generated
│   └── 📁 intl
├── 📁 l10n
├── 📁 user
│   ├── 📁 admin
│   │   └── 📁 features
│   │       └── 📁 admin_panel
│   │           ├── 📁 data
│   │           │   ├── 📁 admin_repo
│   │           │   └── 📁 models
│   │           └── 📁 presentation
│   │               ├── 📁 controller
│   │               │   ├── 📁 admin_cubit
│   │               ├── 📁 pages
│   │               └── 📁 widgets
│   ├── 📁 student
│   │   └── 📁 features
│   │       ├── 📁 Auth
│   │       │   ├── 📁 data
│   │       │   ├── 📁 helper
│   │       │   └── 📁 presentation
│   │       │       ├── 📁 manager
│   │       │       │   ├── 📁 login_cubit
│   │       │       │   └── 📁 register_cubit
│   │       │       ├── 📁 views
│   │       │       └── 📁 widgets
│   │       ├── 📁 forget_password
│   │       │   └── 📁 presentation
│   │       │       ├── 📁 pages
│   │       │       └── 📁 widgets
│   │       ├── 📁 home
│   │       │   ├── 📁 data
│   │       │   │   ├── 📁 functions
│   │       │   │   ├── 📁 models
│   │       │   │   └── 📁 repositories
│   │       │   └── 📁 presentation
│   │       │       ├── 📁 manager
│   │       │       │   ├── 📁 chat_ai
│   │       │       │   ├── 📁 localization
│   │       │       │   ├── 📁 starred_questions
│   │       │       │   └── 📁 theme
│   │       │       └── 📁 views
│   │       │           └── 📁 widgets
│   │       ├── 📁 onboarding
│   │       │   ├── 📁 data
│   │       │   └── 📁 presentation
│   │       │       ├── 📁 views
│   │       │       └── 📁 widgets
│   │       └── 📁 splash_view
│   │           ├── 📁 widgets
│   └── 📁 super_admin
│       └── 📁 features
│           ├── 📁 add_item
│           │   ├── 📁 data
│           │   │   ├── 📁 add_item_repo
│           │   │   └── 📁 models
│           │   └── 📁 presentation
│           │       ├── 📁 controller
│           │       │   └── 📁 add_item_cubit
│           │       ├── 📁 views
│           │       └── 📁 widgets
│           ├── 📁 add_resource
│           │   ├── 📁 data
│           │   │   ├── 📁 models
│           │   └── 📁 presentation
│           │       └── 📁 controller
│           │           ├── 📁 resource_cubit
│           │           └── 📁 views
│           │               └── 📁 widgets
│           └── 📁 dashboard
│               ├── 📁 data
│               └── 📁 presentation
│                   ├── 📁 views
│                   └── 📁 widgets
├── 🔵 firebase_options.dart
└── 🔵 main.dart

```
---
## 📱 Screenshots

> ⏳ *Coming Soon*

---

## 👥 Authors

- **Mahmoud Elnagar** - *Initial work* - [GitHub](https://github.com/Mahmoudelnagar5/)
- **Youssef Mahmoud** - *Initial work* - [GitHub](https://github.com/Youssef-Ma7moud-Eid)
- **Moaz Ayman** - *Initial work* - [GitHub](https://github.com/moaz-abdeltawab92)
- **Youssef Ahmed** - *Initial work* - [GitHub](https://github.com/yousefa7med)


## ⚙️ Getting Started  

### Prerequisites  
- Flutter SDK installed  
- Firebase project configured  
- Dart >= 3.0  

### Installation  
```bash
# Clone the repository
git clone https://github.com/your-repo.git  

# Navigate to project
cd iti_learning_platform  

# Install dependencies
flutter pub get  

# Run the app
flutter run


