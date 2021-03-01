import 'package:flutter/material.dart';
import 'package:flutter_app_testing/model/favorites.dart';
import 'package:provider/provider.dart';
class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoriler'),
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.items.length,
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemBuilder: (context, index) => FavoriteItemTile(value.items[index]),
        ),
      ),
    );
  }
}
class FavoriteItemTile extends StatelessWidget {
  final int itemNo;
  const FavoriteItemTile(
      this.itemNo,
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text('Sayı $itemNo',
          key: Key('favorites_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$itemNo'),
          icon: Icon(Icons.close),
          onPressed: () {
            Provider.of<Favorites>(context, listen: false).remove(itemNo);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Favorilerden Kaldırıldı'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}