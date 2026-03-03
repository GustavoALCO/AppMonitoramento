import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Revisao/RevisaoPage.dart';
import 'package:monitoramento/app/shared/enums/enumEvidenciaMode.dart';
import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ButtonDeploy.dart';
import 'package:monitoramento/app/shared/widgets/InputComponent.dart';
import 'package:monitoramento/app/shared/widgets/SelectBoxComponent.dart';
import 'package:monitoramento/core/features/data/evidencias/evidencias_service.dart';
import 'package:monitoramento/core/features/models/evidencias/create_evidencias_model.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/services/token_service.dart';

class EvidenciasPage extends StatefulWidget {
  final EvidenciaMode mode;
  final int id;
  final EvidenciaModel? model;

  const EvidenciasPage({
    super.key,
    required this.mode,
    required this.id,
    this.model,
  });

  @override
  State<EvidenciasPage> createState() => _EvidenciasPageState();
}

class _EvidenciasPageState extends State<EvidenciasPage> {
  late EvidenciasService _service;
  late TokenService _tokenService;

  final enderecoController = TextEditingController();
  final alimentadorController = TextEditingController();
  final identificadorController = TextEditingController();
  final descricaoEvidenciaController = TextEditingController();

  String? imageUrl;
  late TipoConstatacao tipoConstatacao;

  bool possuiImagem = false;
  bool enviarSelecionado = true;
  bool finalizarSelecionado = false;

  @override
  void initState() {
    super.initState();

    tipoConstatacao = TipoConstatacao.values.first;

    _tokenService = TokenService();
    _service = EvidenciasService(ApiClient());

    if (widget.mode == EvidenciaMode.alterar && widget.model != null) {
      final model = widget.model!;

      enderecoController.text = model.endereco;
      alimentadorController.text = model.alimentador ?? "";
      identificadorController.text = model.identificacao ?? "";
      descricaoEvidenciaController.text = model.descricao ?? "";

      tipoConstatacao = model.temaFiscalizacao;

      possuiImagem = model.imageURL.isNotEmpty;
      imageUrl = model.imageURL;
    }
  }

  @override
  void dispose() {
    enderecoController.dispose();
    alimentadorController.dispose();
    identificadorController.dispose();
    descricaoEvidenciaController.dispose();
    super.dispose();
  }

  Future<void> _criarEvidencia() async {
    final upEvi = CreateEvidenciasModel(
      rotaId: widget.id,
      fiscalId: await _tokenService.getIdPayload() ?? 0,
      descricao: descricaoEvidenciaController.text,
      dataHora: DateTime.now(),
      tema: tipoConstatacao.index,
      identificacao: identificadorController.text,
      endereco: enderecoController.text,
      cep: "00000-000",
      latitude: -87,
      longitude: -98,
      alimentador: alimentadorController.text,
      base64:
          "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII=",
    );

    try {
      final statusCode = await _service.post(upEvi);

      if (statusCode == true) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Revisaopage(id: widget.id)),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Erro ao Enviar a evidência")),
        );
      }
    } catch (ex) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao Enviar a evidência: $ex")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        widget.mode == EvidenciaMode.criar
            ? "Criar Nova Evidencia"
            : "Alterar Evidencia",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),

              /// BOTÃO FOTO
              Buttondeploy(
                text: "Tirar Foto",
                select: true,
                iconEnabled: true,
                onPressed: (widget.model?.imageURL.isNotEmpty ?? false)
                    ? null
                    : () {
                        setState(() {
                          possuiImagem = true;
                        });
                      },
              ),

              const SizedBox(height: 16),

              /// IMAGEM
              GestureDetector(
                onTap: possuiImagem && imageUrl != null
                    ? () {
                        showDialog(
                          context: context,
                          builder: (_) => Dialog(
                            backgroundColor: Colors.transparent,
                            child: InteractiveViewer(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: _buildImage(),
                              ),
                            ),
                          ),
                        );
                      }
                    : null,
                child: Container(
                  height: 400,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: _buildImage(),
                ),
              ),

              const SizedBox(height: 24),

              Selectboxcomponent<TipoConstatacao>(
                label: "Tipo de Constatação",
                value: tipoConstatacao,
                values: TipoConstatacao.values,
                labelBuilder: (value) => value.name,
                onChanged: (value) {
                  setState(() {
                    tipoConstatacao = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              InputComponent(
                label: "Endereço Atual",
                controller: enderecoController,
              ),

              const SizedBox(height: 16),

              InputComponent(
                label: "Alimentador",
                controller: alimentadorController,
              ),

              const SizedBox(height: 16),

              InputComponent(
                label: "Identificador",
                controller: identificadorController,
              ),

              const SizedBox(height: 16),

              InputComponent(
                label: "Descrição da Evidência",
                controller: descricaoEvidenciaController,
              ),

              const SizedBox(height: 24),

              Buttondeploy(
                iconEnabled: false,
                text: "Enviar Evidência",
                select: enviarSelecionado,
                onPressed: _criarEvidencia,
              ),

              const SizedBox(height: 16),

              Buttondeploy(
                iconEnabled: false,
                text: "Cancelar Evidencia",
                select: finalizarSelecionado,
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 Widget de imagem com fallback
  Widget _buildImage() {
    if (!possuiImagem) {
      return Container(
        color: Colors.grey.shade200,
        child: Center(
          child: Text(
            "Esperando foto...",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        color: Colors.grey.shade200,
        child: const Center(
          child: Icon(
            Icons.image_not_supported,
            size: 60,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Image.network(
      imageUrl!,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey.shade200,
          child: const Center(
            child: Icon(
              Icons.broken_image,
              size: 60,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}