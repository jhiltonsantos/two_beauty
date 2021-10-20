import 'package:flutter/material.dart';
import 'package:to_beauty_app/pages/login/login_page.dart';
import 'package:to_beauty_app/pages/sign_up/sign_up_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                        style: TextStyle(fontSize: 38.0),
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
                          style: TextStyle(fontSize: 18.0),
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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 34.0),
                  child: Image.asset('assets/images/logo.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  cardLoginCadastro('Fazer\nCadastro', Icons.arrow_upward, () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    });
                  }),
                  cardLoginCadastro('Fazer\nLogin', Icons.east, () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
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
      color: Colors.grey[400],
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
