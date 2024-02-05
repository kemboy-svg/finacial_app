import 'package:data_api/data_api.dart';

class InvstRepo {
  InvstRepo({required DataApi dataApi}) : _dataApi = dataApi;
  final DataApi _dataApi;

   Future<bool> joinInv(JoinInvst joinInvDTO) async {
    try {
      return await _dataApi.joinInvst(joinInvDTO);
    } catch (e) {
      throw Exception(e);
    }
  }

   Future<List<Investment>> listMyInv() async {
    try {
      return await _dataApi.listMyInv();
    } catch (e) {
      print('listMyInv error: $e');
      throw Exception(e);
    }
  }


   Future<List<Fund>> getAllInv() async {
    try {
      return await _dataApi.getAllInv();
    } catch (e) {
      throw Exception(e);
    }
  }
}