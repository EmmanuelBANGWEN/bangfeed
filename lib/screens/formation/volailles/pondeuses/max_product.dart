import 'package:bangfeed/screens/formation/base_formation_page.dart';
import 'package:flutter/material.dart';

class PondeuseMaxProductPage extends StatelessWidget {
  const PondeuseMaxProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseFormationPage(
      formationTitre: 'Poules pondeuses',
      formationIcon: Icons.egg,
      totalModules: 13,
      titresModules: {
        1: 'Démarrage et poulettes',
        2: 'Programme lumineux optimal',
        3: 'Alimentation pour la ponte',
        4: 'Gestion de la chaleur',
        5: 'Qualité des œufs',
        6: 'Santé et prévention',
        7: 'Gestion de la mue',
        8: 'Rentabilité',
        9: 'Commercialisation',
        10: 'Tri et classification',
        11: 'Réforme des pondeuses',
        12: 'Gestion des déchets',
        13: 'Optimisation globale',
      },
      contenusModules: {
1: '''🐣 Démarrage et poulettes : bâtir la future championne de ponte

Le démarrage est la phase la plus déterminante dans la carrière d’une poule pondeuse. Une poulette bien élevée produira plus d’œufs, plus longtemps, avec une meilleure qualité.

### 1. Importance du démarrage
Les 6 premières semaines influencent :
- Le poids adulte
- La maturité sexuelle
- Le pic de ponte
- La durée de production

### 2. Accueil des poussins
Avant l’arrivée :
- Désinfecter le bâtiment
- Installer la litière propre
- Préparer eau et aliment

À l’arrivée :
- Eau tiède + vitamines
- Aliment démarrage riche en protéines

### 3. Température et ambiance
- Jours 1–3 : 32–34°C
- Réduction progressive chaque semaine
- Observer le comportement des poussins

### 4. Croissance des poulettes
Objectif :
- Croissance régulière
- Uniformité du lot (>85%)

### 5. Erreurs à éviter
- Sous-alimentation
- Stress thermique
- Mauvaise hygiène

🔑 À retenir :
Une poulette ratée ne rattrape jamais son retard.''',



2: '''💡 Programme lumineux optimal : commander la ponte par la lumière

La lumière agit directement sur les hormones responsables de la ponte. Un mauvais programme lumineux entraîne une production irrégulière.

### 1. Rôle de la lumière
La lumière influence :
- L’entrée en ponte
- Le pic de production
- La durée de ponte

### 2. Phase d’élevage
- 0–6 semaines : lumière forte et longue
- 7–17 semaines : réduction progressive

### 3. Entrée en ponte
À partir de 18 semaines :
- Augmenter progressivement jusqu’à 16 h/jour
- Jamais réduire la lumière en ponte

### 4. Qualité de l’éclairage
- Intensité homogène
- Lampes bien réparties

🔑 À retenir :
La lumière est un interrupteur hormonal.''',



3: '''🌾 Alimentation pour la ponte : nourrir pour produire des œufs

Une poule pondeuse transforme directement l’aliment en œufs. Toute carence se reflète immédiatement sur la production.

### 1. Besoins nutritionnels
- Protéines : 16–18 %
- Calcium : 3,5–4 %
- Énergie : 2 700–2 800 kcal/kg

### 2. Consommation quotidienne
- 110 à 120 g/poule/jour

### 3. Importance du calcium
Un déficit entraîne :
- Coquilles fragiles
- Baisse de ponte

### 4. Distribution
- Aliment toujours disponible
- Mangeoires bien réglées

🔑 À retenir :
Une bonne ponte commence dans la mangeoire.''',




4: '''🌡️ Gestion de la chaleur : protéger la production

La chaleur excessive est l’ennemi numéro un des pondeuses sous climat tropical.

### 1. Effets du stress thermique
- Baisse de consommation
- Chute de ponte
- Coquilles fines

### 2. Température idéale
- 18–25°C

### 3. Moyens de lutte
- Ventilation naturelle
- Ombre et isolation
- Eau fraîche disponible

### 4. Ajustement alimentaire
- Distribution aux heures fraîches
- Supplémentation vitaminique

🔑 À retenir :
La chaleur mal gérée coûte cher.''',




5: '''🥚 Qualité des œufs : produire des œufs qui se vendent bien

La qualité des œufs détermine leur valeur marchande.

### 1. Critères de qualité
- Coquille solide
- Forme régulière
- Couleur du jaune
- Propreté

### 2. Causes des œufs défectueux
- Carences nutritionnelles
- Stress
- Maladies

### 3. Collecte des œufs
- 2 à 3 fois par jour
- Manipulation douce

### 4. Stockage
- Endroit frais
- Bonne ventilation

🔑 À retenir :
Un œuf de qualité se vend mieux et plus cher.''',




6: '''🩺 Santé et prévention : protéger la performance du troupeau

La santé est un pilier fondamental de la productivité en élevage de poules pondeuses. Une poule malade pond moins, consomme mal et peut contaminer tout le lot.

### 1. Importance de la prévention
La prévention permet :
- De réduire la mortalité
- D’éviter les chutes brutales de ponte
- De limiter les dépenses vétérinaires

### 2. Maladies fréquentes chez les pondeuses
- Maladie de Newcastle
- Bronchite infectieuse
- Gumboro
- Coccidiose
- Infections bactériennes

### 3. Programme de vaccination
Un programme bien respecté est indispensable :
- Vaccins adaptés à la zone
- Respect des âges
- Bonne conservation des vaccins

### 4. Observation quotidienne
Chaque jour, l’éleveur doit surveiller :
- Appétit
- Comportement
- Aspect des fientes
- Qualité des œufs

### 5. Gestion des malades
- Isolement immédiat
- Désinfection du matériel
- Consultation vétérinaire si nécessaire

🔑 À retenir :
Une maladie prévenue coûte toujours moins cher qu’une maladie soignée.''',


7: '''🔄 Gestion de la mue : relancer la production intelligemment

La mue est une phase naturelle durant laquelle la poule renouvelle son plumage et suspend temporairement la ponte.

### 1. Comprendre la mue
La mue peut être :
- Naturelle (âge, stress)
- Induite (gestion volontaire)

### 2. Effets sur la ponte
Pendant la mue :
- Arrêt ou forte baisse de ponte
- Perte de poids
- Renouvellement du plumage

### 3. Gestion nutritionnelle
Adapter l’alimentation :
- Réduire l’énergie
- Augmenter les protéines
- Apport de vitamines et minéraux

### 4. Redémarrage de la ponte
Après la mue :
- Augmentation progressive de la lumière
- Retour à l’aliment ponte

🔑 À retenir :
Une mue bien gérée prolonge la carrière de la pondeuse.''',



8: '''💰 Rentabilité : transformer les œufs en revenus durables

La rentabilité est l’objectif final de tout élevage de poules pondeuses.

### 1. Principaux coûts
- Aliment (poste le plus élevé)
- Achat des poulettes
- Soins vétérinaires
- Main-d’œuvre

### 2. Calcul du coût de production
Coût total ÷ nombre d’œufs produits

### 3. Amélioration de la rentabilité
- Réduction des pertes
- Amélioration du taux de ponte
- Optimisation de l’alimentation

### 4. Indicateurs clés
- Taux de ponte (>90 % au pic)
- Consommation journalière
- Mortalité

🔑 À retenir :
Un élevage rentable est un élevage bien suivi.''',


9: '''📦 Commercialisation : vendre mieux pour gagner plus

Produire des œufs est une chose, bien les vendre en est une autre.

### 1. Connaître son marché
- Œufs de consommation
- Œufs de reproduction
- Marchés locaux et urbains

### 2. Présentation du produit
- Œufs propres
- Calibrage régulier
- Emballages attractifs

### 3. Fixation du prix
Le prix doit tenir compte :
- Du coût de production
- De la concurrence
- De la saison

### 4. Fidélisation des clients
- Qualité constante
- Livraison régulière
- Bonne communication

🔑 À retenir :
Un bon produit mal vendu rapporte peu.''',



10: '''📊 Tri et classification des œufs : valoriser chaque production

Le tri et la classification des œufs permettent d’augmenter leur valeur commerciale et d’éviter les pertes financières. Tous les œufs n’ont pas la même valeur sur le marché.

### 1. Pourquoi trier les œufs
Le tri permet :
- De séparer les œufs vendables des œufs défectueux
- D’adapter le prix selon la qualité
- De satisfaire les exigences du marché

### 2. Critères de classification
Les principaux critères sont :
- Poids (petit, moyen, gros)
- État de la coquille
- Propreté
- Forme

### 3. Œufs non conformes
Les œufs fissurés, sales ou déformés doivent être :
- Écartés de la vente directe
- Utilisés pour la consommation interne ou transformés

### 4. Organisation du tri
Le tri doit être :
- Régulier (quotidien)
- Réalisé avec soin
- Dans un endroit propre et ventilé

🔑 À retenir :
Un œuf bien classé se vend plus facilement et plus cher.''',



11: '''🔄 Réforme des pondeuses : savoir quand arrêter

La réforme consiste à retirer du troupeau les poules devenues peu productives. Une réforme bien planifiée améliore la rentabilité globale de l’élevage.

### 1. Pourquoi réformer
Avec l’âge :
- La ponte diminue
- La qualité des œufs baisse
- Les coûts augmentent

### 2. Moment idéal de la réforme
La réforme intervient généralement :
- Après 72 à 80 semaines de production
- Lorsque le taux de ponte chute durablement

### 3. Critères de réforme
- Faible production
- Maladies répétées
- Mauvaise conformation

### 4. Valorisation des poules réformées
Les poules peuvent être :
- Vendues pour la viande
- Utilisées pour la consommation familiale

🔑 À retenir :
Réformer au bon moment évite les pertes inutiles.''',



12: '''♻️ Gestion des déchets : transformer un problème en ressource

Les déchets d’élevage peuvent devenir une source de valeur s’ils sont bien gérés.

### 1. Types de déchets
- Fientes
- Litière usagée
- Coquilles d’œufs

### 2. Risques liés aux déchets
- Pollution
- Propagation des maladies
- Mauvaises odeurs

### 3. Méthodes de gestion
- Compostage
- Utilisation comme fertilisant
- Évacuation contrôlée

### 4. Avantages économiques
- Réduction des coûts
- Amélioration des sols agricoles

🔑 À retenir :
Un déchet bien géré devient une opportunité.''',



13: '''🚀 Optimisation globale : passer de bon éleveur à expert

L’optimisation globale consiste à améliorer tous les aspects de l’élevage pour atteindre une performance durable.

### 1. Suivi des indicateurs clés
- Taux de ponte
- Consommation alimentaire
- Mortalité
- Qualité des œufs

### 2. Organisation du travail
- Planning quotidien
- Répartition des tâches
- Formation continue

### 3. Adaptation au marché
- Suivi des prix
- Évolution des demandes
- Innovation dans la vente

### 4. Vision long terme
Un élevage performant :
- Anticipe les risques
- Investit intelligemment
- S’améliore en continu

🔑 À retenir :
L’excellence est une somme de petits détails maîtrisés.''',






















      },
    );
  }
}
