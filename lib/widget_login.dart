import 'package:flutter/material.dart';

import 'model/Usuario.dart';


class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  TextEditingController txtLogin = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  var _login = "";
  var _password = "";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tela de Login'),
          backgroundColor: Colors.deepPurple[600],
        ),
//Botao Flutuante => Limpa os campos
        floatingActionButton: FloatingActionButton(
            tooltip: 'Limpa os campos Login e Senha',
            child: Icon(Icons.refresh, color: Colors.white),
            backgroundColor: Colors.deepPurple[600],
            onPressed: () {
              setState(() {
                txtLogin.text = "";
                txtPassword.text = "";
              });
            }),
//Corpo principal
        body: Form(
          key: _formkey,
          child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    
                    Icon(Icons.local_movies,
                        size: 95,
                        color: Colors.deepPurple[600]),
                                       
                  
                    SizedBox(height:20),
                    

//Campo de Login
                    TextFormField(
                      
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          border: OutlineInputBorder(),
                          labelText: 'Login'),
                      onChanged: (text) {
                        _login = text;
                      },
                      controller: txtLogin,
                      validator: (String value){
                        if(value.isEmpty){
                            return 'Login está vazio! Necessário preencher!';
                        }
                        return null;
                      }
                    ),
                    SizedBox(height: 20),

//Campo de Senha
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: txtPassword,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                          labelText: 'Senha'),
                      onChanged: (text) {
                        _password = text;
                      },
                      validator: (String value){
                    if(value.isEmpty){
                      return 'Campo senha vazio! Necessário preencher!';
                    }
                      return null;
                  },
                      
                    ),
                    SizedBox(height: 30),

//Botão Enviar
                    RaisedButton(
                      
                      color: Colors.deepPurple[600],
                      child: Text('Enviar', 
                        style: TextStyle(color: Colors.white),
                        ),
                      onPressed: //Aqui precisaria fazer uma validação do login e senha
                          () {

                        if (!_formkey.currentState.validate()) { 
                          return;
                        }    
                          Navigator.pushNamed(context, '/tela_principal',
                              arguments: Usuario('',_login,_password));                   
                      },
                    ),

                    SizedBox(height: 40,),

                    RaisedButton(
                      color: Colors.grey[100],
                      child: Text('Não é cadastrado? Clique aqui para se cadastrar'),
                      onPressed:(){
                        Navigator.pushNamed(context, '/tela_cadastro');
                      } ,
                    ),

                  ],
                ),
              )),
        ));
  }
}

/*class Usuario {
  String username;
  String password;

  Usuario(this.username, {this.password});

  String get name => username;
  String get senhaGet => password;
  set nameSet(String nome) {
    username = nome;
  }

  set senhaSet(String senha) {
    password = senha;
  }
}*/
