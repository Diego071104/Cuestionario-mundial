import 'package:flutter/material.dart';

void main() {
  runApp(const QuinielaApp());
}

class QuinielaApp extends StatelessWidget {
  const QuinielaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiniela Mundial 2026',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const InicioScreen(),
    );
  }
}

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B5D3B),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.sports_soccer,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text(
                'Quiniela Mundial 2026',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Predice resultados, responde preguntas y compite por el primer lugar.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF0B5D3B),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegistroScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Empezar quiniela',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController nombreController = TextEditingController();

  void continuar() {
    final nombre = nombreController.text.trim();

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe tu nombre para continuar')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuinielaScreen(nombre: nombre),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: const Color(0xFF0B5D3B),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Icon(
              Icons.person,
              size: 80,
              color: Color(0xFF0B5D3B),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ingresa tu nombre',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del participante',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: continuar,
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuinielaScreen extends StatefulWidget {
  final String nombre;

  const QuinielaScreen({super.key, required this.nombre});

  @override
  State<QuinielaScreen> createState() => _QuinielaScreenState();
}

class _QuinielaScreenState extends State<QuinielaScreen> {
 final List<Map<String, dynamic>> partidos = [
  {
    'local': 'México',
    'visitante': 'Corea',
    'golesLocalCorrecto': 2,
    'golesVisitanteCorrecto': 1,
  },
  {
    'local': 'Estados Unidos',
    'visitante': 'Paraguay',
    'golesLocalCorrecto': 1,
    'golesVisitanteCorrecto': 1,
  },
  {
    'local': 'Argentina',
    'visitante': 'Austria',
    'golesLocalCorrecto': 3,
    'golesVisitanteCorrecto': 0,
  },
  {
    'local': 'España',
    'visitante': 'Cabo Verde',
    'golesLocalCorrecto': 4,
    'golesVisitanteCorrecto': 0,
  },
];

  final Map<int, TextEditingController> golesLocal = {};
  final Map<int, TextEditingController> golesVisitante = {};

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < partidos.length; i++) {
      golesLocal[i] = TextEditingController();
      golesVisitante[i] = TextEditingController();
    }
  }

void verResultados() {
  int aciertosExactos = 0;
  int partidosContestados = 0;

  for (int i = 0; i < partidos.length; i++) {
    final prediccionLocal = int.tryParse(golesLocal[i]!.text);
    final prediccionVisitante = int.tryParse(golesVisitante[i]!.text);

    if (prediccionLocal != null && prediccionVisitante != null) {
      partidosContestados++;

      if (prediccionLocal == partidos[i]['golesLocalCorrecto'] &&
          prediccionVisitante == partidos[i]['golesVisitanteCorrecto']) {
        aciertosExactos++;
      }
    }
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ResultadosScreen(
        nombre: widget.nombre,
        partidosContestados: partidosContestados,
        totalPartidos: partidos.length,
        aciertosExactos: aciertosExactos,
      ),
    ),
  );
}

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Quiniela'),
        backgroundColor: const Color(0xFF0B5D3B),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Hola, ${widget.nombre}',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Predice los marcadores de los partidos:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),

          for (int i = 0; i < partidos.length; i++)
            Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      '${partidos[i]['local']} vs ${partidos[i]['visitante']}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: golesLocal[i],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: partidos[i]['local'],
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: golesVisitante[i],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: partidos[i]['visitante'],
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: verResultados,
                  icon: const Icon(Icons.emoji_events),
      label: const Text('Ver resultados'),
    ),
  ],
),
);
  }
}

class ResultadosScreen extends StatelessWidget {
  final String nombre;
  final int partidosContestados;
  final int totalPartidos;
  final int aciertosExactos;

  const ResultadosScreen({
    super.key,
    required this.nombre,
    required this.partidosContestados,
    required this.totalPartidos,
    required this.aciertosExactos,

  });

  @override
  Widget build(BuildContext context) {
    final int puntos = aciertosExactos * 3;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        backgroundColor: const Color(0xFF0B5D3B),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.emoji_events,
                    size: 90,
                    color: Colors.amber,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Partidos contestados: $partidosContestados / $totalPartidos',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Aciertos exactos: $aciertosExactos',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Puntos acumulados: $puntos',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B5D3B),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}