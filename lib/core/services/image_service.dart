import 'dart:convert';
import 'dart:io';

import 'package:gal/gal.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> selectCamera() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
      );

      return pickedFile;
    } catch (e) {
      return null;
    }
  }

  Future<String> salvarImagemLocal(XFile file) async {
    // Diretório privado do app
    final directory =
        await getApplicationDocumentsDirectory();

    final nomeArquivo =
        "${DateTime.now().millisecondsSinceEpoch}.jpg";

    final novoCaminho =
        join(directory.path, nomeArquivo);

    // Salva internamente
    final File novaImagem =
        await File(file.path).copy(novoCaminho);

    // Solicita permissões
    await Permission.photos.request();
    await Permission.storage.request();

    // Salva na galeria do celular
    await Gal.putImage(novaImagem.path);

    return novaImagem.path;
  }

  Future<String> convertImageBase64(
    String pickerFile,
  ) async {

    File file = File(pickerFile);

    final bytes = await file.readAsBytes();

    img.Image? image = img.decodeImage(bytes);

    if (image == null) {
      throw Exception(
        "Erro ao decodificar imagem",
      );
    }

    // Corrige rotação
    image = img.bakeOrientation(image);

    // Redimensiona
    image = img.copyResize(
      image,
      width: 920,
    );

    // Compressão
    final processedBytes =
        img.encodeJpg(
      image,
      quality: 75,
    );

    final convertBase64 =
        base64Encode(processedBytes);

    return "data:image/jpeg;base64,$convertBase64";
  }
}