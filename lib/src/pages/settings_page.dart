import 'package:flutter/material.dart';
import 'package:preferencias_user/src/share_prefs/preferencia_user.dart';
import 'package:preferencias_user/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre='Pedro';

  TextEditingController _textController;

  final prefs= new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina=SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario= prefs.colorsecundario;
   _textController= new TextEditingController(text: prefs.nombreUsuario);
  }



  _setSelectedRadio(int valor){
    prefs.genero = valor;
    _genero = valor ;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorsecundario) ? Colors.green : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Center(
        child: ListView(
          children: <Widget> [

            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Settings',style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold),),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color Secundario'),
              onChanged: (value){
                _colorSecundario=value;
                prefs.colorsecundario=value;
                setState(() {});
              },
            ),
            RadioListTile(
              value: 1, 
              groupValue: _genero, 
              title: Text('Masculino'),
              onChanged: _setSelectedRadio,
              
              ),
             RadioListTile(
              value: 2, 
              groupValue: _genero, 
              title: Text('Feminino'),
              onChanged:_setSelectedRadio
              ),
              Divider(),
              
              Container(
                padding:EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText:'Nombre',
                    helperText: 'Nombre del usuario' 
                  ),
                  onChanged: (value){
                    prefs.nombreUsuario=value;
                  },
                )
              )
          ],
        ) ,
        )
    );
  }
}