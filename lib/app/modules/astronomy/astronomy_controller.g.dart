// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astronomy_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AstronomyController = BindInject(
  (i) => AstronomyController(i<IAstronomyRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AstronomyController on _AstronomyControllerBase, Store {
  Computed<bool> _$isSearchComputed;

  @override
  bool get isSearch =>
      (_$isSearchComputed ??= Computed<bool>(() => super.isSearch,
              name: '_AstronomyControllerBase.isSearch'))
          .value;

  final _$astronomyListAtom =
      Atom(name: '_AstronomyControllerBase.astronomyList');

  @override
  ObservableList<AstronomyModel> get astronomyList {
    _$astronomyListAtom.reportRead();
    return super.astronomyList;
  }

  @override
  set astronomyList(ObservableList<AstronomyModel> value) {
    _$astronomyListAtom.reportWrite(value, super.astronomyList, () {
      super.astronomyList = value;
    });
  }

  final _$filteredListAtom =
      Atom(name: '_AstronomyControllerBase.filteredList');

  @override
  ObservableList<AstronomyModel> get filteredList {
    _$filteredListAtom.reportRead();
    return super.filteredList;
  }

  @override
  set filteredList(ObservableList<AstronomyModel> value) {
    _$filteredListAtom.reportWrite(value, super.filteredList, () {
      super.filteredList = value;
    });
  }

  final _$searchAtom = Atom(name: '_AstronomyControllerBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$isPaginationAtom =
      Atom(name: '_AstronomyControllerBase.isPagination');

  @override
  bool get isPagination {
    _$isPaginationAtom.reportRead();
    return super.isPagination;
  }

  @override
  set isPagination(bool value) {
    _$isPaginationAtom.reportWrite(value, super.isPagination, () {
      super.isPagination = value;
    });
  }

  final _$errorAtom = Atom(name: '_AstronomyControllerBase.error');

  @override
  DioErrorType get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(DioErrorType value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$getApodDataAsyncAction =
      AsyncAction('_AstronomyControllerBase.getApodData');

  @override
  Future getApodData() {
    return _$getApodDataAsyncAction.run(() => super.getApodData());
  }

  final _$_AstronomyControllerBaseActionController =
      ActionController(name: '_AstronomyControllerBase');

  @override
  dynamic setSearch(dynamic value) {
    final _$actionInfo = _$_AstronomyControllerBaseActionController.startAction(
        name: '_AstronomyControllerBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_AstronomyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSearch() {
    final _$actionInfo = _$_AstronomyControllerBaseActionController.startAction(
        name: '_AstronomyControllerBase.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$_AstronomyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clear() {
    final _$actionInfo = _$_AstronomyControllerBaseActionController.startAction(
        name: '_AstronomyControllerBase.clear');
    try {
      return super.clear();
    } finally {
      _$_AstronomyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
astronomyList: ${astronomyList},
filteredList: ${filteredList},
search: ${search},
isPagination: ${isPagination},
error: ${error},
isSearch: ${isSearch}
    ''';
  }
}
