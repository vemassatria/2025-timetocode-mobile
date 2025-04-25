import 'package:flutter/material.dart';
import 'package:timetocode/themes/colors.dart';
import 'pengaturan.dart';

class DaftarLevelPage extends StatelessWidget {
  const DaftarLevelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalLevel = 6;
    int completedLevel = 1;
    final double progress = completedLevel / totalLevel;

    return Scaffold(
      // backgroundImage
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  AppBar(
                    title: const Text(
                      'Konsep Pemrograman',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    actions: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              value: progress,
                              color: AppColors.deepAzure,
                              backgroundColor: AppColors.gray1,
                              padding: EdgeInsets.all(4),
                            ),
                          ),
                          Text(
                            '$completedLevel/$totalLevel',
                            style: const TextStyle(color: AppColors.white),
                          ),
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
                    statusColor: AppColors.gray1,
                  ),
                  const SizedBox(height: 20),
                  _buildLevelCard(
                    context,
                    imagePath: 'assets/images/level2.jpg',
                    level: "Level 2 pengenalan pemrograman",
                    buttonText: "Mulai",
                    status: "Belum Selesai",
                    statusColor: AppColors.gray1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // bottom nav tanpa state
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const PengaturanPage()),
            );
          }
        },
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
    );
  }

  Widget _buildLevelCard(
    BuildContext context, {
    required String imagePath,
    required String level,
    String? status,
    Color statusColor = AppColors.xpGreen,
    String buttonText = "Mulai",
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 32, 79),
        borderRadius: BorderRadius.circular(8),
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
                      color: statusColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.check, color: AppColors.white, size: 16),
                        SizedBox(width: 4),
                        Text('Done', style: TextStyle(color: AppColors.white)),
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
              color: AppColors.white,
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
                    backgroundColor: AppColors.technoBlue,
                    foregroundColor: AppColors.white,
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
                icon: Container(
                  decoration: BoxDecoration(
                    color: AppColors.royalIndigo,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.info, color: AppColors.black1),
                ),
                onPressed:
                    () => showDialog(
                      context: context,
                      builder:
                          (_) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: const BorderSide(
                                color: AppColors.white,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Informasi Level',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: AppColors.white),
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
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
