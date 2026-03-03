class CreateFiscaisModel {
final String login;
final String nome;
final String lastname;
final String senha;
final bool isAdmin;

CreateFiscaisModel({
  required this.login,
  required this.nome,
  required this.lastname,
  required this.senha,
  required this.isAdmin,
});

factory CreateFiscaisModel.fromJson(Map<String, dynamic> json) {
  return CreateFiscaisModel(
    login: json['login'] ?? "Login não informado",
    nome: json['nome'] ?? "Nome não informado",
    lastname: json['lastname'] ?? "Sobrenome não informado",
    senha: json['senha'] ?? "Senha não informada",
    isAdmin: json['isAdmin'] ?? false,
  );
}

Map<String, dynamic> toJson() {
  return {
    'login': login,
    'nome': nome,
    'sobreNome': lastname,
    'senha': senha,
    'isAdmin': isAdmin,
  };
}
}