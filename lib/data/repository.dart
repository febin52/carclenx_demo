import 'package:carclenx_demo/data/models/makes_list_model.dart';
import 'package:carclenx_demo/data/models/products_list_model.dart';
import 'package:carclenx_demo/data/webclient.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Repository{
    Future<ProductsListModel> fetchProducts(
      {required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
  
      Fluttertoast.showToast(
        msg: "Not connected to internet",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final ProductsListModel productsListModel = ProductsListModel.fromJson(response);
    return productsListModel;
  }
    Future<MakesListModel> fetchMake(
      {required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
  
      Fluttertoast.showToast(
        msg: "Not connected to internet",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final MakesListModel makesListModel = MakesListModel.fromJson(response);
    return makesListModel;
  }
}