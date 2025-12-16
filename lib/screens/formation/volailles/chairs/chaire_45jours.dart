import 'package:bangfeed/screens/formation/base_formation_page.dart';
import 'package:flutter/material.dart';

class PouletDeChair45joursPage extends StatelessWidget {
  const PouletDeChair45joursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseFormationPage(
      formationTitre: 'Poulet de chair : 45 jours',
      formationIcon: Icons.egg_alt,
      totalModules: 10,
      titresModules: {
        1: 'Préparation du poulailler',
        2: 'Accueil des poussins',
        3: 'Température et ventilation',
        4: 'Programme alimentaire',
        5: 'Gestion de l’eau',
        6: 'Croissance rapide',
        7: 'Prévention des maladies',
        8: 'Biosécurité de base',
        9: 'Abattage et rendement',
        10: 'Calcul de rentabilité',
      },
      contenusModules: {
1: '''🏠 Préparation du poulailler : la base du succès en 45 jours

La réussite d’un élevage de poulets de chair commence bien avant l’arrivée des poussins. Un poulailler mal préparé entraîne des pertes importantes dès les premiers jours.

### 1. Importance de la préparation
Un bon poulailler permet :
- Une croissance rapide
- Une réduction des maladies
- Une meilleure conversion alimentaire

### 2. Nettoyage et désinfection
Avant chaque bande :
- Retirer toute la litière usagée
- Laver le sol et les murs
- Désinfecter avec un produit adapté
- Laisser sécher au moins 48 heures

### 3. Choix de la litière
La litière doit être :
- Propre
- Sèche
- Absorbante

Les plus utilisées sont :
- Copeaux de bois
- Balles de riz
- Sciure sèche

### 4. Aménagement intérieur
Prévoir :
- Mangeoires adaptées
- Abreuvoirs propres
- Espace suffisant pour éviter le stress

### 5. Densité recommandée
La densité idéale est de :
- 10 à 12 poulets/m²

🔑 À retenir :
Un poulailler bien préparé, c’est déjà 50 % du succès.''',


2: '''🐣 Accueil des poussins : les 7 jours les plus critiques

Les premiers jours déterminent la survie et la performance future des poulets de chair.

### 1. Réception des poussins
À l’arrivée :
- Vérifier la vivacité
- Observer le plumage
- Éliminer les poussins faibles

### 2. Eau immédiate
Les poussins doivent boire dans les 30 premières minutes.
Ajouter :
- Sucre ou glucose
- Vitamines

### 3. Démarrage alimentaire
Distribuer un aliment démarrage riche en protéines :
- 22 à 23 % de protéines

### 4. Observation quotidienne
Surveiller :
- Regroupement sous la chaleur
- Cris anormaux
- Faible consommation

### 5. Mortalité acceptable
Une mortalité < 2 % sur 7 jours est normale.

🔑 À retenir :
Un bon accueil évite les pertes invisibles.''',


3: '''🌡️ Température et ventilation : maîtriser le climat

Le poulet de chair est très sensible aux variations de température.

### 1. Température recommandée
- Jours 1–3 : 32–34°C
- Réduction progressive de 2–3°C/semaine
- Fin de cycle : 22–24°C

### 2. Signes de mauvaise température
- Trop froid : poussins regroupés
- Trop chaud : poussins écartés, haletants

### 3. Ventilation
La ventilation permet :
- Élimination de l’ammoniac
- Apport d’oxygène
- Réduction de l’humidité

### 4. Ventilation naturelle vs mécanique
Toujours éviter les courants d’air directs.

🔑 À retenir :
Un bon climat = croissance rapide.''',



4: '''🌾 Programme alimentaire : nourrir pour grandir vite

L’alimentation représente jusqu’à 70 % du coût de production.

### 1. Les phases alimentaires
- Démarrage : 0–14 jours
- Croissance : 15–28 jours
- Finition : 29–45 jours

### 2. Qualité de l’aliment
Un bon aliment doit être :
- Frais
- Bien formulé
- Sans moisissure

### 3. Distribution
- Aliment disponible en permanence
- Ajuster la hauteur des mangeoires

### 4. Consommation moyenne
Un poulet consomme environ 4 à 5 kg d’aliment en 45 jours.

🔑 À retenir :
Un bon aliment = poids élevé en moins de temps.''',



5: '''💧 Gestion de l’eau : souvent négligée, toujours vitale

Sans eau, pas de croissance, même avec un bon aliment.

### 1. Qualité de l’eau
L’eau doit être :
- Propre
- Claire
- Sans odeur

### 2. Quantité
Un poulet boit environ 2 fois plus d’eau que d’aliment consommé.

### 3. Nettoyage des abreuvoirs
À nettoyer :
- Chaque jour
- Sans détergent agressif

### 4. Impact sur la croissance
Une eau sale réduit :
- La consommation alimentaire
- Le poids final

🔑 À retenir :
L’eau est le premier aliment du poulet.''',



6: '''📈 Croissance rapide : atteindre le poids optimal en 45 jours

La croissance rapide est l’objectif principal du poulet de chair. Un bon suivi permet d’atteindre 2 à 2,5 kg en seulement 45 jours.

### 1. Comprendre la croissance
La croissance dépend de :
- La génétique
- L’alimentation
- Le climat
- La gestion quotidienne

### 2. Suivi du poids
Il est important de :
- Peser un échantillon chaque semaine
- Comparer avec les standards
- Corriger rapidement les écarts

### 3. Réduction du stress
Le stress ralentit fortement la croissance.
Éviter :
- Le bruit excessif
- Les manipulations inutiles
- Les changements brusques d’aliment

### 4. Uniformité du lot
Un bon lot est homogène.
Une mauvaise uniformité indique :
- Problème d’alimentation
- Mauvais accès à l’eau
- Stress thermique

🔑 À retenir :
Croissance rapide rime avec régularité et discipline.''',




7: '''🦠 Prévention des maladies : mieux vaut prévenir que guérir

Les maladies peuvent anéantir une bande entière en quelques jours. La prévention est donc essentielle.

### 1. Maladies courantes
- Maladie de Newcastle
- Gumboro
- Coccidiose
- Infections respiratoires

### 2. Programme de vaccination
Respecter strictement :
- Les dates
- Les doses
- Les conditions de conservation

### 3. Observation quotidienne
Surveiller :
- Perte d’appétit
- Plumage terne
- Diarrhées
- Boiteries

### 4. Isolement
Tout sujet malade doit être isolé immédiatement.

🔑 À retenir :
Une maladie détectée tôt coûte moins cher.''',




8: '''🔒 Biosécurité de base : protéger l’élevage

La biosécurité empêche l’introduction et la propagation des maladies.

### 1. Contrôle des accès
Limiter :
- Les visiteurs
- Les entrées inutiles

### 2. Hygiène du personnel
- Bottes dédiées
- Lavage des mains
- Désinfection régulière

### 3. Matériel
Ne jamais partager :
- Mangeoires
- Abreuvoirs
- Caisses de transport

### 4. Gestion des cadavres
Élimination rapide et sécurisée.

🔑 À retenir :
La biosécurité est une assurance invisible.''',




9: '''🔪 Abattage et rendement : valoriser chaque poulet

Un bon abattage garantit une viande de qualité et moins de pertes.

### 1. Âge idéal d’abattage
Entre 42 et 45 jours selon :
- Le poids
- Le marché

### 2. Préparation à l’abattage
- Jeûne de 8 à 10 heures
- Accès à l’eau maintenu

### 3. Rendement carcasse
Un bon rendement est :
- 70 à 75 % du poids vif

### 4. Conservation
- Refroidissement rapide
- Respect de la chaîne du froid

🔑 À retenir :
Un bon rendement augmente directement le profit.''',




10: '''💰 Calcul de rentabilité : transformer l’effort en profit

La rentabilité est la finalité de l’élevage de poulet de chair.

### 1. Coûts principaux
- Achat des poussins
- Alimentation (poste principal)
- Vaccins et soins
- Main-d’œuvre

### 2. Coût de production
Calculer :
Coût total ÷ nombre de poulets vendus

### 3. Prix de vente
Le prix doit couvrir :
- Les charges
- Une marge bénéficiaire

### 4. Facteurs d’amélioration
- Réduction de la mortalité
- Meilleur indice de consommation
- Vente au bon moment

🔑 À retenir :
Un élevage rentable est un élevage bien calculé.''',















      },
    );
  }
}
