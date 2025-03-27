import 'package:flutter/material.dart';

class CampusInfo extends StatelessWidget {
  const CampusInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildInfoRow(Icons.location_on, "Campus Location", "Coral Gables, Florida"),
        const SizedBox(height: 20),
        _buildInfoRow(Icons.calendar_today, "Founded", "1925"),
        const SizedBox(height: 20),
        _buildInfoRow(Icons.people, "Student Population", "19,000+"),
        const SizedBox(height: 20),
        _buildInfoRow(Icons.school, "Schools & Colleges", "12"),
        const SizedBox(height: 20),
        _buildInfoRow(Icons.menu_book, "Majors & Programs", "350+"),
      ],
    );
  }
  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 32, color: Colors.green),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 