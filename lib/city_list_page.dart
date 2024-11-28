import 'package:flutter/material.dart';
import 'package:myapp/city_detail_page.dart';

class CityListPage extends StatelessWidget {
  const CityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const cities = [
      '札幌市',
      '仙台市',
      'さいたま市',
      '千葉市',
      '横浜市',
      '川崎市',
      '名古屋市',
      '京都市',
      '大阪市',
      '福岡市',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('市区町村一覧'),
      ),
      body: FutureBuilder<void>(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              for (final city in cities)
                ListTile(
                    title: Text(city),
                    subtitle: const Text('政令指定都市'),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () {
                      // TODO 詳細画面遷移
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CityDetailPage(city: city),
                        ),
                      );
                    }),
            ],
          );
        }
      ),
    );
  }
}
