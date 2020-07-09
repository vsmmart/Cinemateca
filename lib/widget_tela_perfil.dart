import 'dart:async';
import 'package:cinemateca/model/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaPerfil extends StatefulWidget {
  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  TextEditingController txtSenha = TextEditingController();

  var senha = '';

  @override
  Widget build(BuildContext context) {
    Usuario usr = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        backgroundColor: Colors.deepPurple[600],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Username'),
                initialValue: usr.username == null ? 'Alguém' : usr.username),
            TextFormField(
              controller: txtSenha,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
              onEditingComplete: () {
                senha = txtSenha.text;
              },
            ),
            SizedBox(height: 10),
            Text(
              'Filmes que gostei',
              style: TextStyle(
                  color: Colors.deepPurple[800], fontWeight: FontWeight.bold),
            ),
            Container(
              //constraints: BoxConstraints(maxWidth: 800),
              width: 800,
              height: 170,
              child: renderizaCurtir(usr),
            ),
            SizedBox(height: 10),
            Text(
              'Filmes que não gostei',
              style: TextStyle(
                  color: Colors.red[900], fontWeight: FontWeight.bold),
            ),
            Container(
              width: 800,
              height: 170,
              child: renderizaDescurtir(usr),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                    child:
                        Text('Salvar', style: TextStyle(color: Colors.white)),
                    color: Colors.deepPurple[600],
                    onPressed: () {
                      atualizar(context, senha, usr);
                    }),
                FlatButton(
                  child: Text('Sair', style: TextStyle(color: Colors.black)),
                  color: Colors.grey[300],
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/tela_principal',
                        arguments: usr);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<List> pegaCurtir(Usuario usr) async {
  final db = Firestore.instance;
  final String liked = 'liked';

  final String usuarios = 'usuarios';

  final QuerySnapshot result = await db
      .collection(usuarios)
      .where('username', isEqualTo: usr.username)
      .getDocuments();
  final List<DocumentSnapshot> docUser = result.documents;

  final QuerySnapshot result2 = await db
      .collection(liked)
      .where('user', isEqualTo: docUser[0].documentID)
      .getDocuments();
  final List<DocumentSnapshot> docLiked = result2.documents;

  return docLiked;
}

Widget renderizaCurtir(Usuario usr) {
  return FutureBuilder<List>(
      future: pegaCurtir(usr),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return ListView.builder(
              // shrinkWrap: ,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[100],
                  child: Column(children: [
                    Image.network(snapshot.data[index]['poster'],
                        width: 80, height: 120),
                    Text(
                      '${snapshot.data[index]['titulo']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ]),
                );
              });
        else
          return Text('N/A');
      });
}

Future<List> pegaDescurtir(Usuario usr) async {
  var db = Firestore.instance;
  final String disliked = 'disliked';

  final String usuarios = 'usuarios';

  final QuerySnapshot result = await db
      .collection(usuarios)
      .where('username', isEqualTo: usr.username)
      .getDocuments();
  final List<DocumentSnapshot> docUser = result.documents;

  final QuerySnapshot result2 = await db
      .collection(disliked)
      .where('user', isEqualTo: docUser[0].documentID)
      .getDocuments();
  final List<DocumentSnapshot> docDisliked = result2.documents;

  return docDisliked;
}

Widget renderizaDescurtir(Usuario usr) {
  return FutureBuilder<List>(
      future: pegaDescurtir(usr),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return ListView.builder(
              // shrinkWrap: ,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[100],
                  child: Column(children: [
                    Image.network(snapshot.data[index]['poster'],
                        width: 80, height: 120),
                    Text('${snapshot.data[index]['titulo']}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]),
                );
              });
        else
          return Text('N/A');
      });
}

Future<Widget> atualizar(
    BuildContext context, String password, Usuario usr) async {
  var db = Firestore.instance;
  final String colecao = 'usuarios';
  var flag = '';
  final QuerySnapshot result = await db
      .collection(colecao)
      .where('username', isEqualTo: usr.username)
      .getDocuments();

  final List<DocumentSnapshot> documents = result.documents;

  if (documents.isNotEmpty) {
    db.collection(colecao).document(documents[0].documentID).updateData({
      'password': password,
    });
    flag = 'Senha atualizada com sucesso!';
  } else {
    flag = 'Usuário não encontrado!';
  }
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(flag),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Sair'))
          ],
        );
      });
}
