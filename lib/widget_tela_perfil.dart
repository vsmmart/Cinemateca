import 'package:cinemateca/model/Usuario.dart';
import 'package:flutter/material.dart';



class TelaPerfil extends StatefulWidget {
  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {




  @override
  Widget build(BuildContext context) {
    Usuario usr = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Meu Perfil'),backgroundColor: Colors.deepPurple[600],),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username'),
              SizedBox(height: 5),
              TextFormField(
                initialValue: usr == null
                ? 'O Escolhido'
                : usr.username,
              ),
              SizedBox(height: 10),
              Text('Senha'),
              SizedBox(height: 5),
              TextFormField(

              ),
              SizedBox(height:10),
              Text('Filmes que gostei'),
              SizedBox(height:5),
              Container(),
              SizedBox(height:10),
              
              Text('Filmes que não gostei'),
              SizedBox(height:5),
              Container(),
              SizedBox(height: 25),
              FlatButton(
                color: Colors.deepPurple[600],
                onPressed: (){
                Navigator.popAndPushNamed(context, '/tela_principal');
              } , child: Text('Sair',style: TextStyle(color:Colors.white),
               ),),
              
            
            
            
            ],),
          
        ),
      
    );
  }
}