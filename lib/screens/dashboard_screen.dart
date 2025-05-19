import 'package:flutter/material.dart';
import '../Services/firebase_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> _logout() async {
    await _firebaseService.logout();
    // Verifica si el widget aún está montado antes de navegar
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout, // Llama al método _logout
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome to Inventory App', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Sales: \$0', style: TextStyle(fontSize: 18)),
            const Text('Profits: \$0', style: TextStyle(fontSize: 18)),
            const Text('Inventory Items: 0', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to inventory management screen (to be implemented)
              },
              child: const Text('Manage Inventory'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to sales management screen (to be implemented)
              },
              child: const Text('Manage Sales'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to purchases management screen (to be implemented)
              },
              child: const Text('Manage Purchases'),
            ),
          ],
        ),
      ),
    );
  }
}