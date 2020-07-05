import 'package:flutter/material.dart';
import 'model/Usuario.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final TextEditingController ctrlPesquisa = TextEditingController();
  String campoPesquisa = '';

  @override
  Widget build(BuildContext context) {
    final Usuario usr = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[600],
          title: usr == null
              ? Text('Bem-vindo Aquele-Que-Não-Deve-Ser-Nomeado')
              : Text('Bem-vindo ${usr.username}'),
          actions: [
            IconButton(
              icon: Icon(Icons.cancel), 
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, '/tela_login', (route) => false);
              }           
               ),
            ],
          ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.tightForFinite(),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
                    fit: FlexFit.loose,
                    child: TextField(
                      controller: ctrlPesquisa,
                      onEditingComplete: () {
                        setState(() {
                          campoPesquisa = ctrlPesquisa.text;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pesquise um filme (em Inglês)',
                        prefixIcon:
                            Icon(Icons.movie, 
                            color: Colors.black45),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      alignment: Alignment.center,
                      child: IconButton(
                        iconSize: 30.0,
                        tooltip: 'Pesquisar',
                        color: Colors.black45,
                        //hoverColor: Colors.deepPurple[600],
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            campoPesquisa = ctrlPesquisa.text;
                            //       procuraFilmes(campoPesquisa);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (campoPesquisa.length > 0) 
              listagem(campoPesquisa)
          ],
        ),
      ),

//////////
//     DRAWER
//////////

      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        elevation: 22,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.deepPurple, Colors.deepPurple[800]],
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[


/////////
//// Botão Meu Perfil
/////////


             Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.person_pin),
                      iconSize: 60,
                      color: Colors.white60,
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      hoverColor: Colors.grey[600],
                      tooltip: 'Editar e Visualizar Perfil',
                      onPressed: () {
                        Navigator.pushNamed(context, '/tela_perfil');
                      }),
                  GestureDetector(
                    onTap:  () {
                        Navigator.pushNamed(context, '/tela_perfil');},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Meu Perfil',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white70),
                      
                      ),
                    ),
                  ),
                ],
              ),






////////
//// Botão Sobre o Dev
///////

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.android),
                      iconSize: 60,
                      color: Colors.white60,
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      hoverColor: Colors.grey[600],
                      tooltip: 'Informações sobre o desenvolvedor',
                      onPressed: () {
                        sobreDev(context);
                      }),
                  GestureDetector(
                    onTap:  () {
                        sobreDev(context);},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sobre o desenvolvedor',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white70),
                      
                      ),
                    ),
                  ),
                ],
              ),
            

//////
//Botão Sobre o App
//////

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.info),
                      iconSize: 60,
                      color: Colors.white60,
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      hoverColor: Colors.grey[600],
                      tooltip: 'Informações sobre o aplicativo',
                      onPressed: () {
                        Navigator.pushNamed(context, '/tela_sobre');
                      }),
                  GestureDetector(
                    onTap:() {
                        Navigator.pushNamed(context, '/tela_sobre');
                      },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sobre o aplicativo',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                ],
              ),

///////
//Botão Fecha Drawer
///////

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 60,
                      color: Colors.white60,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      hoverColor: Colors.grey[600],
                      tooltip: 'Fechar este menu',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  GestureDetector(
                    onTap: () {
                        Navigator.pop(context);
                      },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Fechar',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

sobreDev(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text('Sobre o Dev:'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Oi, eu sou o Dev!'),
                SizedBox(height: 20.0),
                GifAnimadoAsset()
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok')),
          ]);
    },
  );
}

class GifAnimadoAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/hehe.gif');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
    );
  }
}

//////////////////
////////// Definição dos componentes Filme, FilmeCard, ListaFilmes
////////// Definição da função que faz a comunicação com a API externa (procuraFilmes)
////////// Definição do widget que retorna tudo isso (listagem)
//////////////////

class Filme {
  String titulo;
  String ano;
  String imdbID;
  String tipo;
  String poster;

  Filme({this.titulo, this.ano, this.imdbID, this.tipo, this.poster});

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      titulo: json['Title'],
      ano: json['Year'],
      imdbID: json['imdbID'],
      tipo: json['Type'],
      poster: json['Poster'],
    );
  }
}

class FilmeCard extends StatelessWidget {
  final Filme filme;

  FilmeCard({this.filme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              if (this.filme.poster != 'N/A')
                Image.network(
                  this.filme.poster,
                  height: 120,
                  width: 120,
                )
              else if (this.filme.poster == 'N/A')
                Icon( Icons.block, size: 120, color: Colors.grey[200],
                  
                ),
            ],
          ),
          Column(
            children: [
              Text(this.filme.titulo, style: TextStyle(fontWeight: FontWeight.bold),),
              Text(this.filme.ano),
              Text(this.filme.tipo),
            ],
          ),
          SizedBox(width: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          IconButton(
            icon: Icon(Icons.star),
            padding: EdgeInsets.all(8.0), 
            tooltip: 'Marcar como favorito',
            onPressed: null),


          IconButton(
            icon: Icon(Icons.thumb_up),
            padding: EdgeInsets.all(8.0),
            tooltip: 'Marcar como gostei',   
            onPressed: null
            ),

          IconButton(
            icon: Icon(Icons.thumb_down),
            padding: EdgeInsets.all(8.0),
            tooltip: 'Marcar como não gostei',   
            onPressed: null
            )
          ],),
        ],
      ),
    );
  }
}


class ListaFilmes extends StatelessWidget {
  final List<Filme> filmes;
  
  

  ListaFilmes({this.filmes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.all(6),
          itemCount: this.filmes.length,
          itemBuilder: (context, index) {
            return GestureDetector(   
              child:Card(
                color: Colors.grey[100],
                child:  FilmeCard(filme: this.filmes[index]),
              ),
              onTap:() => Navigator.pushNamed(context, '/tela_detalhes',arguments: this.filmes[index])

            );
          
          }),
    );
  }
}

Future<List<Filme>> procuraFilmes(String text) async {
  String urlBusca = 'http://www.omdbapi.com/?s=';
  String urlKey = '&apikey=82b14fa0';

  var resposta = await http.get('$urlBusca$text$urlKey');
  if (resposta.statusCode == 200) {
    Map dados = json.decode(resposta.body);

    if (dados['Response'] == "True") {
      var listaFilmes =
          (dados['Search'] as List).map((e) => Filme.fromJson(e)).toList();
    
      return listaFilmes;
    } else {
      throw Exception('Nenhum filme foi encontrado!');
    }
  } else {
    throw Exception('O request não foi bem sucedido!');
  }
}

Widget listagem(String texto) {
  return FutureBuilder<List<Filme>>(
      future: procuraFilmes(texto),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == false) {
          return Text('Erro no connectionState ou no snapshot');
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Expanded(child: ListaFilmes(filmes: snapshot.data));
        } else {
          return CircularProgressIndicator();
        }
      });
}

