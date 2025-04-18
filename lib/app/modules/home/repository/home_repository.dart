import '../../../data/network/network_api_services.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  // Future<UserListModel> userListApi() async {
  //   dynamic response = await _apiServices.getApi(AppUrl.userListApi);
  //   return UserListModel.fromJson(response);
  // }
}