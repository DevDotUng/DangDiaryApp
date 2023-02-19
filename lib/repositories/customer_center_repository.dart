import 'dart:convert';

import 'package:dangdiarysample/models/customer_center/customer_center_model.dart';
import 'package:http/http.dart';

class CustomerCenterRepository {
  final String _baseUrl = "localhost:8080";

  Future<CustomerCenterModel> getCustomerCenterView() async {
    Uri url = Uri.http(_baseUrl, '/api/customerCenter');

    var response = await get(url);
    if (response.statusCode == 200) {
      CustomerCenterModel customerCenterModel =
          CustomerCenterModel.fromJson(json.decode(response.body));
      return customerCenterModel;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
