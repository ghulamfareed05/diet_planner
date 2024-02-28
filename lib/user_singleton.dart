


class UserDataSingleton {
  // Private constructor
  UserDataSingleton._();

  // Static instance of the class
  static final UserDataSingleton _instance = UserDataSingleton._();

  // Factory constructor to return the instance
  factory UserDataSingleton() {
    return _instance;
  }

  // Properties
  String? fullName;
  String? phoneNumber;
  String? category;
  String? imageUrl;

// Add any other properties or methods you need for user data here
}