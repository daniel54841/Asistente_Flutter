import 'package:flutter/material.dart';
import 'package:reproductor_ia/utils/constants/home_constants.dart';
import 'package:reproductor_ia/widgets/item_list_views/buy_item.dart';

import '../../utils/responsive.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Text("Home"),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        title: Text(
          HomeConstants.titleHome,
          style: TextStyle(
            fontSize: responsive.dp(5),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return BuyItem();
            },
            itemCount: 2,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
