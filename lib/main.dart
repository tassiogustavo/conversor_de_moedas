import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request =
    "https://api.hgbrasil.com/finance?fields=only_results,currencies&key=cf382bea";

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            hintStyle: TextStyle(color: Colors.amber))),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final argetineController = TextEditingController();
  final canadianController = TextEditingController();
  final australianController = TextEditingController();
  final japaneseController = TextEditingController();
  final bitcoinController = TextEditingController();

  double dolar = 0;
  double euro = 0;
  double argentine = 0;
  double canadian = 0;
  double australian = 0;
  double japanese = 0;
  double bitcoin = 0;

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    argetineController.text = (real / argentine).toStringAsFixed(2);
    canadianController.text = (real / canadian).toStringAsFixed(2);
    australianController.text = (real / australian).toStringAsFixed(2);
    japaneseController.text = (real / japanese).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
    argetineController.text =
        (dolar * this.dolar / argentine).toStringAsFixed(2);
    canadianController.text =
        (dolar * this.dolar / canadian).toStringAsFixed(2);
    australianController.text =
        (dolar * this.dolar / australian).toStringAsFixed(2);
    japaneseController.text =
        (dolar * this.dolar / japanese).toStringAsFixed(2);
    bitcoinController.text = (dolar * this.dolar / bitcoin).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
    argetineController.text = (euro * this.euro / argentine).toStringAsFixed(2);
    canadianController.text = (euro * this.euro / canadian).toStringAsFixed(2);
    australianController.text =
        (euro * this.euro / australian).toStringAsFixed(2);
    japaneseController.text = (euro * this.euro / japanese).toStringAsFixed(2);
    bitcoinController.text = (euro * this.euro / bitcoin).toStringAsFixed(2);
  }

  void _argentineChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double argentine = double.parse(text);
    realController.text = (argentine * this.argentine).toStringAsFixed(2);
    dolarController.text =
        (argentine * this.argentine / dolar).toStringAsFixed(2);
    euroController.text =
        (argentine * this.argentine / euro).toStringAsFixed(2);
    canadianController.text =
        (argentine * this.argentine / canadian).toStringAsFixed(2);
    australianController.text =
        (argentine * this.argentine / australian).toStringAsFixed(2);
    japaneseController.text =
        (argentine * this.argentine / japanese).toStringAsFixed(2);
    bitcoinController.text =
        (argentine * this.argentine / bitcoin).toStringAsFixed(2);
  }

  void _canadianChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double canadian = double.parse(text);
    realController.text = (canadian * this.canadian).toStringAsFixed(2);
    dolarController.text =
        (canadian * this.canadian / dolar).toStringAsFixed(2);
    euroController.text = (canadian * this.canadian / euro).toStringAsFixed(2);
    argetineController.text =
        (canadian * this.canadian / argentine).toStringAsFixed(2);
    australianController.text =
        (canadian * this.canadian / australian).toStringAsFixed(2);
    japaneseController.text =
        (canadian * this.canadian / japanese).toStringAsFixed(2);
    bitcoinController.text =
        (canadian * this.canadian / bitcoin).toStringAsFixed(2);
  }

  void _australianChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double australian = double.parse(text);
    realController.text = (australian * this.australian).toStringAsFixed(2);
    dolarController.text =
        (australian * this.australian / dolar).toStringAsFixed(2);
    euroController.text =
        (australian * this.australian / euro).toStringAsFixed(2);
    argetineController.text =
        (australian * this.australian / argentine).toStringAsFixed(2);
    canadianController.text =
        (australian * this.australian / canadian).toStringAsFixed(2);
    japaneseController.text =
        (australian * this.australian / japanese).toStringAsFixed(2);
    bitcoinController.text =
        (australian * this.australian / bitcoin).toStringAsFixed(2);
  }

  void _japaneseChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double japanese = double.parse(text);
    realController.text = (japanese * this.japanese).toStringAsFixed(2);
    dolarController.text =
        (japanese * this.japanese / dolar).toStringAsFixed(2);
    euroController.text = (japanese * this.japanese / euro).toStringAsFixed(2);
    argetineController.text =
        (japanese * this.japanese / argentine).toStringAsFixed(2);
    canadianController.text =
        (japanese * this.japanese / canadian).toStringAsFixed(2);
    australianController.text =
        (japanese * this.japanese / australian).toStringAsFixed(2);
    bitcoinController.text =
        (japanese * this.japanese / bitcoin).toStringAsFixed(2);
  }

  void _bitcoinChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double bitcoin = double.parse(text);
    realController.text = (bitcoin * this.bitcoin).toStringAsFixed(2);
    dolarController.text = (bitcoin * this.bitcoin / dolar).toStringAsFixed(2);
    euroController.text = (bitcoin * this.bitcoin / euro).toStringAsFixed(2);
    argetineController.text =
        (bitcoin * this.bitcoin / argentine).toStringAsFixed(2);
    canadianController.text =
        (bitcoin * this.bitcoin / canadian).toStringAsFixed(2);
    australianController.text =
        (bitcoin * this.bitcoin / australian).toStringAsFixed(2);
    japaneseController.text =
        (bitcoin * this.bitcoin / japanese).toStringAsFixed(2);
  }

  void _clearAll() {
    realController.text = "";
    euroController.text = "";
    dolarController.text = "";
    argetineController.text = "";
    canadianController.text = "";
    australianController.text = "";
    japaneseController.text = "";
    bitcoinController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$Conversor\$"),
        actions: [
          IconButton(
              onPressed: () {
                _clearAll();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              icon: Icon(Icons.refresh)),
        ],
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return conectandoComApi("Carregando Dados");
            default:
              if (snapshot.hasError) {
                return conectandoComApi("Erro ao Carregar Dados");
              } else {
                dolar = snapshot.data!["currencies"]["USD"]["buy"];
                euro = snapshot.data!["currencies"]["EUR"]["buy"];
                argentine = snapshot.data!["currencies"]["ARS"]["buy"];
                canadian = snapshot.data!["currencies"]["CAD"]["buy"];
                australian = snapshot.data!["currencies"]["AUD"]["buy"];
                japanese = snapshot.data!["currencies"]["JPY"]["buy"];
                bitcoin = snapshot.data!["currencies"]["BTC"]["buy"];
                return SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.monetization_on,
                          size: 130,
                          color: Colors.amber,
                        ),
                      ),
                      buildTextField(
                          "Reais", "R\$ ", realController, _realChanged),
                      Divider(),
                      buildTextField(
                          "Dolares", "US\$ ", dolarController, _dolarChanged),
                      Divider(),
                      buildTextField(
                          "Euros", "€ ", euroController, _euroChanged),
                      Divider(),
                      buildTextField("Peso Argentino", "ARS\$ ",
                          argetineController, _argentineChanged),
                      Divider(),
                      buildTextField("Dolar Canadense", "C\$ ",
                          canadianController, _canadianChanged),
                      Divider(),
                      buildTextField("Dolar Australiano", "A\$ ",
                          australianController, _australianChanged),
                      Divider(),
                      buildTextField("Yen Japonês", "¥ ", japaneseController,
                          _japaneseChanged),
                      Divider(),
                      buildTextField(
                          "Bitcoin", "฿ ", bitcoinController, _bitcoinChanged),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Widget buildTextField(String label, String prefix,
    TextEditingController controller, Function func) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: prefix),
    style: TextStyle(color: Colors.amber, fontSize: 25),
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    onChanged: (texto) {
      func(texto);
    },
  );
}

Widget conectandoComApi(String msg) {
  return Center(
    child: Text(
      msg,
      style: TextStyle(color: Colors.amber, fontSize: 25),
      textAlign: TextAlign.center,
    ),
  );
}

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}
