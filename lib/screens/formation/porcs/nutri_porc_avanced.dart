import 'package:bangfeed/screens/formation/base_formation_page.dart';
import 'package:flutter/material.dart';

class NutritionPorcineAvancedPage extends StatelessWidget {
  const NutritionPorcineAvancedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseFormationPage(
      formationTitre: 'Nutrition porcine avancée',
      formationIcon: Icons.science,
      totalModules: 15,
      titresModules: {
        1: 'Bases de la nutrition porcine',
        2: 'Besoins nutritionnels par âge',
        3: 'Énergie et protéines',
        4: 'Minéraux et vitamines',
        5: 'Ingrédients locaux',
        6: 'Formulation des rations',
        7: 'Alimentation des porcelets',
        8: 'Alimentation des porcs à l’engraissement',
        9: 'Nutrition des truies gestantes',
        10: 'Nutrition des truies allaitantes',
        11: 'Indice de consommation',
        12: 'Réduction des coûts alimentaires',
        13: 'Erreurs courantes',
        14: 'Cas pratiques',
        15: 'Stratégies de rentabilité',
      },
      contenusModules: {

1: '''🐷 Bases de la nutrition porcine : comprendre pour mieux nourrir

La nutrition est le pilier central de la performance en élevage porcin. Plus de 65 % du coût total de production d’un porc provient de l’alimentation. Une mauvaise stratégie nutritionnelle entraîne une croissance lente, une mortalité élevée, des maladies fréquentes et une faible rentabilité. À l’inverse, une alimentation bien maîtrisée permet d’optimiser la croissance, d’améliorer la conversion alimentaire et d’augmenter significativement les marges de l’éleveur.

### 1. Rôle fondamental de l’alimentation
Le porc est un animal monogastrique, comme l’homme. Il ne peut pas valoriser efficacement les fibres grossières et dépend fortement de la qualité des aliments qui lui sont fournis. Son alimentation doit couvrir quatre fonctions essentielles :
- Fournir de l’énergie pour l’entretien et la croissance
- Apporter des protéines pour la construction musculaire
- Assurer l’apport en minéraux et vitamines pour la santé
- Soutenir le système immunitaire

### 2. Comprendre la digestion du porc
La digestion du porc commence dans la bouche par une mastication limitée, puis se poursuit dans l’estomac où les protéines sont partiellement dégradées. L’intestin grêle est le principal lieu d’absorption des nutriments (acides aminés, glucose, lipides). Le gros intestin a un rôle secondaire, avec une fermentation limitée des fibres.

Cette physiologie impose une alimentation :
- Hautement digestible
- Faible en fibres grossières
- Équilibrée en acides aminés essentiels

### 3. Notion d’aliment équilibré
Un aliment équilibré est un aliment qui apporte tous les nutriments nécessaires dans les bonnes proportions, sans excès ni carence. Les principaux composants sont :
- Énergie (maïs, sorgho, manioc)
- Protéines (soja, arachide, coton traité)
- Minéraux (calcium, phosphore, sel)
- Vitamines (A, D, E, B)

Un excès de protéines, par exemple, augmente les coûts et pollue l’environnement, tandis qu’une carence entraîne un retard de croissance.

### 4. Alimentation et performance zootechnique
La performance d’un porc se mesure par :
- Le gain moyen quotidien (GMQ)
- L’indice de consommation (IC)
- L’âge à l’abattage
- Le taux de mortalité

Une alimentation mal formulée augmente l’IC (plus d’aliment pour moins de viande) et réduit la rentabilité globale de l’élevage.

### 5. Nutrition et santé
Une bonne nutrition renforce l’immunité naturelle du porc. Les carences en vitamines ou minéraux rendent les animaux plus sensibles aux maladies, augmentent les frais vétérinaires et réduisent les performances.

🔑 À retenir :
La nutrition porcine n’est pas seulement nourrir les animaux, c’est une stratégie économique. Comprendre les bases est indispensable avant de passer à la formulation avancée.''',


2: '''📊 Besoins nutritionnels par âge : nourrir juste au bon moment

Les besoins nutritionnels du porc évoluent fortement avec l’âge, le poids et le stade physiologique. Une erreur fréquente consiste à donner le même aliment à tous les animaux, ce qui entraîne soit du gaspillage, soit des carences.

### 1. Porcelets (7–25 kg)
Les porcelets ont des besoins très élevés :
- Protéines : 18–20 %
- Énergie : élevée
- Digestibilité maximale

Leur système digestif est immature, ce qui impose des aliments très digestibles et appétents. Une mauvaise alimentation à ce stade entraîne diarrhées, retards de croissance et mortalité élevée.

### 2. Porcs en croissance (25–60 kg)
À ce stade, le porc développe principalement sa masse musculaire.
- Protéines : 16–18 %
- Énergie : stable
- Minéraux équilibrés

L’objectif est d’optimiser le gain de poids sans gaspillage.

### 3. Porcs à l’engraissement (60–100 kg)
Les besoins en protéines diminuent légèrement, tandis que l’énergie devient prioritaire.
- Protéines : 14–16 %
- Énergie : élevée
Un excès de protéines à ce stade augmente inutilement les coûts.

### 4. Truies gestantes
Les besoins varient selon le stade de gestation :
- Début : entretien + croissance fœtale modérée
- Fin : besoins élevés pour le développement des fœtus

Une sous-alimentation provoque des porcelets faibles à la naissance.

### 5. Truies allaitantes
C’est le stade le plus exigeant :
- Forte demande énergétique
- Apport protéique élevé
Une alimentation insuffisante entraîne une perte de poids de la truie et une mauvaise croissance des porcelets.

🔑 À retenir :
Adapter l’alimentation à l’âge permet d’améliorer la croissance tout en réduisant les coûts.''',




3: '''⚡ Énergie et protéines : le moteur de la croissance

L’énergie et les protéines sont les deux piliers de la ration porcine. Leur équilibre conditionne directement la vitesse de croissance et l’efficacité alimentaire.

### 1. Sources d’énergie
Les principales sources énergétiques sont :
- Maïs
- Sorgho
- Manioc
- Sous-produits céréaliers

L’énergie sert d’abord à l’entretien, puis à la croissance. Un déficit énergétique ralentit la croissance même si les protéines sont suffisantes.

### 2. Protéines et acides aminés
Les protéines sont composées d’acides aminés, dont certains sont essentiels :
- Lysine
- Méthionine
- Thréonine
- Tryptophane

La lysine est l’acide aminé limitant principal chez le porc.

### 3. Équilibre énergie/protéines
Un excès de protéines sans énergie suffisante est gaspillé. À l’inverse, trop d’énergie sans protéines favorise l’engraissement excessif.

### 4. Qualité des protéines
Toutes les protéines ne se valent pas. La digestibilité et le profil en acides aminés sont plus importants que la quantité brute.

🔑 À retenir :
Ce n’est pas la quantité d’aliment qui fait grossir le porc, mais l’équilibre entre énergie et protéines.''',




4: '''🧂 Minéraux et vitamines : les piliers invisibles de la performance

Souvent négligés, les minéraux et vitamines sont pourtant essentiels au métabolisme, à la croissance et à la reproduction.

### 1. Minéraux majeurs
- Calcium : solidité osseuse
- Phosphore : énergie cellulaire
- Sodium : équilibre hydrique

Un déséquilibre Ca/P entraîne des boiteries et fractures.

### 2. Oligo-éléments
- Fer
- Zinc
- Cuivre
- Sélénium

Ils jouent un rôle clé dans l’immunité et la reproduction.

### 3. Vitamines
- Vitamine A : croissance
- Vitamine D : absorption du calcium
- Vitamine E : antioxydant

Les carences sont fréquentes dans les rations artisanales non supplémentées.

🔑 À retenir :
Sans minéraux et vitamines, même la meilleure ration énergétique échoue.''',




5: '''🌾 Ingrédients locaux : nourrir rentable et intelligent

L’utilisation des ingrédients locaux est la clé de la rentabilité en Afrique. Importer des aliments industriels augmente fortement les coûts.

### 1. Céréales locales
- Maïs
- Sorgho
- Mil

Bonnes sources d’énergie mais pauvres en protéines.

### 2. Sources protéiques locales
- Tourteau d’arachide
- Tourteau de coton (traité)
- Farine de poisson

Attention aux toxines et à la qualité.

### 3. Sous-produits agricoles
- Son de riz
- Son de blé
- Pulpe de manioc

Ils réduisent les coûts mais doivent être bien dosés.

### 4. Sécurité et stockage
Les ingrédients doivent être :
- Secs
- Non moisis
- Bien stockés

🔑 À retenir :
Les ingrédients locaux bien utilisés permettent de réduire les coûts sans sacrifier la performance.''',


6: '''🧪 Formulation des rations : nourrir juste, rentable et précis

La formulation des rations est l’art de combiner différents ingrédients afin de couvrir exactement les besoins nutritionnels du porc au moindre coût. Une bonne formulation permet d’économiser jusqu’à 20 % sur les dépenses alimentaires tout en améliorant les performances zootechniques.

### 1. Objectifs de la formulation
Formuler une ration ne consiste pas à mélanger des ingrédients au hasard. Les objectifs sont clairs :
- Couvrir les besoins nutritionnels selon l’âge et le stade physiologique
- Minimiser le coût de l’aliment
- Garantir une bonne digestibilité
- Éviter les carences et les excès

### 2. Étapes de la formulation
La formulation suit une démarche rigoureuse :
1. Identifier la catégorie d’animaux (porcelets, croissance, engraissement, truies)
2. Définir les besoins nutritionnels (énergie, protéines, minéraux)
3. Choisir les ingrédients disponibles localement
4. Calculer les proportions
5. Vérifier l’équilibre final

### 3. Méthodes de formulation
Il existe plusieurs méthodes :
- Méthode empirique (basée sur l’expérience)
- Méthode par essais successifs
- Méthode mathématique (carré de Pearson)
- Logiciels de formulation (pour élevages structurés)

La méthode du carré de Pearson est la plus accessible aux éleveurs.

### 4. Importance des acides aminés
La formulation moderne ne se base plus uniquement sur la protéine brute, mais sur les acides aminés digestibles, notamment la lysine. Un déficit en lysine limite la croissance même si la ration est riche en protéines.

### 5. Ajustement et suivi
Une ration doit être régulièrement ajustée selon :
- Le prix des ingrédients
- Les performances observées
- La disponibilité des matières premières

🔑 À retenir :
La formulation est un outil stratégique : bien formuler, c’est produire plus avec moins.''',


7: '''🐖 Alimentation des porcelets : sécuriser le démarrage

L’alimentation des porcelets est l’une des phases les plus sensibles de l’élevage porcin. Une erreur à ce stade a des conséquences irréversibles sur la croissance future.

### 1. Période critique du sevrage
Le sevrage est un stress majeur :
- Changement d’alimentation
- Séparation de la mère
- Immaturité digestive

Une transition mal gérée provoque diarrhées, retard de croissance et mortalité.

### 2. Aliment de démarrage
L’aliment de démarrage doit être :
- Très digestible
- Riche en protéines de qualité
- Appétent

Taux de protéines recommandé : 18–20 %.

### 3. Fréquence et distribution
Les porcelets doivent avoir accès à l’aliment :
- À volonté
- En petites quantités renouvelées fréquemment

L’eau propre est indispensable.

### 4. Prévention des troubles digestifs
Pour limiter les diarrhées :
- Introduire l’aliment progressivement
- Éviter les changements brusques
- Maintenir une hygiène stricte

🔑 À retenir :
Un bon démarrage garantit un porc performant à l’abattage.''',



8: '''🐷 Alimentation des porcs à l’engraissement : transformer l’aliment en viande

La phase d’engraissement représente la plus grande part de la consommation alimentaire. L’objectif est de produire un maximum de viande au moindre coût.

### 1. Objectifs nutritionnels
À ce stade :
- Les besoins en protéines diminuent
- L’énergie devient prioritaire

Protéines recommandées : 14–16 %.

### 2. Gestion de la ration
Une ration trop riche en protéines augmente inutilement les coûts. Une ration mal équilibrée ralentit la croissance.

### 3. Distribution de l’aliment
Deux systèmes existent :
- À volonté
- Rationné

Le choix dépend du système d’élevage et des objectifs économiques.

### 4. Suivi des performances
Il est essentiel de suivre :
- Le gain de poids
- La consommation journalière
- L’indice de consommation

🔑 À retenir :
L’engraissement est une course contre le coût : chaque jour compte.''',









9: '''🤰 Nutrition des truies gestantes : préparer la prochaine génération

La nutrition de la truie gestante conditionne la taille, la vitalité et la survie des porcelets à la naissance.

### 1. Phases de gestation
- Début : entretien et implantation embryonnaire
- Milieu : croissance modérée des fœtus
- Fin : croissance rapide des fœtus

### 2. Besoins nutritionnels
Les besoins augmentent fortement en fin de gestation :
- Énergie
- Protéines
- Minéraux

### 3. Erreurs fréquentes
- Sous-alimentation : porcelets faibles
- Suralimentation : truies grasses, mise bas difficile

🔑 À retenir :
Bien nourrir la truie gestante, c’est investir dans la portée suivante.''',




10: '''🐷🤱 Nutrition des truies allaitantes : soutenir la production laitière

La truie allaitante a les besoins nutritionnels les plus élevés de tout l’élevage porcin. Elle doit produire du lait tout en maintenant son état corporel.

### 1. Besoins énergétiques élevés
La production de lait exige beaucoup d’énergie. Une ration insuffisante entraîne une perte de poids rapide.

### 2. Protéines et acides aminés
Un apport protéique élevé est nécessaire pour soutenir la lactation.

### 3. Eau : nutriment oublié
Une truie allaitante peut consommer plus de 20 litres d’eau par jour. Un manque d’eau réduit immédiatement la production laitière.

### 4. Conséquences d’une mauvaise alimentation
- Porcelets chétifs
- Retard de croissance
- Allongement de l’intervalle entre portées

🔑 À retenir :
Une truie bien nourrie allaite mieux et se reproduit plus vite.''',


11: '''📏 Indice de consommation : mesurer l’efficacité alimentaire

L’indice de consommation (IC) est l’un des indicateurs les plus importants en élevage porcin. Il permet d’évaluer la quantité d’aliment nécessaire pour produire un kilogramme de poids vif. Plus l’IC est faible, plus l’élevage est performant et rentable.

### 1. Définition de l’indice de consommation
L’indice de consommation se calcule simplement :
IC = Quantité d’aliment consommée / Gain de poids obtenu

Par exemple, un IC de 3 signifie que le porc a consommé 3 kg d’aliment pour produire 1 kg de poids vif.

### 2. Importance économique
L’alimentation représentant plus de 60 % des coûts de production, une légère variation de l’IC a un impact majeur sur la rentabilité. Une amélioration de 0,1 point peut représenter des économies importantes sur un cycle complet.

### 3. Facteurs influençant l’IC
Plusieurs éléments influencent l’indice de consommation :
- Qualité de l’aliment
- Équilibre énergie/protéines
- Âge et génétique des animaux
- Conditions d’élevage (température, ventilation)
- Accès à l’eau

### 4. IC par stade de production
- Porcelets : IC plus élevé mais normal
- Croissance : IC optimal
- Engraissement : IC augmente naturellement

Comparer l’IC entre élevages permet d’identifier les marges d’amélioration.

### 5. Comment améliorer l’IC
- Adapter la ration à chaque stade
- Éviter le gaspillage
- Maintenir une bonne santé des animaux
- Suivre régulièrement les performances

🔑 À retenir :
L’IC est le thermomètre économique de l’élevage porcin.''',


12: '''💰 Réduction des coûts alimentaires : produire plus avec moins

Réduire les coûts alimentaires est un objectif majeur pour tout éleveur porcin. Il ne s’agit pas de nourrir moins, mais de nourrir mieux et plus intelligemment.

### 1. Identifier les postes de coût
Les coûts alimentaires incluent :
- Achat des matières premières
- Transport
- Stockage
- Pertes et gaspillage

Une analyse précise permet de cibler les actions prioritaires.

### 2. Utilisation des ingrédients locaux
Les ingrédients locaux bien sélectionnés réduisent fortement les coûts. Toutefois, leur qualité doit être contrôlée pour éviter les contre-performances.

### 3. Formulation économique
Formuler en fonction du prix des ingrédients permet d’optimiser le coût par kilogramme de gain de poids, et non le coût par kilogramme d’aliment.

### 4. Réduction des pertes
Les pertes peuvent représenter jusqu’à 10 % de l’aliment distribué :
- Mauvais équipements
- Stockage inadapté
- Rongeurs

### 5. Suivi et ajustement
Le suivi régulier des performances permet de corriger rapidement les dérives.

🔑 À retenir :
Chaque kilogramme d’aliment économisé améliore directement le bénéfice.''',


13: '''❌ Erreurs courantes : éviter les pièges coûteux

De nombreux échecs en élevage porcin sont liés à des erreurs nutritionnelles évitables. Identifier ces erreurs permet de gagner du temps et de l’argent.

### 1. Aliment unique pour tous les animaux
Donner le même aliment à toutes les catégories entraîne gaspillage et carences.

### 2. Changements brusques de ration
Les transitions alimentaires mal gérées provoquent troubles digestifs et baisse de croissance.

### 3. Mauvaise qualité des ingrédients
Moisissures, toxines et ingrédients avariés nuisent gravement à la santé des porcs.

### 4. Négligence de l’eau
L’eau est souvent oubliée alors qu’elle est essentielle à la digestion et à la croissance.

### 5. Absence de suivi
Ne pas mesurer les performances empêche toute amélioration.

🔑 À retenir :
Éviter les erreurs est souvent plus rentable que chercher des solutions complexes.''',




14: '''📋 Cas pratiques : appliquer la théorie sur le terrain

Les cas pratiques permettent de transformer les connaissances théoriques en compétences opérationnelles.

### 1. Exemple de ration porcelets
Présentation d’une ration type avec ingrédients locaux et ajustements possibles selon la disponibilité.

### 2. Exemple de ration engraissement
Formulation économique visant à réduire l’IC tout en maintenant une bonne croissance.

### 3. Analyse des résultats
Interprétation des performances observées et identification des axes d’amélioration.

### 4. Adaptation aux contraintes locales
Chaque élevage est unique. Les rations doivent être adaptées au contexte local.

🔑 À retenir :
La meilleure ration est celle qui fonctionne dans votre élevage.''',


15: '''📈 Stratégies de rentabilité : transformer la nutrition en profit

La nutrition porcine est un levier économique puissant lorsqu’elle est intégrée dans une stratégie globale de gestion de l’élevage.

### 1. Vision globale
La rentabilité ne dépend pas d’un seul facteur, mais de l’ensemble du système :
- Alimentation
- Génétique
- Sanitaire
- Gestion

### 2. Calcul du coût de production
Connaître le coût réel par kilogramme de viande permet de prendre des décisions éclairées.

### 3. Investir intelligemment
Un aliment légèrement plus cher mais mieux équilibré peut être plus rentable à long terme.

### 4. Suivi et amélioration continue
La collecte et l’analyse des données permettent d’améliorer continuellement les performances.

🔑 À retenir :
La nutrition est un investissement, pas une dépense.''',





      },
    );
  }
}
