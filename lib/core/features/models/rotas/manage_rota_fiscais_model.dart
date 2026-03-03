class ManageRotaFiscaisModel {
  final int id;
  final List<int> fiscais;

  ManageRotaFiscaisModel({
    required this.id,
    required this.fiscais,
  });

  Map<String, dynamic> toJson() {
    return {
      'rotaId': id,
      'fiscais': fiscais,
    };
  }
}