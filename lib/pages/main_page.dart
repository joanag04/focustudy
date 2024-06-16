import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FOCUSTUDY',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 121, 169, 191),
      ),

      // add a caroussel com images do q se pode fazer na app
      drawer: Drawer(
        child: Column(
          children: [
            // drawer header here com um ícone
            const DrawerHeader(
              child: Icon(
                Icons.school,
                color: Colors.yellow,
                size: 48,
              ),
            ),

            // Página de lista de tarefas
            ListTile(
              leading: const Icon(
                Icons.done,
                color: Colors.blue,
              ),
              title: const Text("LISTA DE TAREFAS"),
              onTap: () {
                // Ir para a página de lista de tarefas
                Navigator.pushNamed(context, '/todopage');
              },
            ),

            // Disciplinas e tópicos
            ListTile(
              leading: const Icon(Icons.book, color: Colors.green),
              title: const Text("DISCIPLINAS E TÓPICOS"),
              onTap: () {
                // Ir para a página de disciplinas e tópicos
                Navigator.pushNamed(context, '/subjectspage');
              },
            ),

            // Sessões de estudo
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.orange),
              title: const Text("SESSÃO DE ESTUDO"),
              onTap: () {
                // Ir para a página de sessões de estudo
                Navigator.pushNamed(context, '/timerpage');
              },
            ),

            // Calendário
            ListTile(
              leading: const Icon(
                Icons.calendar_month,
                color: Colors.purple,
              ),
              title: const Text("CALENDÁRIO"),
              onTap: () {
                // Ir para a página de calendário
                Navigator.pushNamed(context, '/calendarpage');
              },
            ),

            // Review das sessões de estudo
            ListTile(
              leading: const Icon(Icons.edit_document, color: Colors.red),
              title: const Text("REVIEW DE SESSÕES"),
              onTap: () {
                // Ir para a página de review
                Navigator.pushNamed(context, '/reviewpage');
              },
            )
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'Bem-vindo ao FOCUSTUDY!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'Uma ferramenta para gerir o que precisa relacionado com estudos',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            CarouselSlider(
              items: [
                'lib/images/image1.jpg',
                'lib/images/image2.jpg',
                'lib/images/image3.jpg',
                'lib/images/image4.jpg',
              ].map((imagePath) {
                // cada slider
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
            const SizedBox(height: 60),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'Principais Funcionalidades',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 270,
                      height: 320,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/todopage');
                        },
                        child: const Card(
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.done, color: Colors.blue, size: 28),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('Lista de tarefas',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                    'Organize as suas tarefas de estudo de maneira eficiente',
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // Adicionar espaço entre os cards
                  Expanded(
                    child: Container(
                      width: 270,
                      height: 320,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/subjectspage');
                        },
                        child: const Card(
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.book, color: Colors.green, size: 28),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('Disciplinas e Tópicos',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                    'Acompanhe os seus progressos em diferentes disciplinas',
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // Adicionar espaço entre os cards
                  Expanded(
                    child: Container(
                      width: 270,
                      height: 320,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/timerpage');
                        },
                        child: const Card(
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit, color: Colors.orange, size: 28),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('Sessões de Estudos',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                    'Controle as suas sessões de estudo através de timers',
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // Adicionar espaço entre os cards
                  Expanded(
                    child: Container(
                      width: 270,
                      height: 320,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/calendarpage');
                        },
                        child: const Card(
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month,
                                  color: Colors.purple, size: 28),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('Calendário',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                    'Marque datas importantes e mantenha-se organizado',
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // Adicionar espaço entre os cards
                  Expanded(
                    child: Container(
                      width: 270,
                      height: 320,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/reviewpage');
                        },
                        child: const Card(
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit_document,
                                  color: Colors.red, size: 28),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('Review de sessões',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                    'Revise e avalie as suas sessões de estudo',
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'Dicas de Estudo',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Mantenha um ambiente de estudo organizado, faça pausas regulares e utilize técnicas de pomodoro para otimizar o seu tempo de estudo.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: const Color.fromARGB(255, 121, 169, 191),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: const Center(
                child: Text(
                  'FOCUSTUDY - Organize e melhore seus estudos!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
