class CreateFiscalModel {
  final String name;
  final String sobrenome;
  final String senha;
  final bool isAdmin;

  CreateFiscalModel({
    required this.name,
    required this.sobrenome,
    required this.senha,
    required this.isAdmin
  });

  factory CreateFiscalModel.fromJson(Map<String, dynamic> json) {
    return CreateFiscalModel(
      name: json['name'],
      sobrenome: json['sobrenome'],
      senha: json['senha'],
      isAdmin: json['isAdmin']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'sobrenome': sobrenome,
      'senha': senha,
      'isAdmin': isAdmin
    };
  }
}