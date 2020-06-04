import 'package:flutter/material.dart';
import 'widget_login.dart';
import 'widget_tela_principal.dart';
import 'widget_tela_sobre.dart';
import 'widget_tela_cadastro.dart';
import 'widget_tela_perfil.dart';
import 'widget_tela_detalhes.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Cinematek',
    initialRoute: '/tela_login',
    routes: {
      '/tela_login': (context) => TelaLogin(),
      '/tela_principal': (context) => TelaPrincipal(),
      '/tela_sobre': (context) => TelaSobre(),
      '/tela_cadastro':(context) => TelaCadastro(),
      '/tela_perfil':(context) => TelaPerfil(),
      '/tela_detalhes':(context) => TelaDetalhes(),
    }, 
  ));
}

