import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/models/establishment_models.dart';
import 'package:to_beauty_app/src/pages/estabelecimento/get_all_estabelecimentos.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Beauty'),
      ),
      body: _body(),
    );
  }
}

_body() {
  Future<List<Estabelecimento>> estabelecimentos =
      EstabelecimentoApi.getAllEstabelecimentos();
  return FutureBuilder(
    future: estabelecimentos,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Text("Erro ao acessar os dados");
      }
      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      Object? estabelecimentos = snapshot.data;
      return _listView(estabelecimentos);
    },
  );
}

_listView(estabelecimentos) {
  return ListView.builder(
    itemCount: estabelecimentos != null ? estabelecimentos.length : 0,
    itemBuilder: (context, index) {
      Estabelecimento estab = estabelecimentos[index];
      return Card(
        child: Column(children: <Widget>[
          Text(estab.nome),
          Text(estab.rua),
          Text(estab.bairro),
          Text(estab.cidade),
        ]),
      );
    },
  );
}
