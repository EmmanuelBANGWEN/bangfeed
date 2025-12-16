import 'package:flutter/material.dart';
import 'package:bangfeed/screens/formation/module_lecture_page.dart';
import 'package:bangfeed/screens/payer.dart';
import 'package:bangfeed/services/premium_service.dart';

class BaseFormationPage extends StatefulWidget {
  final String formationTitre;
  final IconData formationIcon;
  final int totalModules;
  final Map<int, String> titresModules;
final Map<int, String> contenusModules;

  const BaseFormationPage({
    super.key,
    required this.formationTitre,
    required this.formationIcon,
    required this.totalModules,
    required this.titresModules,
    required this.contenusModules,
  });

  @override
  State<BaseFormationPage> createState() => _BaseFormationPageState();
}

class _BaseFormationPageState extends State<BaseFormationPage> {
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
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFFFB923C)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFB923C),
        title: Text(
          widget.formationTitre,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(),
          const SizedBox(height: 20),

          for (int i = 1; i <= widget.totalModules; i++)
            _buildModuleCard(
              context,
              i,
              _getTitreModule(i),
              i <= 2 || _isPremium,
            ),

          const SizedBox(height: 20),
          if (!_isPremium) _buildPremiumCard(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(widget.formationIcon,
              size: 40, color: const Color(0xFFFB923C)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '${widget.totalModules} modules pour maîtriser la formation',
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(
      BuildContext context, int numero, String titre, bool isUnlocked) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: isUnlocked ? 2 : 0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              isUnlocked ? const Color(0xFFFB923C) : Colors.grey,
          child: Text(
            '$numero',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          titre,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isUnlocked ? Colors.black : Colors.grey,
          ),
        ),
        trailing: Icon(
          isUnlocked ? Icons.play_arrow : Icons.lock,
          color:
              isUnlocked ? const Color(0xFFFB923C) : Colors.grey,
        ),
        onTap: isUnlocked
            ? () => _navigateToModule(context, numero, titre)
            : () => _showPremiumDialog(context),
      ),
    );
  }

  void _navigateToModule(
      BuildContext context, int numero, String titre) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ModuleLecturePage(
          numeroModule: numero,
          titreModule: titre,
        contenu: _getContenuModule(numero),
          totalModules: widget.totalModules,
          onNavigateToModule: (nextModuleNumber) {
            final nextTitre = _getTitreModule(nextModuleNumber);
            _navigateToModule(context, nextModuleNumber, nextTitre);
          },
        ),
      ),
    );
  }

  String _getTitreModule(int numero) {
    return widget.titresModules[numero] ?? 'Module $numero';
  }

  Widget _buildPremiumCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEA580C), Color(0xFFFB923C)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.workspace_premium,
              size: 48, color: Colors.white),
          const SizedBox(height: 12),
          const Text(
            'Débloquez tous les modules',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/pay'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFFEA580C),
            ),
            child: const Text('Devenir Premium'),
          ),
        ],
      ),
    );
  }

  void _showPremiumDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Passez Premium'),
        content: const Text(
            'Débloquez tous les modules de cette formation'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pay');
            },
            child: const Text('Devenir Premium'),
          ),
        ],
      ),
    );
  }

String _getContenuModule(int numero) {
  final contenus = widget.contenusModules;
  return contenus[numero] ?? '';
}



}
