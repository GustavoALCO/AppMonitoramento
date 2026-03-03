class UpdateFiscaisModel 
{
  final String userId;
  final String? login;
  final String? nome;
  final String? sobreNome;
  final bool? isAdmin;

  UpdateFiscaisModel({
    required this.userId,
    this.login,
    this.nome,
    this.sobreNome,
    this.isAdmin,
  });


  factory UpdateFiscaisModel.fromJson(Map<String, dynamic> json) {
    return UpdateFiscaisModel(
      userId: json['userId'],
      login: json['login'],
      nome: json['nome'],
      sobreNome: json['sobreNome'],
      isAdmin: json['isAdmin'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      if (login != null) 'login': login,
      if (nome != null) 'nome': nome,
      if (sobreNome != null) 'sobreNome': sobreNome,
      if (isAdmin != null) 'isAdmin': isAdmin,
    };
  }
}