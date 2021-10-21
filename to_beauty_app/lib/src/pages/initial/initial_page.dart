import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

final List<String> imgList = [
  'assets/images/intro1.jpg',
  'assets/images/intro2.jpg',
  'assets/images/intro3.jpg',
  'assets/images/intro4.jpg',
  'assets/images/intro5.jpg',
  'assets/images/intro6.jpg',
  'assets/images/intro7.jpg',
  'assets/images/intro8.jpg',
  'assets/images/intro9.jpg',
  'assets/images/intro10.jpg',
];

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 1000.0,
                    filterQuality: FilterQuality.low,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroudColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(170.0),
          child: Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListTile(
                      title: const Text(
                        '2BEAUTY',
                        style: TextStyle(
                            fontSize: 38.0, fontWeight: FontWeight.w400),
                      ),
                      trailing: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 34),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const <Widget>[
                        Text(
                          "Agende seu horário de\nqualquer lugar",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.end,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0, top: 10.0),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            indent: 130.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                child: CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cardLoginCadastro('Fazer\nCadastro', Icons.arrow_upward, () {
                    setState(() {
                      Navigator.pushNamed(context, '/signup');
                    });
                  }),
                  cardLoginCadastro('Fazer\nLogin', Icons.east, () {
                    setState(() {
                      Navigator.pushNamed(context, '/login');
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }

  Card cardLoginCadastro(String text, IconData icon, ontap) {
    return Card(
      elevation: 5.0,
      color: secondaryColor,
      child: InkWell(
        onTap: ontap,
        child: SizedBox(
          height: 120,
          width: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 38,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      text,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
