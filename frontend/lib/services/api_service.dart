import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://127.0.0.1:8000/api"));

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<Response> login(String email, String password) async {
    final response = await dio.post("/login", data: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      await saveToken(response.data["token"]);
    }
    return response;
  }

  Future<Response> register(String name, String email, String password) async {
    return await dio.post("/register", data: {
      "name": name,
      "email": email,
      "password": password,
    });
  }

  Future<Response> getTasks() async {
    final token = await getToken();
    return await dio.get("/tasks",
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

  Future<Response> createTask(Map<String, dynamic> task) async {
    final token = await getToken();
    return await dio.post("/tasks",
        data: task,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

  Future<Response> updateTask(int id, Map<String, dynamic> task) async {
    final token = await getToken();
    return await dio.put("/tasks/$id",
        data: task,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

  Future<Response> deleteTask(int id) async {
    final token = await getToken();
    return await dio.delete("/tasks/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }
}
