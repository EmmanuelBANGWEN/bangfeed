import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../services/local_db_service.dart';
import '../services/firestore_service.dart';
import '../models/formulation.dart';

class FormulationProvider with ChangeNotifier {
  final LocalDbService _localDb;
  final FirestoreService? _firestore; // ✅ NULLABLE pour mode offline

  List<Formulation> _formulations = [];
  List<Formulation> get formulations => _formulations;

  // ✅ Getter pour savoir si on est en mode offline
  bool get isOffline => _firestore == null;

  FormulationProvider(this._localDb, this._firestore) {
    _loadLocal();
    // ✅ N'écouter la connectivité que si FirestoreService existe
    if (_firestore != null) {
      startAutoSync();
    } else {
      print('📴 [PROVIDER] Mode offline - synchronisation désactivée');
    }
  }

  // Chargement des formulations depuis Hive
  void _loadLocal() {
    _formulations = _localDb.getAllFormulations();
    print('📦 [PROVIDER] ${_formulations.length} formulations chargées depuis Hive');
    notifyListeners();
  }

  // Ajouter une formulation (Hive + Firestore si disponible)
  Future<void> addFormulation(Formulation f) async {
    try {
      await _localDb.saveFormulation(f);
      _formulations.add(f);
      notifyListeners();
      print('✅ [PROVIDER] Formulation ajoutée localement');

      // ✅ Essayer de sync seulement si online
      if (_firestore != null) {
        await _trySync(f);
      } else {
        print('📴 [PROVIDER] Mode offline - sync différée');
      }
    } catch (e) {
      print('❌ [PROVIDER] Erreur lors de l\'ajout: $e');
      rethrow;
    }
  }

  // Essayer de synchroniser une seule formulation
  Future<void> _trySync(Formulation f) async {
    if (f.isSynced || _firestore == null) return;
    
    try {
      await _firestore?.syncFormulation(f);
      f.isSynced = true;
      await _localDb.getFormulationBox().put(f.key, f);
      notifyListeners();
      print('☁️ [PROVIDER] Formulation synchronisée sur Firestore');
    } catch (e) {
      print('⚠️ [PROVIDER] Erreur de synchronisation: $e');
      // Pas de connexion → sync plus tard
    }
  }

  // Surveille la connexion internet pour synchroniser automatiquement
  void startAutoSync() {
    if (_firestore == null) return; // ✅ Protection supplémentaire
    
    final connectivity = Connectivity();

    connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      if (results.isNotEmpty && results.first != ConnectivityResult.none) {
        print('🌐 [PROVIDER] Connexion détectée - synchronisation...');
        _syncPendingFormulations();
      }
    });
  }

  // Synchronisation des formulations non encore synchronisées
  Future<void> _syncPendingFormulations() async {
    if (_firestore == null) {
      print('📴 [PROVIDER] Pas de FirestoreService - sync impossible');
      return;
    }

    final pending = _formulations.where((f) => !f.isSynced).toList();
    
    if (pending.isEmpty) {
      print('✅ [PROVIDER] Aucune formulation en attente de sync');
      return;
    }

    print('⏳ [PROVIDER] Synchronisation de ${pending.length} formulation(s)...');
    
    for (var f in pending) {
      try {
        await _firestore?.syncFormulation(f);
        f.isSynced = true;
        await _localDb.getFormulationBox().put(f.key, f);
        print('✅ [PROVIDER] Formulation ${f.key} synchronisée');
      } catch (e) {
        print('⚠️ [PROVIDER] Erreur sync pending: $e');
        // Connexion instable → on réessaie plus tard
      }
    }
    
    if (pending.isNotEmpty) {
      notifyListeners();
    }
  }

  // Méthode utile pour forcer une synchronisation manuelle
  Future<void> forceSyncAll() async {
    if (_firestore == null) {
      print('📴 [PROVIDER] Mode offline - impossible de synchroniser');
      return;
    }
    await _syncPendingFormulations();
  }

  // Supprimer une formulation
  Future<void> deleteFormulation(Formulation f) async {
    try {
      // ✅ Supprimer de Firestore seulement si online ET synchronisé
      if (_firestore != null && f.isSynced) {
        try {
          await _firestore?.deleteFormulation(f);
          print('☁️ [PROVIDER] Formulation supprimée de Firestore');
        } catch (e) {
          print('⚠️ [PROVIDER] Erreur suppression Firestore: $e');
          // Continue quand même pour supprimer localement
        }
      }
      
      // Supprimer de Hive
      await _localDb.deleteFormulation(f);
      print('✅ [PROVIDER] Formulation supprimée localement');
      
      // Retirer de la liste
      _formulations.remove(f);
      notifyListeners();
    } catch (e) {
      print('❌ [PROVIDER] Erreur lors de la suppression: $e');
      rethrow;
    }
  }

  // ✅ BONUS: Méthode pour mettre à jour une formulation
  Future<void> updateFormulation(Formulation f) async {
    try {
      // Mettre à jour dans Hive
      await _localDb.saveFormulation(f);
      print('✅ [PROVIDER] Formulation mise à jour localement');
      
      // Si elle était déjà synchronisée, marquer comme non synchronisée
      if (f.isSynced) {
        f.isSynced = false;
        await _localDb.getFormulationBox().put(f.key, f);
      }
      
      // Essayer de sync si online
      if (_firestore != null) {
        await _trySync(f);
      }
      
      // Recharger la liste
      _loadLocal();
    } catch (e) {
      print('❌ [PROVIDER] Erreur lors de la mise à jour: $e');
      rethrow;
    }
  }

  // ✅ BONUS: Obtenir le nombre de formulations non synchronisées
  int get pendingSyncCount => _formulations.where((f) => !f.isSynced).length;
}