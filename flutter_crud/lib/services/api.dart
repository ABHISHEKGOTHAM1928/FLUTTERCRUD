import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

Future<String?> getIPAddress() async {
  // print("at getmyipadress");
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    try {
      var addresses = await NetworkInterface.list(
          type: InternetAddressType.IPv4, includeLinkLocal: true);
      for (var address in addresses) {
        for (var addr in address.addresses) {
          if (!addr.isLoopback) {
            return addr.address;
          }
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  } else if (connectivityResult == ConnectivityResult.wifi) {
    try {
      var wifiIP = await NetworkInterface.list(
          type: InternetAddressType.IPv4, includeLinkLocal: true);
      for (var address in wifiIP) {
        for (var addr in address.addresses) {
          if (!addr.isLoopback) {
            return addr.address;
          }
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  return null;
}

class API {
  //mobile ip =100.69.36.37 // 101.188.67.134
  //mobile wifi : 192.168.55.101
  //computer ip = 223.196.169.95
  static const baseUrl = "http://192.168.55.101:4000/";

  //creating the method

  static addProduct(Map pdata) async {
    String? ipAddress = await getIPAddress();
    print('IP Address: $ipAddress');

    print(pdata);

    var url = Uri.parse("${ipAddress}addProduct");
    print("reached addproduct at api");
    print(url);

    try {
      print("reached try:");
      final res = await http.post(url, body: pdata);
      print(res);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to get response");
      } //else
    } catch (e) {
      print(e.toString());
    }
  } //addProduct
}//class API