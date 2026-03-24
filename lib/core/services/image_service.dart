import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> selectCamera() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
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
    // busca aonde a imagem está armazenada
    File file = File(pickerFile);

    //le e tranforma a imagem em bytes
    final bytes = await file.readAsBytes();

    //Converte os bytes em Base64
    final convertBase64 = base64Encode(bytes);

    //retorna convertido a imagem
    return "data:image/jpeg;base64,$convertBase64";
  }
}
