import 'package:flutter/material.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Hai Andi Lukito!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Baru Daftar Yaa? Kamu Sebagai Apa?',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 30),

              // Card Pelaku Usaha
              _buildRoleCard(
                title: 'Pelaku Usaha',
                imagePath: 'assets/role_usaha.png', 
                roleValue: 'usaha',
              ),

              const SizedBox(height: 20),

              // Card Investor
              _buildRoleCard(
                title: 'Investor',
                imagePath: 'assets/role_investor.png', 
                roleValue: 'investor',
              ),

              const SizedBox(height: 30),
              const Text(
                'MUARA akan membantu mempertemukan pelaku usaha, pelanggan, dan juga investor dalam satu aplikasi!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const Spacer(),

              // Tombol Pilih Sekarang
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: selectedRole == null 
                    ? null 
                    : () {
                        print("Role dipilih: $selectedRole");
                        // Navigasi ke Dashboard/Home setelah pilih role
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E6DFF),
                    disabledBackgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Pilih Sekarang',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({required String title, required String imagePath, required String roleValue}) {
    bool isSelected = selectedRole == roleValue;
    
    return GestureDetector(
      onTap: () => setState(() => selectedRole = roleValue),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFFFC107), // Warna kuning seperti di image_9befb0.png
          borderRadius: BorderRadius.circular(20),
          border: isSelected 
              ? Border.all(color: const Color(0xFF5E6DFF), width: 4) 
              : Border.all(color: Colors.transparent, width: 4),
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            // PROTEKSI GAMBAR: Jika gambar tidak ditemukan, tampilkan icon sementara agar tidak error
            Image.asset(
              imagePath,
              height: 120,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image, size: 100, color: Colors.white);
              },
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF2196F3), // Warna biru label
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 18
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}