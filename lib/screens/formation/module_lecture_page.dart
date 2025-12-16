// 📁 lib/screens/formation/module_lecture_page.dart

import 'package:flutter/material.dart';
import '../../services/premium_service.dart';

class ModuleLecturePage extends StatefulWidget {
  final int numeroModule;
  final String titreModule;
  final String contenu;
  final int totalModules;
  final Function(int) onNavigateToModule; // 👈 Callback pour naviguer

  const ModuleLecturePage({
    super.key,
    required this.numeroModule,
    required this.titreModule,
    required this.contenu,
    required this.totalModules,
    required this.onNavigateToModule,
  });

  @override
  State<ModuleLecturePage> createState() => _ModuleLecturePageState();
}

class _ModuleLecturePageState extends State<ModuleLecturePage> {
  final PremiumService _premiumService = PremiumService();
  bool _isPremium = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkPremium();
  }

  Future<void> _checkPremium() async {
    final isPremium = await _premiumService.checkPremiumStatus();
    setState(() {
      _isPremium = isPremium;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFB923C),
        title: Text(
          'Module ${widget.numeroModule}/${widget.totalModules}',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Corps avec le contenu
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge du module
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFB923C).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Module ${widget.numeroModule}',
                      style: const TextStyle(
                        color: Color(0xFFFB923C),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Titre du module
                  Text(
                    widget.titreModule,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4B2E2A),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Contenu du module
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.contenu,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4B2E2A),
                        height: 1.8,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          
          // Bouton "Module suivant" fixe en bas
          if (!_isLoading) _buildBottomButton(),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    final isLastModule = widget.numeroModule >= widget.totalModules;
    final nextModuleNumber = widget.numeroModule + 1;
    final isNextModuleLocked = nextModuleNumber > 3 && !_isPremium;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _handleNextModule(isLastModule, isNextModuleLocked, nextModuleNumber),
            icon: Icon(
              isLastModule ? Icons.check_circle : Icons.arrow_forward,
              color: Colors.white,
            ),
            label: Text(
              isLastModule 
                  ? 'Terminer la formation' 
                  : isNextModuleLocked
                      ? 'Débloquer le module suivant 🔒'
                      : 'Module suivant',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            iconAlignment: IconAlignment.end,
            style: ElevatedButton.styleFrom(
              backgroundColor: isNextModuleLocked 
                  ? const Color(0xFFEA580C) 
                  : const Color(0xFFFB923C),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleNextModule(bool isLastModule, bool isNextModuleLocked, int nextModuleNumber) {
    if (isLastModule) {
      // Dernier module terminé
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🎉 Félicitations ! Formation terminée !'),
          backgroundColor: Color(0xFF10B981),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    if (isNextModuleLocked) {
      // Module suivant verrouillé → Afficher popup Premium
      _showPremiumDialog();
      return;
    }

    // Module suivant accessible → Naviguer
    Navigator.pop(context); // Fermer la page actuelle
    widget.onNavigateToModule(nextModuleNumber); // Ouvrir le module suivant
  }

  void _showPremiumDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: const [
            Icon(Icons.workspace_premium, color: Color(0xFFEA580C), size: 28),
            SizedBox(width: 8),
            Expanded(child: Text('Module Premium')),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ce module fait partie du contenu Premium.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF6E8),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFEA580C).withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Color(0xFFEA580C), size: 18),
                      SizedBox(width: 8),
                      Text('10 modules supplémentaires', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Color(0xFFEA580C), size: 18),
                      SizedBox(width: 8),
                      Text('Certificat de formation', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Color(0xFFEA580C), size: 18),
                      SizedBox(width: 8),
                      Text('Accès illimité', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Seulement 2000 FCFA/mois',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEA580C),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Plus tard'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Navigation vers page de paiement
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Paiement bientôt disponible !'),
                  backgroundColor: Color(0xFFEA580C),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEA580C),
            ),
            child: const Text('Devenir Premium', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}