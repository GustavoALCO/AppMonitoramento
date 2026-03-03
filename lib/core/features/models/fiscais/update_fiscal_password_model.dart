class UpdateFiscalPasswordModel 
{
  final int userId;
  final String newPassword;

  UpdateFiscalPasswordModel({
    required this.userId,
    required this.newPassword,
  });

  factory UpdateFiscalPasswordModel.fromJson(Map<String, dynamic> json) {
    return UpdateFiscalPasswordModel(
      userId: json['userId'],
      newPassword: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'password': newPassword,
    };
  }
}