abstract class ControllerGeral {
  late Uri urlController;

  Future<dynamic> postData(dynamic modelClass);
  Future<List<dynamic>> getData(int id);
  Future<List<dynamic>> getAllData();
}
