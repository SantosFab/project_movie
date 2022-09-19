import 'package:flutter/material.dart';
import 'package:project_movie/src/style/custom_color.dart';

class TextFrom extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? submitted;
  const TextFrom({Key? key, this.submitted, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: submitted,
      decoration: InputDecoration(
        label:
            Text('Pesquise filmes', style: TextStyle(color: CustomColor.grey)),
        hintText: 'Ex: Homem de ferro 2',
        prefixIcon: Icon(Icons.search, color: CustomColor.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: CustomColor.grey),
        ),
      ),
      validator: (value) => _validor(value),
    );
  }

  String? _validor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Para pesquisar, é preciso digitar o nome do filmes';
    }
    return null;
  }
}
