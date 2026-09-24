import 'package:dio/dio.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas14/models/pokemon_model.dart';

class PokemonApiService {
  static final PokemonApiService _instance = PokemonApiService._internal();
  factory PokemonApiService() => _instance;
  PokemonApiService._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<List<PokemonItemModel>> fetchPokemonList({
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final response = await _dio.get(
        '/pokemon',
        queryParameters: {'limit': limit, 'offset': offset},
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['results'] is List) {
          final List results = data['results'] as List;
          return results
              .map(
                (item) =>
                    PokemonItemModel.fromJson(item as Map<String, dynamic>),
              )
              .toList();
        }
      }
      throw Exception('Gagal memproses data Pokemon dari server');
    } on DioException catch (dioErr) {
      if (dioErr.type == DioExceptionType.connectionTimeout ||
          dioErr.type == DioExceptionType.receiveTimeout) {
        throw Exception('Koneksi timeout. Periksa sinyal internet Anda.');
      } else if (dioErr.type == DioExceptionType.connectionError) {
        throw Exception(
          'Tidak ada koneksi internet. Silakan cek koneksi Anda.',
        );
      } else {
        throw Exception('Gagal terhubung ke API: ${dioErr.message}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  Future<PokemonDetailModel> fetchPokemonDetail(String nameOrId) async {
    try {
      final response = await _dio.get('/pokemon/$nameOrId');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return PokemonDetailModel.fromJson(data);
        }
      }
      throw Exception('Data detail Pokemon tidak ditemukan');
    } on DioException catch (dioErr) {
      if (dioErr.type == DioExceptionType.connectionTimeout ||
          dioErr.type == DioExceptionType.receiveTimeout) {
        throw Exception('Koneksi timeout saat memuat detail.');
      } else if (dioErr.type == DioExceptionType.connectionError) {
        throw Exception('Tidak ada internet saat memuat detail.');
      } else {
        throw Exception('Gagal memuat detail Pokemon: ${dioErr.message}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}
