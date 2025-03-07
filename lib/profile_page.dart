import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan foto profil
            Container(
              color: Colors.green.shade50,
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/rama.jpg"),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Rama Sandhy Muhammad',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Pecinta Kuliner Indonesia',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Informasi Detail
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Tentang Saya'),
                  _buildInfoItem('Email', 'rshandy07@gmail.com'),
                  _buildInfoItem('Lokasi', 'Pacitan, Indonesia'),
                  _buildInfoItem('Bergabung Sejak', 'Agustus 1945'),

                  SizedBox(height: 20),
                  _buildSectionTitle('Spesialisasi'),
                  _buildSpecialitiesList(),

                  SizedBox(height: 20),
                  _buildSectionTitle('Statistik'),
                  _buildStatistics(),

                  SizedBox(height: 20),
                  _buildSectionTitle('Kontak'),
                  _buildSocialMediaLinks(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
        Divider(thickness: 1.5, color: Colors.green.shade200),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialitiesList() {
    final specialities = [
      'Masakan Tradisional Indonesia',
      'Kuliner Jawa',
      'Street Food',
      'Fotografi Makanan'
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: specialities.map((specialty) {
        return Chip(
          label: Text(specialty),
          backgroundColor: Colors.green.shade100,
          labelStyle: TextStyle(color: Colors.green.shade800),
        );
      }).toList(),
    );
  }

  Widget _buildStatistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem('Resep', '24'),
        _buildStatItem('Pengikut', '358'),
        _buildStatItem('Mengikuti', '145'),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialMediaLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(Icons.language, 'Website'),
        _buildSocialButton(Icons.camera_alt_outlined, 'Instagram'),
        _buildSocialButton(Icons.play_circle_outline, 'YouTube'),
        _buildSocialButton(Icons.facebook, 'Facebook'),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 30),
          color: Colors.green.shade700,
          onPressed: () {},
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
