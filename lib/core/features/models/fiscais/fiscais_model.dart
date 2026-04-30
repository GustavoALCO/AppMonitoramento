class FiscaisModel {
  final int userId;
  final String name;

  FiscaisModel({
    required this.userId,
    required this.name,
  });

  factory FiscaisModel.fromJson(Map<String, dynamic> json) {
    return FiscaisModel(
      userId: json['userId'],
      name: json['name'] ?? "Nome não informado",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
    };
  }
}