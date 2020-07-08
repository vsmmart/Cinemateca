
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
TextEditingController txtUsername = TextEditingController();
TextEditingController txtPassword = TextEditingController();

  
  
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
                  controller: txtPassword,
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
                     
                     onPressed: (){ setState(() {
                       
                       checagem(context, txtUsername.text, txtPassword.text);
                      // popup(context, txtUsername.text,txtPassword.text);
                       
                     });
                       

                     }),
                    
                    FlatButton(onPressed: ()=> Navigator.popAndPushNamed(context, '/tela_login'),
                     child: Text('Sair')),
                  ],
                  
                ),

              ],),

          ),
        ),),
      
    );
  }
}

Future<Widget> checagem(BuildContext context, String usrname, String senha) async {
  var db = Firestore.instance;
  var flag = '';
  final String colecao = 'usuarios';
  
  
  final QuerySnapshot result =
        await db.collection(colecao).where('username', isEqualTo: usrname).getDocuments();
    final List < DocumentSnapshot > documents = result.documents;
  
  if(documents.isEmpty){
    db.collection(colecao).add({
                      "username":usrname,
                      "password":senha
                    });
   flag = 'Usuário Cadastrado com Sucesso!';
                
  }
  else
     flag = 'Usuário já existente! Por favor, escolha outro nome de usuário';   

 
 return showDialog(
   context: context ,
   builder: (BuildContext context){
    return AlertDialog(
        content:Text(flag),
        actions:[
          FlatButton(onPressed:(){
            Navigator.pop(context);
          } , child: Text('sair'))
        ]
      );

   }
 );


}


 
