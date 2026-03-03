class LoginFiscalModel 
{
  final String login;
  final String senha;

  LoginFiscalModel({
    required this.login,
    required this.senha   ,
  });

  factory LoginFiscalModel.fromJson(Map<String, dynamic> json) {
    return LoginFiscalModel(
      login: json['login'],
      senha: json['senha'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'senha': senha,
    };
  }
}