import 'package:flutter/material.dart';
import 'recipe_detail_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      'title': 'Nasi Goreng',
      'imageUrl': 'assets/images/nasgor.jpg',
      'description': 'Nasi Goreng adalah nasi yang digoreng dengan bumbu rempah khas Indonesia, sering disajikan dengan telur, ayam, dan kerupuk.',
      'rating': 4.9,
    },
    {
      'title': 'Sate Ayam',
      'imageUrl': 'assets/images/sate_ayam.jpeg',
      'description': 'Sate Ayam adalah potongan daging ayam yang ditusuk dan dipanggang, disajikan dengan bumbu kacang yang lezat.',
      'rating': 4.7,
    },
    {
      'title': 'Bakso',
      'imageUrl': 'assets/images/bakso.jpeg',
      'description': 'Bakso adalah sup dengan bola-bola daging, mie, dan tahu dalam kuah bening yang gurih.',
      'rating': 4.6,
    },
    {
      'title': 'Rendang',
      'imageUrl': 'assets/images/rendang.jpeg',
      'description': 'Rendang adalah masakan daging sapi yang dimasak dengan santan dan rempah-rempah hingga kering dan berwarna gelap.',
      'rating': 4.9,
    },
    {
      'title': 'Soto Betawi',
      'imageUrl': 'assets/images/soto.jpg',
      'description': 'Soto Betawi adalah sup khas Jakarta dengan kuah santan dan rempah-rempah, berisi daging sapi dan jeroan.',
      'rating': 4.5,
    },
    {
      'title': 'Gudeg',
      'imageUrl': 'assets/images/gudeg.jpg',
      'description': 'Gudeg adalah masakan khas Yogyakarta berbahan dasar nangka muda yang dimasak dengan santan dan rempah-rempah hingga menghasilkan warna kecoklatan, biasanya disajikan dengan nasi, ayam suwir, telur, dan areh.',
      'rating': 4.8,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Freshly Dropped'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Hottest Recipes',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          title: recipes[index]['title'],
                          imageUrl: recipes[index]['imageUrl'],
                          description: recipes[index]['description'],
                          rating: recipes[index]['rating'],
                        ),
                      ),
                    );
                  },
                  child: RecipeCard(
                    title: recipes[index]['title'],
                    imageUrl: recipes[index]['imageUrl'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const RecipeCard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}