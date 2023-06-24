import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _senhaEscondida = true;
  late final TextEditingController _userController;
  late final TextEditingController _passwordController;

  void _alteraVisibilidade() {
    setState(() {
      _senhaEscondida = !_senhaEscondida;
    });
  }

  @override
  void initState() {
    _userController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Image.asset(
                  'assets/images/Gym_Logo.png',
                  width: MediaQuery.of(context).size.width * 0.55,
                ),
                const SizedBox(height: 40),
                TextField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      label: Text('Usuário'),
                      hintText: 'Usuário',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.people),
                    )),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: _senhaEscondida,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: const Text('Senha'),
                    hintText: 'Senha',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: _alteraVisibilidade,
                        icon: _senhaEscondida
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.black,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.75, 50)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/MainPage');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  child: const Text('Esqueci a senha'),
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                InkWell(
                  child: const Text('Cadastre-se'),
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.3, 20)),
                  onPressed: () {},
                  child: const Text('Dark Mode'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
