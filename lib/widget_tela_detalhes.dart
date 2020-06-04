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
        : Text(f.titulo, style: TextStyle(color:Colors.white),),
        backgroundColor: Colors.deepPurple[600],
      ),
      
      body: FutureBuilder(
        future: procuraPorID(f.imdbID),
        builder: (context, snapshot){
        if(snapshot.hasData){          
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children:[
                   Center(child: Image.network(snapshot.data['Poster'], height: 350, width: 300,)),
                   SizedBox(height:20),
                   RichText(text: TextSpan(
                     children: [
                       TextSpan(text:'Sinopse: ', style: TextStyle(fontWeight: FontWeight.bold) ),
                       TextSpan(text: '${snapshot.data['Plot']}'),]
                   )),
                   SizedBox(height:10),
                   Text('Duração: ${snapshot.data['Runtime']}'),
                   


                ],
               
              ),
            );
        }
        else{
          return CircularProgressIndicator();
        }
        
        
         }, ),

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

