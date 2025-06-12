import '../data/model/user_model.dart';
import '../data/network/api_service.dart';

class UserRepository
{
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<List<UserModel>> getUsers() async
  {
    final data = await apiService.fetchUsers();
    return data.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }
}