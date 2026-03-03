class FiscaisModel {
  final int userId;
  final String login;
  final bool isAdmin;

  FiscaisModel({
    required this.userId,
    required this.login,
    required this.isAdmin,
  });

  factory FiscaisModel.fromJson(Map<String, dynamic> json) {
    return FiscaisModel(
      userId: json['userId'],
      login: json['login'] ?? "Login não informado",
      isAdmin: json['isAdmin'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'login': login,
      'isAdmin': isAdmin,
    };
  }
}