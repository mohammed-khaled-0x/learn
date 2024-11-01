class UserModel {
  final String userId;
  final String username;
  final String email;
  final String role;
  final bool isActive;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.role,
    required this.isActive,
  });

  // Convert UserModel to Map for Firebase or JSON
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'role': role,
      'isActive': isActive,
    };
  }

  // Create UserModel from Map (for Firebase or JSON)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? 'User',
      isActive: map['isActive'] ?? false,
    );
  }
}
