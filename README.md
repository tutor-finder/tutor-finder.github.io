tutor_finder_app/
├── lib/
│ ├── main.dart # Entry point
│ ├── models/ # Data models
│ │ ├── user_model.dart
│ │ ├── tutor_model.dart
│ │ ├── session_model.dart
│ │ ├── booking_model.dart
│ │ └── review_model.dart
│ ├── services/ # Business logic
│ │ ├── auth_service.dart
│ │ ├── firestore_service.dart
│ │ ├── payment_service.dart
│ │ └── messaging_service.dart
│ ├── providers/ # State management
│ │ ├── auth_provider.dart
│ │ ├── tutor_provider.dart
│ │ └── booking_provider.dart
│ ├── screens/ # UI pages
│ │ ├── auth/
│ │ │ ├── sign_in_screen.dart
│ │ │ └── sign_up_screen.dart
│ │ ├── student/
│ │ │ ├── home_screen.dart
│ │ │ ├── search_screen.dart
│ │ │ └── bookings_screen.dart
│ │ ├── tutor/
│ │ │ ├── profile_screen.dart
│ │ │ └── sessions_screen.dart
│ │ └── shared/
│ │ ├── payment_screen.dart
│ │ └── chat_screen.dart
│ ├── widgets/ # Reusable components
│ │ ├── tutor_card.dart
│ │ ├── rating_widget.dart
│ │ └── calendar_widget.dart
│ └── utils/
│ ├── constants.dart
│ └── validators.dart
├── web/ # Web-specific config
├── test/ # Unit tests
└── pubspec.yaml # Dependencies
