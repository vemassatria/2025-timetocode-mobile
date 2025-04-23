import 'package:flutter/material.dart';

class DaftarLevelPage extends StatefulWidget {
  const DaftarLevelPage({super.key});

  @override
  State<DaftarLevelPage> createState() => _DaftarLevelPageState();
}

class _DaftarLevelPageState extends State<DaftarLevelPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Pembelajaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Text('Konsep pemrograman', style: TextStyle()),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          value: 0.4,
                          color: Colors.blueAccent,
                          backgroundColor: Colors.blueGrey,
                        ),
                      ),
                      Text('2/5', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              _buildLevelCard(
                context,
                imagePath: 'assets/images/level1.jpg',
                level: "Level 1 pengenalan pemrograman",
                buttonText: "Mulai",
                status: "Belum Selesai",
                statusColor: Colors.grey[200],
              ),

              const SizedBox(height: 16),

              _buildLevelCard(
                context,
                imagePath: 'assets/images/level2.jpg',
                level: "Level 2 pengenalan pemrograman",
                buttonText: "Mulai",
                status: "Belum Selesai",
                statusColor: Colors.grey[200],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLevelCard(
    BuildContext context, {
    required String imagePath,
    required String level,
    String? status,
    Color? statusColor,
    String buttonText = "mulai",
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (status == null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor ?? Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.check, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text('Done', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            level,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(buttonText),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Informasi Level',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                                  'Sed do eiusmod tempor incididunt ut labore et dolore '
                                  'magna aliqua. Ut enim ad minim veniam, quis nostrud '
                                  'exercitation ullamco laboris nisi ut aliquip ex ea '
                                  'commodo consequat. Duis aute irure dolor in reprehenderit '
                                  'in voluptate velit esse cillum dolore eu fugiat nulla '
                                  'pariatur. Excepteur sint occaecat cupidatat non proident, '
                                  'sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Ok'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  );
                },
                icon: const Icon(Icons.info, color: Colors.deepPurple),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
