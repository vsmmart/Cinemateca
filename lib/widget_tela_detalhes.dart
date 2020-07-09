import 'widget_tela_principal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class TelaDetalhes extends StatefulWidget {
  @override
  _TelaDetalhesState createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  Widget build(BuildContext context) {
    Filme f = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: f == null
            ? Text('Detalhes do Filme')
            : Text(
                '${f.titulo} - ${f.ano} ',
                style: TextStyle(color: Colors.white),
              ),
        backgroundColor: Colors.deepPurple[600],
      ),
      body: FutureBuilder(
        future: procuraPorID(f.imdbID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['Ratings'].length >= 2)
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.network(
                      snapshot.data['Poster'],
                      height: 350,
                      width: 300,
                    )),
                    SizedBox(height: 20),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Sinopse: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '${snapshot.data['Plot']}',
                          style: TextStyle(color: Colors.black)),
                    ])),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Gênero: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '${snapshot.data['Genre']}',
                          style: TextStyle(color: Colors.black)),
                    ])),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Duração: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '${snapshot.data['Runtime']}',
                          style: TextStyle(color: Colors.black)),
                    ])),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Diretor: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '${snapshot.data['Director']}',
                          style: TextStyle(color: Colors.black)),
                    ])),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Atores: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '${snapshot.data['Actors']}',
                          style: TextStyle(color: Colors.black)),
                    ])),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Nota IMDB: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            TextSpan(
                                text: '${snapshot.data['imdbRating']}' == 'N/A'
                                    ? 'N/A'
                                    : '${snapshot.data['imdbRating']}/10',
                                style: TextStyle(color: Colors.black)),
                          ],
                        )),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Nota Rotten Tomatoes: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            TextSpan(
                                text: '${snapshot.data['Ratings'][1]['Value']}' ==
                                        null
                                    ? 'N/A'
                                    : '${snapshot.data['Ratings'][1]['Value']}',
                                style: TextStyle(color: Colors.black)),
                          ],
                        )),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Nota Metacritic: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            TextSpan(
                                text: '${snapshot.data['Metascore']}' == 'N/A'
                                    ? 'N/A'
                                    : '${snapshot.data['Metascore']}/100',
                                style: TextStyle(color: Colors.black)),
                          ],
                        )),
                      ],
                    ),
                  ],
                ),
              );
            else
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.network(
                      snapshot.data['Poster'],
                      height: 350,
                      width: 300,
                    )),
                    SizedBox(height: 20),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Sinopse: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '${snapshot.data['Plot']}',
                          style: TextStyle(color: Colors.black)),
                    ])),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Gênero: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '${snapshot.data['Genre']}',
                          style: TextStyle(color: Colors.black)),
                    ])),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Duração: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '${snapshot.data['Runtime']}',
                          style: TextStyle(color: Colors.black)),
                    ])),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Diretor: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '${snapshot.data['Director']}',
                          style: TextStyle(color: Colors.black)),
                    ])),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Atores: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '${snapshot.data['Actors']}',
                          style: TextStyle(color: Colors.black)),
                    ])),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Nota IMDB: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            TextSpan(
                                text: '${snapshot.data['imdbRating']}' == 'N/A'
                                    ? 'N/A'
                                    : '${snapshot.data['imdbRating']}/10',
                                style: TextStyle(color: Colors.black)),
                          ],
                        )),
                        SizedBox(width: 50),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Nota Metacritic: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            TextSpan(
                                text: '${snapshot.data['Metascore']}' == 'N/A'
                                    ? 'N/A'
                                    : '${snapshot.data['Metascore']}/100',
                                style: TextStyle(color: Colors.black)),
                          ],
                        )),
                      ],
                    ),
                  ],
                ),
              );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Future<Map> procuraPorID(String text) async {
  String urlBusca = 'http://www.omdbapi.com/?i=';
  String urlKey = '&apikey=82b14fa0';

  var resposta = await http.get('$urlBusca$text$urlKey');
  if (resposta.statusCode == 200) {
    Map dados = json.decode(resposta.body);
    return dados;
  } else {
    throw Exception('O request não foi bem sucedido!');
  }
}
