import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Tela de Cadastro'),backgroundColor: Colors.deepPurple[600],),
      body: Form(
        child:Padding(padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
                TextFormField(
                   decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'Email'),
                ),
                SizedBox(height:20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                    labelText: 'Nome de Usuário'),),
                SizedBox(height:20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: 'Senha'),),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(onPressed: null, child: Text('Cadastrar')),
                    FlatButton(onPressed: null, child: Text('Sair')),
                  ],
                  
                ),

              ],),

          ),
        ),),
      
    );
  }
}