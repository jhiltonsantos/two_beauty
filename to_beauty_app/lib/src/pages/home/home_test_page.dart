import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/models/store_models.dart';
import 'package:to_beauty_app/src/pages/store/get_all_store.dart';
import 'package:to_beauty_app/src/pages/store/store_controller.dart';

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
  Future<List<Store>> store = StoreGetController.getAllEstabelecimentos();
  return FutureBuilder(
    future: store,
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
      Store store = estabelecimentos[index];
      return Card(
        child: Column(children: <Widget>[
          Text(store.name),
          Text(store.street),
          Text(store.district),
          Text(store.city),
        ]),
      );
    },
  );
}
