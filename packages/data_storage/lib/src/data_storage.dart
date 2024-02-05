import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:data_api/data_api.dart';
import 'package:http/http.dart' as http;

class DataStorage extends DataApi {
  static const String baseURL = "https://gcib-api.agilebiz.co.ke";
  // static

  DataStorage({required SharedPreferences localDB}) : _localDB = localDB;

  final SharedPreferences _localDB;
  String? token;

  // ignore: override_on_non_overriding_member
  @override
  Future<void> saveAuthLocally(AuthDTO authDTO) async {
    try {
      await _localDB.setString('token', authDTO.token);
      await _localDB.setString('expiration', authDTO.expiration);
      await _localDB.setString('phoneNo', authDTO.phoneNo);
      token = authDTO.token;
    } catch (e) {
      print('saveAuthDTOLocally failed: $e');
    }
  }

  @override
  Future<String?> getToken() async {
    
      return await _localDB.getString('token');
    
  }

  @override
  Future<AuthDTO> logInUser({
    required String email,
    required String password,
  }) async {
    http.Response res = await http.post(
      Uri.parse('${baseURL}/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    if (res.statusCode == 200) {
      var jsonResponse = jsonDecode(res.body) as Map<String, dynamic>;
      String token = jsonResponse['token'];
      String expiration = jsonResponse['expiration'];
      String phoneNo = jsonResponse['phoneNo'];

      return AuthDTO(token: token, expiration: expiration, phoneNo: phoneNo);
    } else {
      print('login failed: ${res.reasonPhrase}');
      if (res.statusCode == 406) {
        throw Exception(406);
      }

      throw Exception(res);
    }
  }

  @override
  Future<bool> sendEmailForNewPwd(String email) {
    // TODO: implement sendEmailForNewPwd
    throw UnimplementedError();
  }

  @override
  Future signUpUser(signUpDTO registerDTO) {
    // TODO: implement signUpUser
    throw UnimplementedError();
  }
  
  @override
  joinInvst(joinInvst) async{
   try {
     
      http.Response res = await http.post(
        Uri.parse('${baseURL}/api/inv/addinv'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          "fundType": joinInvst.fundType,
          "fundNo": joinInvst.fundNo,
          "fundName": joinInvst.fundName,
          "dividendMandate": joinInvst.dividendMandate
        }),
      );

      if (res.statusCode == 200) {
        return true;
      } else {
        print('joinInv failed: ${res.reasonPhrase}');
        throw Exception(res.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  
  @override
  Future<List<Investment>> listMyInv() async{

    try {
      http.Response res = await http.get(
        Uri.parse('${baseURL}/api/inv/myinvestments'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200) {
        List<Investment> investments = [];
        var invList = jsonDecode(res.body);
        for (var item in invList) {
          Investment inv = Investment.fromJson(item);
          investments.add(inv);
        }
        return investments;
      } else {
        print('listMyInv failed: ${res.reasonPhrase}');
        throw Exception(res.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

   @override
  Future<List<Fund>> getAllInv() async {
    try {
      http.Response res = await http.get(
        Uri.parse('${baseURL}/api/inv/allinvestments'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200) {
        List<Fund> funds = [];

        var resData = jsonDecode(res.body);
        for (var item in resData) {
          Fund fund = Fund.fromJson(item);
          funds.add(fund);
        }

        return funds;
      } else {
        print('listAllInv failed: ${res}');
        throw Exception(res.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

