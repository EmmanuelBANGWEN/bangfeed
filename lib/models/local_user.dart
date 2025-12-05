class LocalUser {
  final String uid;
  final String email;
  final bool isPremium; // true = premium, false = gratuit

  LocalUser({
    required this.uid,
    required this.email,
    this.isPremium = false,
  });
}
