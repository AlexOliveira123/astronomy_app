import 'package:flutter_modular/flutter_modular.dart';

abstract class IAstronomyRepository implements Disposable {
  Future getApodData();
}
