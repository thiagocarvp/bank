import 'package:bank/action_card.dart';
import 'package:bank/consts.dart';
import 'package:bank/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Bank'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final products = [
    {
      "title": "Conta",
      "amount": "500,00",
    },
    {
      "title": "Crédito",
      "amount": "0,00",
    }
  ];

  final actions = [
    {
      "title": "Indicar amigos",
    },
    {
      "title": "Depositar",
    },
    {
      "title": "Transferir",
    },
    {
      "title": "Pagar",
    },
    {
      "title": "Cobrar",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: primaryPurple,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "User",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 1,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(this.products[index]["amount"]);
                  },
                  itemCount: products.length,
                  loop: false,
                  pagination: SwiperPagination(
                    margin: EdgeInsets.only(top: 16),
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.white,
                      color: secondaryPurple,
                    ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 3,
                child: OverflowBox(
                  minWidth: 0,
                  maxWidth: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      var card;
                      if (index == 0) {
                        card = Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: ActionCard(this.actions[index]["title"]),
                        );
                      } else if (index == actions.length - 1) {
                        card = Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: ActionCard(this.actions[index]["title"]),
                        );
                      } else {
                        card = ActionCard(this.actions[index]["title"]);
                      }
                      return card;
                    },
                    itemCount: actions.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
