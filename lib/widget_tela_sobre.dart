import 'package:flutter/material.dart';

import 'model/Usuario.dart';

class TelaSobre extends StatefulWidget {
  @override
  _TelaSobreState createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  TextEditingController ctrlTexto1 = TextEditingController();
  String texto1 =
      'Este aplicativo foi desenvolvido como projeto para a disciplina de Programação para Dispositivos Móveis ministrada pelo professor Rodrigo Plotze. Foi também o primeiro projeto em que o desenvolvedor teve contato com POO, API, front-end, requests, Git, Github, funções assíncronas, entre outras. Foi um desafio muito grande mas motivador para o aprimoramento de programação. O Tema para o aplicativo escolhido foi "Cinema" devido a uma grande paixão do desenvolvedor por este hobby.';

  TextEditingController ctrlTexto2 = TextEditingController();
  String texto2 =
      'A API utilizada se chama OMDB API, ela pode ser encontrada em http://www.omdbapi.com/';

  TextEditingController ctrlTexto3 = TextEditingController();
  String texto3 =
      'Agradeço ao professor Rodrigo Plotze pelas aulas e conhecimentos transmitidos. Agradeço ao Google, Youtube, StackOverflow, Medium e tantos outros meios de pesquisa que me deram alguma luz. Agradeço imensamente ao meu amigo Raul por toda paciência e disposição em me ajudar tanto com programação quanto no dia-a-dia.';

  @override
  Widget build(BuildContext context) {
    final Usuario usr = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações sobre o aplicativo'),
        backgroundColor: Colors.deepPurple[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              constraints: BoxConstraints.tightForFinite(),
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: ctrlTexto1,
                readOnly: true,
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sobre',
                  icon: Icon(Icons.sort),
                ),
                onTap: () {
                  ctrlTexto1.text = texto1;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: ctrlTexto2,
                readOnly: true,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'API',
                  icon: Icon(Icons.track_changes),
                ),
                onTap: () {
                  ctrlTexto2.text = texto2;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: ctrlTexto3,
                readOnly: true,
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Agradecimentos',
                  icon: Icon(Icons.tag_faces),
                ),
                onTap: () {
                  ctrlTexto3.text = texto3;
                },
              ),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/tela_principal',arguments: usr);
                },
                color: Colors.deepPurple[600],
                textColor: Colors.white,
                child: Text('Voltar')),
          ],
        ),
      ),
    );
  }
}
