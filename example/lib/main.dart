import 'package:flutter/material.dart';
import 'package:linguabound_widget/linguabound_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LinguaboundWidget.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const LinguaboundMaterialApp(home: HomePage());
}

class Data {
  Data({
    required this.label,
    required this.icon,
    this.selected = false,
  });

  final String label;
  final IconData icon;
  bool selected;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Data> _data = [
    Data(label: 'Masih Pemula', icon: Icons.signal_cellular_alt_1_bar),
    Data(label: 'Udah Jago', icon: Icons.signal_cellular_alt_2_bar),
    Data(label: 'Udah Sepuh', icon: Icons.signal_cellular_alt),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Linguabound Widget'),
        ),
        body: ListView(
          children: [
            ..._data.map(
              (e) => Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                child: MyFilledButton.tonal(
                  onPressed: () => setState(() {
                    for (Data data in _data) {
                      if (data.label == e.label) {
                        data.selected = true;
                        continue;
                      }

                      data.selected = false;
                    }
                  }),
                  selected: e.selected,
                  icon: Icon(e.icon),
                  iconColor: const Color(0xFF1899D6),
                  child: Text(e.label),
                ),
              ),
            ),
            const Divider(),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MyFilledButton(
                onPressed: () {},
                foregroundColor: Colors.blue,
                backgroundColor: Colors.yellowAccent,
                borderColor: Colors.deepOrange,
                child: const Text('Press Me!'),
              ),
            ),
          ],
        ),
      );
}
