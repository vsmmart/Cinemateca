import 'package:flutter/material.dart';

class TelaPerfil extends StatefulWidget {
  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
String oi = 'oi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meu Perfil'),backgroundColor: Colors.deepPurple[600],),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              RichText(
                text:TextSpan(
                  text:'Informações serão apresentadas aqui',
                
              ))
              
            
            
            
            ],),
          
        ),
      ),
    );
  }
}