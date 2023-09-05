import 'package:flutter/material.dart';
import 'package:widgets_states_91aoj/language.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário"),
        backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Nome",
                  label: Text("Nome")
                ),
                controller: _nameController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Informe o nome";
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Descrição",
                  label: Text("Descrição")
                ),
                controller: _descriptionController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Informe a descrição";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  child: const Text("Salvar"),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Language language = Language(
                        _nameController.text, 
                        _descriptionController.text, 
                        "1");

                      Navigator.pop(context, language);
                    }
                  },
                ))
            ]),
        )),
    );
  }
}