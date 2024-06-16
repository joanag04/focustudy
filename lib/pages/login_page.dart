import 'package:flutter/material.dart';
import 'package:teste_flutter/utils/google_sign_in_api.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final Function()? onTap;

  LoginPage({
    super.key,
    required this.onTap,
  });

  // user clica no login
  Future signIn() async {
    await GoogleSignInApi.login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 121, 169, 191),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.white)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mainpage');
                      },
                      child: Row(
                        children: [
                          Text(
                            'Entrar sem login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 169, 191)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Icon(Icons.forward)
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // logo
            Icon(
              Icons.lock,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Bem-vindo novamente!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            // username
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 350.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: 'Nome de utilizador',
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 350.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Palavra-passe',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 350.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Esqueceu a palavra-passe?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 360,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text('Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 121, 169, 191),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Divider(thickness: 1, color: Colors.white),
            SizedBox(
              height: 8,
            ),
            Text(
              'Ou continuar com',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await signIn();
              },
              child: Image.asset(
                'lib/images/google.png',
                height: 72,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ainda não tem conta?',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Registe-se agora',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
