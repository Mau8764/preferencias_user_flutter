import 'package:flutter/material.dart';
import 'package:preferencias_user/src/share_prefs/preferencia_user.dart';
import 'package:preferencias_user/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {


        prefs.ultimaPagina=HomePage.routeName;


    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
        backgroundColor: (prefs.colorsecundario) ? Colors.green : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: ${ prefs.colorsecundario }'),
          Divider(),
          Text('Genero:${ prefs.genero }'),
          Divider(),
          Text('Nombre Usuario: ${ prefs.nombreUsuario } '),
          Divider(),
        ],
      ),
    );
  }

 
}