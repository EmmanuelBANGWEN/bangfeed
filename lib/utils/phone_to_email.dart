// String phoneToPseudoEmail(String phone) {
//   // Garde seulement les chiffres (et le + si tu veux). Ici on enlève tout sauf les chiffres.
//   final digits = phone.replaceAll(RegExp(r'\D'), '');
//   // Préfixe pour éviter collisions et domaine local
//   return '$digits@bangfeed.local';
// }

String phoneToPseudoEmail(String phone) {
  // Normalisation : garde seulement les chiffres (retire espaces, tirets, +, etc.)
  final digits = phone.trim().replaceAll(RegExp(r'\D'), '');
  
  // Validation minimale
  if (digits.isEmpty) {
    throw Exception('Numéro de téléphone invalide');
  }
  
  return '$digits@bangfeed.local';
}