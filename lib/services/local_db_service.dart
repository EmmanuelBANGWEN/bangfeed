import 'package:hive_flutter/hive_flutter.dart';
import '../models/formulation.dart';
import '../models/ingredient.dart';

class LocalDbService {
  static const String formulationBoxName = 'formulations';
  static const String ingredientBoxName = 'ingredients';
  static const String settingsBoxName = 'settings';

  late Box<Formulation> _formulationBox;
  late Box<Ingredient> _ingredientBox;
  late Box _settingsBox;

  Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(IngredientAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(FormulationAdapter());
    }

    _formulationBox = await Hive.openBox<Formulation>(formulationBoxName);
    _ingredientBox = await Hive.openBox<Ingredient>(ingredientBoxName);
    _settingsBox = await Hive.openBox(settingsBoxName);
  }

  bool getIsLoggedIn() => _settingsBox.get('isLoggedIn', defaultValue: false);
  Future<void> setIsLoggedIn(bool value) async => await _settingsBox.put('isLoggedIn', value);

  Box<Formulation> getFormulationBox() => _formulationBox;
  Future<void> saveFormulation(Formulation f) async => await _formulationBox.add(f);
  List<Formulation> getAllFormulations() => _formulationBox.values.toList();
  Future<void> deleteFormulation(Formulation f) async => await _formulationBox.delete(f.key);

  Box<Ingredient> getIngredientBox() => _ingredientBox;
  Future<void> saveIngredient(Ingredient i) async => await _ingredientBox.add(i);
  List<Ingredient> getAllIngredients() => _ingredientBox.values.toList();
}
