abstract class ControllerGeral {
  late Uri urlController;

  Future<List<dynamic>> getData(id);
  Future<List<dynamic>> getAllData();
  Future<dynamic> postData(dynamic modelClass);
}
