import 'package:flutter/material.dart';
import 'package:widgets_states_91aoj/language.dart';

class ListLanguagesWidget extends StatefulWidget {
  const ListLanguagesWidget({super.key});

  @override
  State<ListLanguagesWidget> createState() => _ListLanguagesWidgetState();
}

class _ListLanguagesWidgetState extends State<ListLanguagesWidget> {
  List<Language> linguagens = [];

  List<ChoiceChip> _buildChips() {
    return linguagens
        .map((language) =>
            ChoiceChip(
              label: Text(language.name), 
              selected: language.selected,
              onSelected: (value){
                setState(() {
                  language.selected = value;
                });
              }))
        .toList();
  }

  List<Card> _buildCards() {
    return linguagens
        .where((language) => language.selected)
        .map((language) => Card(
              child: ListTile(
                leading: Text(language.id),
                title: Text(language.name),
                subtitle: Text(language.description),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo Home Page"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            Future future = Navigator.pushNamed(context, "/add");
            future.then((language){
              setState(() {
                linguagens.add(language);
              });
            });
          }, icon: const Icon(Icons.add))
        ],
      ),
      body:  Column(
      children: [
        Center(
          child: Wrap(
            spacing: 10,
            children: _buildChips(),
          ),
        ),
        Expanded(
            child: ListView(
          children: _buildCards(),
        ))
      ],
    )
    );
  }
}
