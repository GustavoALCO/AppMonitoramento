import 'package:flutter_test/flutter_test.dart';
import 'package:monitoramento/core/features/models/evidencias/create_evidencias_model.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';
void main() {
  group("Validando a Conversão do JSON das Evidencias", () {
    test("Deve converter JSON para EvidenciaModel corretamente", () {
      final json = {
        "evidenciaRotaId": 1,
        "fiscalId": 2,
        "rotaId": 3,
        "temaFiscalizacao": 4,
        "alimentador": "Alimentador Teste",
        "identificacao": "Identificação Teste",
        "descricao": "Descrição Teste",
        "imageURL": "https://example.com/image.jpg",
        "horario": "2023-01-01T00:00:00.000Z",
        "endereco": "Endereço Teste",
      };

      final model = EvidenciaModel.fromJson(json);

      expect(model.evidenciaRotaId, 1);
      expect(model.fiscal, "Fiscal Teste");
      expect(model.rotaId, 3);
      expect(model.temaFiscalizacao, "Tema Fiscalização Teste");
      expect(model.alimentador, "Alimentador Teste");
      expect(model.identificacao, "Identificação Teste");
      expect(model.descricao, "Descrição Teste");
      expect(model.imageURL, "https://example.com/image.jpg");
      expect(model.endereco, "Endereço Teste");
      expect(model.horario, "2023-01-01T00:00:00.000Z");
    });

    

    // Teste para verificar se a conversão dos dados da api para o modelo de criação está correta
    test("validando conversão para a alteração do body", () {
  final json = {
    "rotaID": 3,
    "fiscalId": 2,
    "temaFiscalizacao": 4,
    "alimentador": "Alimentador Teste",
    "identificacao": "Identificação Teste",
    "descricao": "Descrição Teste",
    "base64": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII=",
    "endereco": "Endereço Teste",
    "cep": "12345-678",
    "latitude": 12.3456,
    "longitude": 78.9012,
    "horario": "2023-01-01T00:00:00.000Z", 
  };

  final model = CreateEvidenciasModel.fromJson(json);

  expect(model.rotaId, 3);
  expect(model.fiscalId, 2);
  expect(model.tema, 4);
  expect(model.alimentador, "Alimentador Teste");
  expect(model.identificacao, "Identificação Teste");
  expect(model.descricao, "Descrição Teste");
  expect(model.base64,
      "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII=");
  expect(model.endereco, "Endereço Teste");
  expect(model.cep, "12345-678");
  expect(model.latitude, 12.3456);
  expect(model.longitude, 78.9012);
  expect(model.dataHora,
      DateTime.parse("2023-01-01T00:00:00.000Z"));
});
    
});
}