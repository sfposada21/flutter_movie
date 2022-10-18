import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'dart:async';


class MoviesProvider extends ChangeNotifier {

  final String _apiKey   = '8a7b4f70fdfe0e1c9316002de6da453f';
  final String _baseUrl  = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];
    
  int _popularPage = 0;

  MoviesProvider() {
    // ignore: avoid_print
    print('MoviesProvider inicializado primera vez');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

    Future<String> _getJsonData( String endpoint, [int page = 1] ) async {
    final url = Uri.https( _baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
    });

    print(url);
    final response = await http.get(url);
    print(response.body);
    
    return response.body;
  }

  getOnDisplayMovies() async {
    
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    
    onDisplayMovies = nowPlayingResponse.results;
    
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage );
    final popularResponse = PopularResponse.fromJson( jsonData );    

    popularMovies = [ ...popularMovies, ...popularResponse.results ];    

    notifyListeners();
  }

}