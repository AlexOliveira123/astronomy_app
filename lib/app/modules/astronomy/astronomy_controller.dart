import 'dart:async';

import 'package:astronomy_app/app/modules/astronomy/models/astronomy_model.dart';
import 'package:astronomy_app/app/modules/astronomy/repositories/interfaces/astronomy_repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'astronomy_controller.g.dart';

@Injectable()
class AstronomyController = _AstronomyControllerBase with _$AstronomyController;

abstract class _AstronomyControllerBase with Store {
  final IAstronomyRepository astronomyRepository;

  _AstronomyControllerBase(this.astronomyRepository) {
    getApodData();
  }

  @observable
  ObservableList<AstronomyModel> astronomyList;

  @observable
  ObservableList<AstronomyModel> filteredList;

  @observable
  String search;

  @observable
  bool isPagination = false;

  @observable
  DioErrorType error;

  @computed
  bool get isSearch => search != null && search.length > 0;

  @action
  getApodData() async {
    var response = await this.astronomyRepository.getApodData();
    if (response is DioErrorType) {
      error = response;
      return;
    }
    var list = response != null
        ? (response.data as List)
            .map((item) => AstronomyModel.fromJson(item))
            .toList()
            .asObservable()
        : <AstronomyModel>[];

    if (isPagination) {
      astronomyList.addAll(list);
    } else {
      astronomyList = list;
    }

    filteredList = astronomyList;
  }

  @action
  setSearch(value) {
    search = value;
  }

  @action
  clearSearch() {
    search = null;
  }

  @action
  clear() {
    astronomyList = null;
    filteredList = null;
    search = null;
    isPagination = false;
    error = null;
  }
}
