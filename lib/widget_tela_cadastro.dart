
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
TextEditingController txtUsername = TextEditingController();

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Tela de Cadastro'),backgroundColor: Colors.deepPurple[600],),
      body:  Form(
        child:Padding(padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
              
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                    labelText: 'Nome de Usuário'),
                    controller: txtUsername,
                    ),
                SizedBox(height:20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: 'Senha'),),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                     child: Text('Cadastrar'),
                     
                     onPressed: (){
                       checagem(txtUsername.text);

                     }),
                    
                    FlatButton(onPressed: ()=> Navigator.pop(context),
                     child: Text('Sair')),
                  ],
                  
                ),

              ],),

          ),
        ),),
      
    );
  }
}

Future<Widget> checagem(String texto) async {
  var db = Firestore.instance;
  var flag = '';
  final String colecao = 'usuarios';
  return StreamBuilder<QuerySnapshot>(
    stream: db.collection(colecao).snapshots(),
    builder: (context, snapshot){
       switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default: 
                List<DocumentSnapshot> docs = snapshot.data.documents;
                docs.forEach((element) {
                  if(element.data.containsValue(texto)){
                    flag ='Nome de usuário já existente!';
                    return(Text('Nome de usuário já existente!'));
                  
                  }
                  else{
                    db.collection(colecao).add({
                      "username":element.data["username"],
                      "password":element.data["password"]
                    });
                    flag = 'Usuário Cadastrado com Sucesso!';
                    return (Text('Usuário Cadastrado com Sucesso!'));
                  }
                });
               
       }
       return AlertDialog(
         content: Text(flag),
         actions: [
           FlatButton(onPressed: (){Navigator.pop(context);}, child: Text('Ok'))
         ],
       );
    });
}