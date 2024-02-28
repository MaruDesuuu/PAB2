import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'bed1415b0f98250d32da590f55d1800d';

  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey'));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['result']);
  }

  Future<List<Map<String, dynamic>>> getTrendingMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/week?api_key=$apiKey'));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['result']);
  }

  Future<List<Map<String, dynamic>>> getPopularMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['result']);
  }
}