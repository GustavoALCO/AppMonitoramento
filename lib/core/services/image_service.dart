import 'dart:convert';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> selectCamera() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxHeight: 1226,
        maxWidth: 920,
        preferredCameraDevice: CameraDevice.rear
        
      );

      return pickedFile;
    } catch (e) {
      return null;
    }
  }

  Future<String> salvarImagemLocal(XFile file) async {
    final directory = await getApplicationDocumentsDirectory();

    final nomeArquivo = "${DateTime.now().millisecondsSinceEpoch}.jpg";

    final novoCaminho = join(directory.path, nomeArquivo);

    final File novaImagem = await File(file.path).copy(novoCaminho);

    return novaImagem.path;
  }

  Future<String> convertImageBase64(String pickerFile) async {
  File file = File(pickerFile);

  final bytes = await file.readAsBytes();

  img.Image? image = img.decodeImage(bytes);
  if (image == null) throw Exception("Erro ao decodificar imagem");

  image = img.bakeOrientation(image);

  final processedBytes = img.encodeJpg(image, quality: 95);

  final convertBase64 = base64Encode(processedBytes);

  return "data:image/jpeg;base64,$convertBase64";
}
}
