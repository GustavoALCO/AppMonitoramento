import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> selectCamera() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(maxHeight: 900,
                                    maxWidth: 1800,
                                    imageQuality: 70,
                                    source: ImageSource.camera);

    return pickedFile; 
  }


  Future<String> convertImageBase64(XFile pickerFile) async
  {
    // busca aonde a imagem está armazenada
    File file = File(pickerFile.path);

    //le e tranforma a imagem em bytes
    final bytes = await file.readAsBytes();

    //Converte os bytes em Base64
    final convertBase64 = base64Encode(bytes);

    //retorna convertido a imagem
    return "data:image/jpeg;base64,$convertBase64";
  }
}

