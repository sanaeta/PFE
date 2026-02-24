import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'), 
        headers: {'Content-Type': 'application/json'}, 
        body: jsonEncode({'email': email, 'password': password})
      );
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', jsonDecode(response.body)['token']);
        return true;
      }
      return false;
    } catch (e) { return false; }
  }

  Future<bool> register(String nom, String prenom, String email, String password, int filiereId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'), 
        headers: {'Content-Type': 'application/json'}, 
        body: jsonEncode({'nom': nom, 'prenom': prenom, 'email': email, 'password': password, 'filiere_id': filiereId})
      );
      return response.statusCode == 201;
    } catch (e) { return false; }
  }

  Future<List<dynamic>> getFilieres() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/filieres'));
      if (response.statusCode == 200) return jsonDecode(response.body);
      return [];
    } catch (e) { return []; }
  }
}