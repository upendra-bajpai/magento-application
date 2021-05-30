import 'dart:async';

import 'package:magento_mobile/models/login_modal.dart';
import 'package:magento_mobile/network/api_response.dart';
import 'package:magento_mobile/repository/login_repo.dart';


class LoginBloc {
  LoginRepo _movieRepository;

  StreamController _movieListController;

  StreamSink<ApiResponse<LoginModal>> get movieListSink =>
      _movieListController.sink;

  Stream<ApiResponse<LoginModal>> get movieListStream =>
      _movieListController.stream;

  LoginBloc() {
    _movieListController = StreamController<ApiResponse<LoginModal>>();
    _movieRepository = LoginRepo();
    fetchMovieList();
  }

  fetchMovieList() async {
    movieListSink.add(ApiResponse.loading('Fetching Popular Movies'));
    try {
      LoginModal movies = null;//await _movieRepository.putLogin("lll");
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieListController?.close();
  }
}
