import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCategory = 'Tous';
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<String> _categories = [
    'Tous',
    'Céréales',
    'Protéines',
    'Minéraux',
    'Vitamines',
    'Additifs',
  ];




  // Liste des produits disponibles sur le marché
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Maïs',
      'category': 'Céréales',
      'price': 255,
      'unit': 'kg',
      'image': Icons.grain,
      'color': Color(0xFFFBBF24),
      'description': 'Énergie: 3350 kcal/kg, Protéine: 8.5%',
      'stock': 'En stock',
      'seller': 'Coopérative AGRI-NORD',
      'location': 'Yaoundé',
      'rating': 4.5,
    },
    {
      'name': 'Tourteau de soja',
      'category': 'Protéines',
      'price': 350,
      'unit': 'kg',
      'image': Icons.eco,
      'color': Color(0xFF10B981),
      'description': 'Protéine: 44-48%, Énergie: 2230 kcal/kg',
      'stock': 'En stock',
      'seller': 'NUTRI-FEED Cameroun',
      'location': 'Yaoundé',
      'rating': 4.8,
    },
    {
      'name': 'Son de blé',
      'category': 'Céréales',
      'price': 120,
      'unit': 'kg',
      'image': Icons.grass,
      'color': Color(0xFFD97706),
      'description': 'Fibres: 11%, Protéine: 15-16%',
      'stock': 'Stock limité',
      'seller': 'Moulins du Wouri',
      'location': 'Yaoundé',
      'rating': 4.2,
    },
    {
      'name': 'Phosphate bicalcique',
      'category': 'Minéraux',
      'price': 450,
      'unit': 'kg',
      'image': Icons.science,
      'color': Color(0xFF8B5CF6),
      'description': 'Calcium: 24%, Phosphore: 18%',
      'stock': 'En stock',
      'seller': 'VET-SUPPLY CM',
      'location': 'Yaoundé',
      'rating': 4.7,
    },
    {
      'name': 'Prémix vitaminé volaille',
      'category': 'Vitamines',
      'price': 2500,
      'unit': 'kg',
      'image': Icons.medication,
      'color': Color(0xFFEC4899),
      'description': 'Vitamines A, D3, E, K, B-complexe',
      'stock': 'En stock',
      'seller': 'BIOVET Solutions',
      'location': 'Yaoundé',
      'rating': 4.9,
    },
    {
      'name': 'Farine de poisson',
      'category': 'Protéines',
      'price': 850,
      'unit': 'kg',
      'image': Icons.set_meal,
      'color': Color(0xFF06B6D4),
      'description': 'Protéine: 60-65%, Lysine: 4.5%',
      'stock': 'Stock limité',
      'seller': 'OCEAN FEED',
      'location': 'Yaoundé',
      'rating': 4.6,
    },
    {
      'name': 'Sel de cuisine',
      'category': 'Minéraux',
      'price': 100,
      'unit': 'kg',
      'image': Icons.water_drop,
      'color': Color(0xFF94A3B8),
      'description': 'NaCl: 98%, Sodium: 39%',
      'stock': 'En stock',
      'seller': 'Salines du Cameroun',
      'location': 'Yaoundé',
      'rating': 4.3,
    },
    {
      'name': 'Probiotique digestif',
      'category': 'Additifs',
      'price': 3200,
      'unit': 'kg',
      'image': Icons.biotech,
      'color': Color(0xFF14B8A6),
      'description': 'Lactobacillus 10^9 UFC/g',
      'stock': 'En stock',
      'seller': 'PROBIOFEED Tech',
      'location': 'Yaoundé',
      'rating': 4.8,
    },
    {
      'name': 'Drêche de brasserie',
      'category': 'Protéines',
      'price': 80,
      'unit': 'kg',
      'image': Icons.local_bar,
      'color': Color(0xFFA16207),
      'description': 'Protéine: 25%, Fibres: 15%',
      'stock': 'En stock',
      'seller': 'Brasseries du Cameroun',
      'location': 'Yaoundé',
      'rating': 4.0,
    },
    {
      'name': 'Coquilles d\'huîtres',
      'category': 'Minéraux',
      'price': 150,
      'unit': 'kg',
      'image': Icons.circle,
      'color': Color(0xFFE2E8F0),
      'description': 'Calcium: 38%, Granulométrie optimale',
      'stock': 'En stock',
      'seller': 'Coastal Minerals',
      'location': 'Yaoundé',
      'rating': 4.4,
    },
  ];








// Liste des machines disponibles sur le marché
final List<Map<String, dynamic>> _machines = [
  {
    'name': 'Mélangeur à sec',
    'category': 'Mélangeurs',
    'price': 450_000,
    'unit': 'unité',
    'image': Icons.settings,
    'color': Color(0xFF3B82F6),
    'description': 'Mélange homogène des ingrédients secs pour alimentation animale',
    'stock': 'En stock',
    'seller': 'AGRI-MACHINES CM',
    'location': 'Douala',
    'rating': 4.6,
  },
  {
    'name': 'Broyeur à marteaux',
    'category': 'Broyeurs',
    'price': 750_000,
    'unit': 'unité',
    'image': Icons.build_circle,
    'color': Color(0xFFEF4444),
    'description': 'Broyage des céréales et matières premières en poudre fine',
    'stock': 'Stock limité',
    'seller': 'FEEDTECH Solutions',
    'location': 'Yaoundé',
    'rating': 4.7,
  },
  {
    'name': 'Ensacheuse automatique',
    'category': 'Ensacheuses',
    'price': 1_200_000,
    'unit': 'unité',
    'image': Icons.inbox,
    'color': Color(0xFFF59E0B),
    'description': 'Emballage précis des aliments composés en sacs',
    'stock': 'En stock',
    'seller': 'PACKFEED CM',
    'location': 'Bafoussam',
    'rating': 4.8,
  },
  {
    'name': 'Tamis vibrant',
    'category': 'Tamis',
    'price': 380_000,
    'unit': 'unité',
    'image': Icons.grid_3x3,
    'color': Color(0xFF10B981),
    'description': 'Séparation des particules selon la granulométrie',
    'stock': 'En stock',
    'seller': 'AGRI-MACHINES CM',
    'location': 'Douala',
    'rating': 4.5,
  },
];

















  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }












  List<Map<String, dynamic>> get _filteredProducts {
    return _products.where((product) {
      final matchesCategory = _selectedCategory == 'Tous' || product['category'] == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          product['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product['category'].toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }



List<Map<String, dynamic>> get _filteredMachines {
  return _machines.where((machine) {
    final matchesSearch = _searchQuery.isEmpty ||
        machine['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
        machine['category'].toLowerCase().contains(_searchQuery.toLowerCase());
    return matchesSearch;
  }).toList();
}









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD97706),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4B2E2A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Marché',
          style: TextStyle(
            color: Color(0xFF4B2E2A),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF4B2E2A),
          labelColor: const Color(0xFF4B2E2A),
          unselectedLabelColor: const Color(0xFF4B2E2A).withOpacity(0.6),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          tabs: const [
            Tab(text: 'Produits'),
            Tab(text: 'Machines'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildProductsTab(),
          _buildMachinesTab(),
        ],
      ),
    );
  }

  Widget _buildProductsTab() {
    return Column(
      children: [
        // Barre de recherche
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            onChanged: (value) => setState(() => _searchQuery = value),
            decoration: InputDecoration(
              hintText: 'Rechercher un produit...',
              prefixIcon: const Icon(Icons.search, color: Color(0xFFD97706)),
              filled: true,
              fillColor: const Color(0xFFFFF6E8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),

        // Filtres par catégorie
        Container(
          height: 50,
          color: Colors.white,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              final isSelected = _selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() => _selectedCategory = category);
                  },
                  backgroundColor: const Color(0xFFFFF6E8),
                  selectedColor: const Color(0xFFD97706),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF4B2E2A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        // Liste des produits
        Expanded(
          child: _filteredProducts.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _filteredProducts.length,
                  itemBuilder: (context, index) {
                    return _buildProductCard(_filteredProducts[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => _showProductDetails(product),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icône produit
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: product['color'].withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  product['image'],
                  size: 36,
                  color: product['color'],
                ),
              ),
              const SizedBox(width: 16),
              
              // Informations produit
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B2E2A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product['description'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF78716C),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14, color: Color(0xFF78716C)),
                        const SizedBox(width: 4),
                        Text(
                          product['location'],
                          style: const TextStyle(fontSize: 12, color: Color(0xFF78716C)),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.star, size: 14, color: Color(0xFFFBBF24)),
                        const SizedBox(width: 4),
                        Text(
                          product['rating'].toString(),
                          style: const TextStyle(fontSize: 12, color: Color(0xFF78716C)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Prix
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${product['price']} FCFA',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD97706),
                    ),
                  ),
                  Text(
                    '/${product['unit']}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF78716C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: product['stock'] == 'En stock'
                          ? const Color(0xFF10B981).withOpacity(0.1)
                          : const Color(0xFFF59E0B).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      product['stock'],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: product['stock'] == 'En stock'
                            ? const Color(0xFF10B981)
                            : const Color(0xFFF59E0B),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



















Widget _buildMachineCard(Map<String, dynamic> machine) {
  return Card(
    elevation: 2,
    margin: const EdgeInsets.only(bottom: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: InkWell(
      onTap: () => _showProductDetails(machine), // réutilise le modal
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: machine['color'].withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(machine['image'], size: 36, color: machine['color']),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    machine['name'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4B2E2A)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    machine['description'],
                    style: const TextStyle(fontSize: 12, color: Color(0xFF78716C)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14, color: Color(0xFF78716C)),
                      const SizedBox(width: 4),
                      Text(machine['location'],
                          style: const TextStyle(fontSize: 12, color: Color(0xFF78716C))),
                      const SizedBox(width: 12),
                      const Icon(Icons.star, size: 14, color: Color(0xFFFBBF24)),
                      const SizedBox(width: 4),
                      Text(machine['rating'].toString(),
                          style: const TextStyle(fontSize: 12, color: Color(0xFF78716C))),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${machine['price']} FCFA',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFD97706)),
                ),
                Text(
                  '/${machine['unit']}',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF78716C)),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: machine['stock'] == 'En stock'
                        ? const Color(0xFF10B981).withOpacity(0.1)
                        : const Color(0xFFF59E0B).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    machine['stock'],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: machine['stock'] == 'En stock'
                          ? const Color(0xFF10B981)
                          : const Color(0xFFF59E0B),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}






  void _showProductDetails(Map<String, dynamic> product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(24),
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Icône et nom
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: product['color'].withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(product['image'], size: 40, color: product['color']),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4B2E2A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product['category'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF78716C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              
              // Description
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B2E2A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product['description'],
                style: const TextStyle(fontSize: 14, color: Color(0xFF78716C)),
              ),
              
              const SizedBox(height: 24),
              
              // Vendeur
              Row(
                children: [
                  const Icon(Icons.store, color: Color(0xFFD97706)),
                  const SizedBox(width: 8),
                  Text(
                    product['seller'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4B2E2A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Color(0xFF78716C)),
                  const SizedBox(width: 8),
                  Text(
                    product['location'],
                    style: const TextStyle(fontSize: 14, color: Color(0xFF78716C)),
                  ),
                  const Spacer(),
                  const Icon(Icons.star, size: 16, color: Color(0xFFFBBF24)),
                  const SizedBox(width: 4),
                  Text(
                    '${product['rating']}/5',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4B2E2A),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Prix et boutons
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Prix unitaire',
                        style: TextStyle(fontSize: 12, color: Color(0xFF78716C)),
                      ),
                      Text(
                        '${product['price']} FCFA/${product['unit']}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD97706),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _showContactDialog(product);
                    },
                    icon: const Icon(Icons.phone, color: Colors.white),
                    label: const Text(
                      'Contacter',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD97706),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
























































































Future<void> _launchCall(String phone) async {
  final Uri callUri = Uri.parse("tel:$phone");

  try {
    final bool launched = await launchUrl(
      callUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      debugPrint("Impossible de lancer l’appel");
    }
  } catch (e) {
    debugPrint("Erreur appel : $e");
  }
}















void _contactViaWhatsApp(Map<String, dynamic> product) async {
  const String phone = "+237655372703";

  final String message =
      "Bonjour, je suis intéressé par votre produit *${product['name']}* "
      "à *${product['price']} FCFA/${product['unit']}* vendu par *${product['seller']}*. "
      "Est-il toujours disponible ?";

  final Uri whatsappUri = Uri.parse(
    "https://wa.me/${phone.replaceAll('+', '')}?text=${Uri.encodeComponent(message)}",
  );

  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint("Impossible d’ouvrir WhatsApp");
  }
}









void _showContactDialog(Map<String, dynamic> product) {
  // const String phone = "+237655372703"; // Numéro du vendeur
  // final Uri callUri = Uri(scheme: "tel", path: phone);
  // final Uri whatsappUri = Uri.parse("https://wa.me/$phone");

  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.phone_in_talk, size: 48, color: Color(0xFFD97706)),
            const SizedBox(height: 16),

            Text(
              product['seller'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B2E2A),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),
            Text(
              'Contact pour: ${product['name']}',
              style: const TextStyle(fontSize: 14, color: Color(0xFF78716C)),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            // ▶️ Appeler
            ElevatedButton.icon(


              // onPressed: () async {
              //   if (await canLaunchUrl(callUri)) {
              //     await launchUrl(callUri);
              //   }
              //   Navigator.pop(context);
              // },

                onPressed: () {
                  _launchCall("+237655372703");
                  Navigator.pop(context);
                },


              icon: const Icon(Icons.phone, color: Colors.white),
              label: const Text(
                'Appeler le vendeur',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD97706),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),













            // // ▶️ WhatsApp
            // OutlinedButton.icon(
            //   onPressed: () async {
            //     if (await canLaunchUrl(whatsappUri)) {
            //       await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
            //     }
            //     Navigator.pop(context);
            //   },
            //   icon: const Icon(Icons.chat, color: Color(0xFF10B981)),
            //   label: const Text(
            //     'WhatsApp',
            //     style: TextStyle(color: Color(0xFF10B981)),
            //   ),
            //   style: OutlinedButton.styleFrom(
            //     side: const BorderSide(color: Color(0xFF10B981)),
            //     minimumSize: const Size(double.infinity, 48),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            // ),








ElevatedButton.icon(
  onPressed: () {
    Navigator.pop(context);
    _contactViaWhatsApp(product);  // 👈 Appel dynamique
  },
  icon: const Icon(Icons.chat, color: Colors.white),
  label: const Text(
    'WhatsApp',
    style: TextStyle(color: Colors.white),
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),



          ],
        ),
      ),
    ),
  );
}















































































































Widget _buildMachinesTab() {
  return Column(
    children: [
      // Barre de recherche (réutilisée)
      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: _searchController,
          onChanged: (value) => setState(() => _searchQuery = value),
          decoration: InputDecoration(
            hintText: 'Rechercher une machine...',
            prefixIcon: const Icon(Icons.search, color: Color(0xFFD97706)),
            filled: true,
            fillColor: const Color(0xFFFFF6E8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
          ),
        ),
      ),
      const SizedBox(height: 8),
      Expanded(
        child: _filteredMachines.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _filteredMachines.length,
                itemBuilder: (context, index) {
                  return _buildMachineCard(_filteredMachines[index]);
                },
              ),
      ),
    ],
  );
}









  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          const Text(
            'Aucun produit trouvé',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B2E2A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Essayez de modifier vos filtres',
            style: TextStyle(fontSize: 14, color: Color(0xFF78716C)),
          ),
        ],
      ),
    );
  }
}