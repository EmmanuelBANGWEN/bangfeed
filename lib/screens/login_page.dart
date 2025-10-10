import 'package:bangfeed/screens/register.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../services/local_db_service.dart';
// import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ✅ FirebaseAuth nullable pour mode offline
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // ✅ Initialiser FirebaseAuth seulement si pas offline
    final isOffline = Provider.of<bool>(context, listen: false);
    if (!isOffline) {
      try {
      } catch (e) {
        print('⚠️ [LOGIN] FirebaseAuth non disponible: $e');
      }
    } else {
      print('📴 [LOGIN] Mode offline - FirebaseAuth désactivé');
    }
  }

  void _login() async {
    setState(() => _isLoading = true);
    
    try {
      final localDb = Provider.of<LocalDbService>(context, listen: false);
      final isOffline = Provider.of<bool>(context, listen: false);
      final authService = AuthService(localDb, isOfflineMode: isOffline);

      // ✅ Utiliser AuthService qui gère offline/online
      await authService.signIn(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      // ✅ AuthWrapper gère la navigation automatiquement via le Stream
      // Pas besoin de Navigator.pushReplacement ici
      
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur de connexion: ${e.toString().replaceAll("Exception: ", "")}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
    
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  void _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegisterPage()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isOffline = Provider.of<bool>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
        actions: [
          // ✅ Indicateur de statut dans l'AppBar
          if (isOffline)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.cloud_off, size: 20, color: Colors.orange[300]),
                    const SizedBox(width: 8),
                    const Text(
                      'Hors ligne',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ✅ Bandeau d'avertissement mode offline
            if (isOffline)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange[700]),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Mode hors ligne actif\nConnexion limitée aux comptes locaux',
                        style: TextStyle(
                          color: Colors.orange[900],
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      ElevatedButton(
                        onPressed: _login,
                        child: const Text('Se connecter'),
                      ),
                      // ✅ Désactiver l'inscription en mode offline
                      TextButton(
                        onPressed: isOffline ? null : _goToRegister,
                        child: Text(
                          'Pas encore de compte ? S\'inscrire',
                          style: TextStyle(
                            color: isOffline ? Colors.grey : null,
                          ),
                        ),
                      ),
                      if (isOffline)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Inscription disponible en ligne uniquement',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}