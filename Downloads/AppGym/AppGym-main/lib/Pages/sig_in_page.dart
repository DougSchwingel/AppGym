import 'package:flutter/material.dart';
import 'package:gym_app/PreparedWidgets/return_button.dart';
import 'package:gym_app/PreparedWidgets/topbar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  String name = '';
  String weight = '';
  String height = '';
  String pass1 = '';
  String pass2 = '';

  String cabecalho = 'Preencha seus dados para realizar o cadastro!';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: TopBar(
          title: 'Gym Name',
          returnButton: const ReturnButtonApp(),
          isSignIn: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(
              children: [
                SizedBox(
                  child: Text(
                    cabecalho,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Nome'),
                    floatingLabelStyle: TextStyle(color: Colors.white),
                    hintText: 'Insira seu nome',
                    prefixIcon: Icon(Icons.person),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 255, 152, 0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text('Peso'),
                    floatingLabelStyle: const TextStyle(color: Colors.white),
                    hintText: 'Insira seu peso',
                    prefixIcon: Image.asset(
                      'assets/icons/weight.png',
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 255, 152, 0),),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextField(
                  controller: _heightController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Altura'),
                    floatingLabelStyle: TextStyle(color: Colors.white),
                    hintText: 'Insira sua altura em metros',
                    prefixIcon: Icon(Icons.height),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 255, 152, 0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextField(
                  controller: _passwordController1,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Senha'),
                    floatingLabelStyle: TextStyle(color: Colors.white),
                    hintText: 'Insira sua senha',
                    prefixIcon: Icon(Icons.lock),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 255, 152, 0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextField(
                  controller: _passwordController2,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Confirmar Senha'),
                    floatingLabelStyle: TextStyle(color: Colors.white),
                    hintText: 'Confirme sua senha',
                    prefixIcon: Icon(Icons.lock),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 255, 152, 0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isEmpty == true ||
                        _weightController.text.isEmpty == true ||
                        _heightController.text.isEmpty == true) {
                      setState(() {
                        cabecalho = 'Preencha os campos abaixo!';
                      });
                    } else if (_passwordController1.text !=
                            _passwordController2.text ||
                        _passwordController1.text.isEmpty) {
                      setState(() {
                        cabecalho = 'Confirme as senhas!';
                      });
                    } else {
                      /*
                      //
                      //
                      //Lógica de inserir no banco aqui
                      //
                      //
                      */
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 152, 0)
                  ),
                  child: const SizedBox(
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
