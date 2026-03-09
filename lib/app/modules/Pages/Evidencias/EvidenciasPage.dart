import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monitoramento/app/shared/enums/enumEvidenciaMode.dart';
import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ButtonDeploy.dart';
import 'package:monitoramento/app/shared/widgets/InputComponent.dart';
import 'package:monitoramento/app/shared/widgets/SelectBoxComponent.dart';
import 'package:monitoramento/core/features/data/evidencias/evidencias_service.dart';
import 'package:monitoramento/core/features/models/evidencias/create_evidencias_model.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';
import 'package:monitoramento/core/features/models/evidencias/update_evidencias_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/services/geo_service.dart';
import 'package:monitoramento/core/services/image_service.dart';
import 'package:monitoramento/core/services/internet_service.dart';
import 'package:monitoramento/core/services/token_service.dart';

class EvidenciasPage extends StatefulWidget {
  final EvidenciaMode mode;
  final int rotaId;
  final EvidenciaModel? model;

  const EvidenciasPage({
    super.key,
    required this.mode,
    required this.rotaId,
    this.model,
  });

  @override
  State<EvidenciasPage> createState() => _EvidenciasPageState();
}

class _EvidenciasPageState extends State<EvidenciasPage> {
  late EvidenciasService _service;
  late TokenService _tokenService;
  late ImageService _imageService;
  late GeoService _geoService;
  late InternetService _internetService;

  final enderecoController = TextEditingController();
  final cepController = TextEditingController();
  final alimentadorController = TextEditingController();
  final identificadorController = TextEditingController();
  final descricaoController = TextEditingController();

  String? imageUrl;
  XFile? pickedFile;
  Position? geo;

  late TipoConstatacao tipoConstatacao;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    tipoConstatacao = TipoConstatacao.values.first;
    _tokenService = TokenService();
    _imageService = ImageService();
    _geoService = GeoService();
    _internetService = InternetService();
    _service = EvidenciasService(ApiClient());

    if (widget.mode == EvidenciaMode.alterar && widget.model != null) {
      final model = widget.model!;

      enderecoController.text = model.endereco;
      alimentadorController.text = model.alimentador ?? "";
      identificadorController.text = model.identificacao ?? "";
      descricaoController.text = model.descricao ?? "";

      tipoConstatacao = model.temaFiscalizacao;
      imageUrl = model.imageURL;
    }
  }

  @override
  void dispose() {
    enderecoController.dispose();
    cepController.dispose();
    alimentadorController.dispose();
    identificadorController.dispose();
    descricaoController.dispose();
    super.dispose();
  }

  void _retornarComAtualizacao(bool sucesso) {
    if (sucesso) {
      Navigator.pop(context,  sucesso );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.mode == EvidenciaMode.criar
                ? "Erro ao enviar evidência"
                : "Erro ao atualizar evidência",
          ),
        ),
      );
    }
  }

  Future<bool> _atualizarEvidencia() async {
    final updateModel = UpdateEvidenciasModel(
      id: widget.model!.evidenciaRotaId,
      descricao: descricaoController.text,
      tema: tipoConstatacao.index,
      identificacao: identificadorController.text,
      endereco: enderecoController.text,
      alimentador: alimentadorController.text,
    );

    return await _service.patch(updateModel);
  }

  Future<bool> _criarEvidencia() async {
    if (geo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Localização não disponível")),
      );
      return false;
    }

    final createModel = CreateEvidenciasModel(
      rotaId: widget.rotaId,
      fiscalId: await _tokenService.getIdPayload() ?? 0,
      descricao: descricaoController.text,
      dataHora: DateTime.now(),
      tema: tipoConstatacao.index,
      identificacao: identificadorController.text,
      endereco: enderecoController.text,
      cep: cepController.text,
      latitude: geo!.latitude,
      longitude: geo!.longitude,
      alimentador: alimentadorController.text,
      base64: pickedFile != null
          ? await _imageService.convertImageBase64(pickedFile!)
          : "",
    );

    return await _service.post(createModel);
  }

  Future<void> _salvarEvidencia() async {
    setState(() => isLoading = true);

    try {
      bool sucesso;

      if (widget.mode == EvidenciaMode.criar) {
        sucesso = await _criarEvidencia();
      } else {
        sucesso = await _atualizarEvidencia();
      }

      if (!mounted) return;

      _retornarComAtualizacao(sucesso);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erro: ao enviar")));
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> _tirarFoto() async {
    final XFile? file = await _imageService.selectCamera();

    if (file == null) return;

    setState(() {
      pickedFile = file;
      imageUrl = file.path;
    });

    try {
      await _pegarEndereco();
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Erro ao pegar endereço.\n$e",
          ),
        ),
      );
    }
  }

  Future<void> _pegarEndereco() async {
    setState(() => isLoading = true);

    try {
      geo = await _geoService.takeGeolocation();
      
      Map<String, String?> adress = {"endereco": null, "cep": null};

      if (await _internetService.temInternet()) {
        adress = await _geoService.TakeAdress(geo!.latitude, geo!.longitude);
      }

      enderecoController.text = adress["endereco"] ?? "";
      cepController.text = adress["cep"] ?? "";
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  void _openImageDialog(Widget imageWidget) {
    showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              InteractiveViewer(
                minScale: 1,
                maxScale: 5,
                child: Center(child: imageWidget),
              ),

              /// Botão fechar
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImage() {
    if (pickedFile != null) {
      return GestureDetector(
        onTap: () {
          _openImageDialog(
            Image.file(File(pickedFile!.path), fit: BoxFit.contain),
          );
        },
        child: Image.file(File(pickedFile!.path), fit: BoxFit.cover),
      );
    }

    if (widget.mode == EvidenciaMode.alterar &&
        imageUrl != null &&
        imageUrl!.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          _openImageDialog(Image.network(imageUrl!, fit: BoxFit.contain));
        },
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.broken_image, size: 60, color: Colors.grey),
            );
          },
        ),
      );
    }

    //Icon padrão se não possuir imagem
    return Container(
      color: Colors.grey.shade200,
      child: const Center(
        child: Icon(Icons.camera_alt, size: 80, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        widget.mode == EvidenciaMode.criar
            ? "Criar Nova Evidência"
            : "Alterar Evidência",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),

            Buttondeploy(
              text: "Tirar Foto",
              select: true,
              iconEnabled: true,
              onPressed: widget.mode == EvidenciaMode.alterar
                  ? null
                  : _tirarFoto,
            ),

            const SizedBox(height: 16),

            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              clipBehavior: Clip.hardEdge,
              child: _buildImage(),
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

            InputComponent(label: "CEP", controller: cepController),

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
              label: "Observações da Evidência",
              controller: descricaoController,
            ),

            const SizedBox(height: 24),

            Buttondeploy(
              iconEnabled: false,
              text: widget.mode == EvidenciaMode.criar
                  ? "Enviar Evidência"
                  : "Atualizar Evidência",
              select: true,
              onPressed: isLoading ? null : _salvarEvidencia,
            ),

            const SizedBox(height: 16),

            Buttondeploy(
              iconEnabled: false,
              text: "Cancelar",
              select: false,
              onPressed: () => Navigator.pop(context, false),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
