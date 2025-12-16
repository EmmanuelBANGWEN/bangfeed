import 'package:bangfeed/screens/formation/base_formation_page.dart';
import 'package:flutter/material.dart';



class BiosecuriteAviculturePage extends StatelessWidget {
  const BiosecuriteAviculturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseFormationPage(
      formationTitre: 'Biosécurité en aviculture',
      formationIcon: Icons.health_and_safety,
      totalModules: 8,
      titresModules: {
        1: 'Principes fondamentaux',
        2: 'Risques sanitaires',
        3: 'Contrôle des accès',
        4: 'Nettoyage et désinfection',
        5: 'Gestion des visiteurs',
        6: 'Matériel et animaux',
        7: 'Plan de prévention',
        8: 'Protocoles d’urgence',
      },
      contenusModules: {
1: '''🛡️ Principes fondamentaux de la biosécurité avicole

La biosécurité regroupe l’ensemble des mesures visant à empêcher l’introduction, la propagation et la sortie des maladies dans un élevage avicole. Elle constitue la première ligne de défense contre les pertes sanitaires et économiques.

### 1. Pourquoi la biosécurité est essentielle
En aviculture, une seule maladie peut :
- Décimer un élevage entier
- Entraîner des pertes financières importantes
- Affecter durablement la réputation de l’éleveur

### 2. Objectifs de la biosécurité
La biosécurité vise à :
- Protéger la santé des volailles
- Garantir une production régulière
- Réduire l’utilisation des médicaments

### 3. Les trois piliers de la biosécurité
- Bio-exclusion : empêcher l’entrée des agents pathogènes
- Bio-gestion : limiter leur circulation interne
- Bio-confinement : éviter leur sortie de l’élevage

### 4. Responsabilité de l’éleveur
La biosécurité commence par le comportement humain :
- Discipline quotidienne
- Respect strict des règles
- Sensibilisation du personnel

🔑 À retenir :
La biosécurité n’est pas une option, c’est une obligation.''',


2: '''⚠️ Risques sanitaires en aviculture : identifier pour mieux prévenir

Les risques sanitaires sont omniprésents en élevage avicole. Les identifier permet d’agir avant l’apparition des maladies.

### 1. Origine des risques
Les risques peuvent provenir :
- Des animaux eux-mêmes
- Du personnel
- Du matériel
- De l’environnement extérieur

### 2. Principales maladies avicoles
- Maladie de Newcastle
- Grippe aviaire
- Gumboro
- Coccidiose
- Salmonellose

### 3. Modes de transmission
- Contact direct entre oiseaux
- Air et poussières
- Eau et aliments contaminés
- Outils et vêtements

### 4. Facteurs aggravants
- Surpopulation
- Mauvaise ventilation
- Stress thermique
- Hygiène insuffisante

🔑 À retenir :
Identifier le risque, c’est déjà réduire la maladie.''',


3: '''🚪 Contrôle des accès : fermer la porte aux maladies

Le contrôle des accès est l’une des mesures les plus efficaces de biosécurité.

### 1. Accès à l’élevage
L’élevage doit être :
- Clôturé
- Signalé
- Accessible uniquement aux personnes autorisées

### 2. Gestion des visiteurs
Tout visiteur doit :
- Être limité au strict nécessaire
- Porter des équipements propres
- Passer par un pédiluve

### 3. Circulation interne
- Déplacements organisés
- Sens unique (jeunes → adultes)
- Zones propres / zones sales séparées

### 4. Registre des entrées
Tenir un registre permet :
- Une traçabilité
- Une meilleure gestion des risques

🔑 À retenir :
Moins d’entrées = moins de maladies.''',




4: '''🧼 Nettoyage et désinfection : éliminer l’ennemi invisible

Le nettoyage et la désinfection sont des étapes clés pour casser le cycle des agents pathogènes.

### 1. Différence entre nettoyage et désinfection
- Nettoyage : élimination des saletés visibles
- Désinfection : destruction des micro-organismes

### 2. Étapes du nettoyage
- Retrait des animaux
- Évacuation des déchets
- Lavage à l’eau et au détergent

### 3. Désinfection efficace
- Choix du bon désinfectant
- Respect des doses
- Temps de contact suffisant

### 4. Fréquence
- Entre chaque bande
- Régulièrement sur le matériel

🔑 À retenir :
Un bâtiment propre est un bâtiment sain.''',



5: '''👥 Gestion des visiteurs : un risque sous-estimé

Les visiteurs représentent l’un des plus grands dangers sanitaires en élevage avicole. Chaque personne extérieure peut introduire des agents pathogènes invisibles.

### 1. Pourquoi les visiteurs sont dangereux
Les visiteurs peuvent transporter des germes via :
- Les chaussures
- Les vêtements
- Les mains
- Les véhicules

Même un visiteur bien intentionné peut contaminer un élevage.

### 2. Limitation stricte des visites
Les visites doivent être :
- Rares
- Justifiées
- Autorisées par l’éleveur

Aucune visite inutile ne doit être acceptée.

### 3. Procédure obligatoire
Tout visiteur doit :
- Se laver les mains
- Porter des vêtements dédiés
- Utiliser un pédiluve
- Respecter le sens de circulation

### 4. Cas particuliers
- Techniciens
- Vétérinaires
- Fournisseurs

Ils doivent suivre les mêmes règles, sans exception.

🔑 À retenir :
Chaque visite est un risque. La prévention commence à la porte.''',

6: '''🧰 Matériel et animaux : sources majeures de contamination

Le matériel et les animaux sont des vecteurs directs de maladies s’ils sont mal gérés.

### 1. Gestion du matériel
Le matériel doit être :
- Spécifique à chaque bâtiment
- Nettoyé après chaque utilisation
- Désinfecté régulièrement

Partager du matériel entre élevages est une pratique à haut risque.

### 2. Introduction de nouveaux animaux
Tout nouvel animal doit :
- Provenir d’une source fiable
- Être en bonne santé
- Passer par une quarantaine

### 3. Quarantaine
La quarantaine permet :
- L’observation des signes cliniques
- La protection du troupeau existant
- La réduction des risques d’introduction

### 4. Animaux nuisibles
- Rats
- Souris
- Oiseaux sauvages
- Insectes

Ils doivent être strictement contrôlés.

🔑 À retenir :
Un matériel propre et des animaux contrôlés sauvent l’élevage.''',

7: '''📋 Plan de prévention : anticiper pour mieux protéger

Un plan de prévention est un document stratégique qui organise toutes les mesures de biosécurité.

### 1. Pourquoi un plan est indispensable
Il permet :
- Une organisation claire
- Une application cohérente
- Une réaction rapide en cas de problème

### 2. Contenu du plan
Un bon plan comprend :
- Les règles d’accès
- Les procédures de nettoyage
- Le plan sanitaire
- Les responsabilités du personnel

### 3. Formation du personnel
Le personnel doit :
- Comprendre les risques
- Appliquer les règles
- Être régulièrement formé

### 4. Mise à jour du plan
Le plan doit être :
- Révisé régulièrement
- Adapté aux évolutions
- Corrigé après chaque incident

🔑 À retenir :
Un élevage sans plan est un élevage exposé.''',


8: '''🚨 Protocoles d’urgence : réagir vite pour sauver l’élevage

Malgré toutes les précautions, un incident sanitaire peut survenir. La rapidité de réaction est alors déterminante.

### 1. Détection précoce
Les signes d’alerte incluent :
- Mortalités anormales
- Baisse de consommation
- Comportement inhabituel

### 2. Mesures immédiates
En cas de suspicion :
- Isoler le bâtiment concerné
- Limiter les déplacements
- Contacter le vétérinaire

### 3. Gestion de la crise
- Respect strict des consignes vétérinaires
- Renforcement des mesures d’hygiène
- Communication interne claire

### 4. Après la crise
- Nettoyage approfondi
- Analyse des causes
- Mise à jour du plan de prévention

🔑 À retenir :
En biosécurité, chaque minute compte.''',


















      },
    );
  }
}
