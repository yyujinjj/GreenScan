import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraExample(),
    );
  }
}

class CameraExample extends StatefulWidget {
  const CameraExample({Key? key}) : super(key: key);

  @override
  _CameraExampleState createState() => _CameraExampleState();
}

class _CameraExampleState extends State<CameraExample> {
  File? _image;
  List<dynamic>? _labels;
  List<dynamic>? _confidences;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    print('pick image');
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
        return;
      }
    });
    _uploadImage();
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;
    print('upload image');
    final uri = Uri.parse('http://192.168.0.185:8090/api/user/uploadImage');
    final request = http.MultipartRequest('POST', uri);

    final file = await http.MultipartFile.fromPath(
      'imageFile',
      _image!.path,
      contentType:
          MediaType('image', 'jpeg'), // Add this line if not already present
    );

    request.files.add(file);

    try {
      final response = await request.send();
      final responseBody = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        print('Response body: ${responseBody}');
        final Map<String, dynamic> responseData =
            json.decode(responseBody.body);
        setState(() {
          _labels = responseData['labels'];
          _confidences = responseData['confidences'];
        });
      } else {
        print('Upload failed: ${responseBody.body}');
      }
    } catch (e) {
      print('Error occurred while uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null ? Text('No image selected.') : Image.file(_image!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Take Image'),
            ),
            SizedBox(height: 20),
            _labels == null
                ? Text('No results.')
                : Column(
                    children: List.generate(_labels!.length, (index) {
                      return Text(
                        'Label: ${_labels![index]}, Confidence: ${_confidences![index]}',
                        style: TextStyle(fontSize: 16),
                      );
                    }),
                  ),
          ],
        ),
      ),
    );
  }
}
