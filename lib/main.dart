import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Aplicativo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), // Mudança de cor
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Meu Aplicativo Layout'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista de cores para alternar
  final List<Color> _colors = [
    const Color.fromARGB(255, 34, 193, 195), // Cor inicial (verde-água)
    Colors.deepOrangeAccent, // Laranja forte
    Colors.indigoAccent, // Azul índigo
    Colors.amberAccent, // Amarelo dourado
    Colors.purpleAccent, // Roxo claro
  ];

  // Índice da cor atual
  int _currentColorIndex = 0;

  // Função para alterar a cor
  void _changeColor() {
    setState(() {
      // Avança para a próxima cor
      _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Layout Superior (sem sombra, sem fundo)
            const Text(
              'Layout Superior',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20), // Espaçamento entre os layouts

            // "Meu Aplicativo" com sombra e cor de fundo
            Container(
              width: 200, // Tamanho maior para "Meu Aplicativo"
              height: 200,
              decoration: BoxDecoration(
                color: _colors[_currentColorIndex], // Cor dinâmica
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(5, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Meu Aplicativo',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento entre os layouts

            // Layout Inferior (sem sombra, sem fundo)
            const Text(
              'Layout Inferior',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor, // Chama a função de mudar a cor
        tooltip: 'Alterar Cor',
        child: const Icon(Icons.add),
      ),
    );
  }
}

