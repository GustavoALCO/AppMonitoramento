// ignore_for_file: unnecessary_underscores

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import 'package:monitoramento/app/shared/dto/evidenciaDto.dart';
import 'package:monitoramento/app/shared/enums/enumEvidenciaMode.dart';
import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';

import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ButtonDeploy.dart';
import 'package:monitoramento/app/shared/widgets/InputComponent.dart';
import 'package:monitoramento/app/shared/widgets/SelectBoxComponent.dart';

import 'package:monitoramento/core/services/bd_evidencias_service.dart';
import 'package:monitoramento/core/services/geo_service.dart';
import 'package:monitoramento/core/services/image_service.dart';
import 'package:monitoramento/core/services/internet_service.dart';
import 'package:monitoramento/core/services/token_service.dart';

class EvidenciasPage extends StatefulWidget {
  final EvidenciaMode mode;
  final int rotaId;
  final EvidenciaCardDto? model;

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
  late TokenService _tokenService;
  late ImageService _imageService;
  late GeoService _geoService;
  late InternetService _internetService;
  late BdEvidenciasService _bdEvidenciasService;

  final enderecoController = TextEditingController();
  final alimentadorController = TextEditingController();
  final identificadorController = TextEditingController();
  final descricaoController = TextEditingController();

  Position? geo;

  late TipoConstatacao tipoConstatacao;

  bool isLoading = false;

  // LISTA DE IMAGENS
  List<String> pathImages = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    tipoConstatacao = TipoConstatacao.values.first;

    _tokenService = TokenService();
    _imageService = ImageService();
    _geoService = GeoService();
    _internetService = InternetService();
    _bdEvidenciasService = BdEvidenciasService();

    if (widget.mode == EvidenciaMode.alterar && widget.model != null) {
      final model = widget.model!;

      enderecoController.text = model.endereco;
      alimentadorController.text = model.alimentador ?? "";
      identificadorController.text = model.identificacao ?? "";
      descricaoController.text = model.descricao ?? "";

      tipoConstatacao = model.tema;

      if (model.status.index == StatusMode.local.index) {
        pathImages = List.from(model.originalImage as Iterable<dynamic>);
      } else {
        //Se
        pathImages = model.mediumImage!;
      }
    }
  }

  @override
  void dispose() {
    enderecoController.dispose();
    alimentadorController.dispose();
    identificadorController.dispose();
    descricaoController.dispose();
    super.dispose();
  }

  // TIRAR FOTO
  Future<void> _tirarFoto() async {
    if (pathImages.length >= 3) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Máximo de 3 imagens")));
      return;
    }

    final XFile? file = await _imageService.selectCamera();

    if (file == null) return;

    try {
      await _pegarEndereco();

      final path = await _imageService.salvarImagemLocal(file);

      setState(() {
        pathImages.add(path);
      });
    } catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(const SnackBar(content: Text("Erro ao salvar imagem")));
    }
  }

  // PEGA GEOLOCALIZAÇÃO
  Future<void> _pegarEndereco() async {
    geo = await _geoService.takeGeolocation();

    if (await _internetService.temInternet()) {
      final adress = await _geoService.TakeAdress(
        geo!.latitude,
        geo!.longitude,
      );

      enderecoController.text = adress["endereco"] ?? "";
    }
  }

  // SALVAR EVIDENCIA
  Future<void> _salvarEvidencia() async {
    if (pathImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("É Necessario Adicionar 1 Fotos")),
      );
      return;
    }

    if (enderecoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("É Necessario Passar o Endereço")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      if (widget.mode.index == EvidenciaMode.criar.index) {
        await _bdEvidenciasService.criarEvidencia(
          widget.rotaId,
          await _tokenService.getIdPayload() ?? 0,
          pathImages,
          geo!.latitude,
          geo!.longitude,
          enderecoController.text,
          descricaoController.text,
          alimentadorController.text,
          identificadorController.text,
          tipoConstatacao,
        );
      } else {
        await _bdEvidenciasService.alterarEvidencia(
          widget.model!.idEvi,
          descricaoController.text,
          enderecoController.text,
          identificadorController.text,
          alimentadorController.text,
        );
      }

      if (!mounted) return;

      Navigator.popAndPushNamed(context, "/revisao", arguments: widget.rotaId);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Erro ao salvar evidência")));
    } finally {
      setState(() => isLoading = false);
    }
  }

  // LAYOUT DAS IMAGENS
  Widget _buildImages() {
    if (pathImages.isEmpty) {
      return Container(
        color: Colors.grey.shade200,
        child: const Center(
          child: Icon(Icons.camera_alt, size: 80, color: Colors.grey),
        ),
      );
    }

    if (pathImages.length == 1) {
      return _imageBox(pathImages[0]);
    }

    return Row(
      children: [
        Expanded(flex: 2, child: _imageBox(pathImages[0])),
        const SizedBox(width: 6),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              if (pathImages.length >= 2)
                Expanded(child: _imageBox(pathImages[1])),
              if (pathImages.length >= 3) const SizedBox(height: 6),
              if (pathImages.length >= 3)
                Expanded(child: _imageBox(pathImages[2])),
            ],
          ),
        ),
      ],
    );
  }

  Widget _imageBox(String path) {
    final bool isNetwork = path.startsWith("http");

    return GestureDetector(
      onTap: () => _openImageDialog(path),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: isNetwork
            ? Image.network(
                path,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (_, __, ___) =>
                    const Center(child: Icon(Icons.image_not_supported)),
              )
            : Image.file(
                File(path),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
      ),
    );
  }

  // DIALOG COM ZOOM
  void _openImageDialog(String path) {
    final bool isNetwork = path.startsWith("http");

    showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              InteractiveViewer(
                minScale: 1,
                maxScale: 5,
                child: Center(
                  child: isNetwork
                      ? Image.network(path)
                      : Image.file(File(path)),
                ),
              ),
              Positioned(
                top: 30,
                right: 30,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent("Criar Nova Evidência", false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Buttondeploy(
              text: "Tirar Foto",
              select: true,
              iconEnabled: true,
              onPressed: widget.mode.index == EvidenciaMode.alterar.index ? null : _tirarFoto,
            ),

            const SizedBox(height: 16),

            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(blurRadius: 4, offset: Offset(0, 1)),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: _buildImages(),
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

            InputComponent(label: "Endereço", controller: enderecoController),

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
              label: "Observações",
              controller: descricaoController,
            ),

            const SizedBox(height: 24),

            Buttondeploy(
              iconEnabled: false,
              text: widget.mode.index == EvidenciaMode.alterar.index ? "Alterar Evidências" : "Enviar Evidências",
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
          ],
        ),
      ),
    );
  }
}
