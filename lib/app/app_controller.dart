import 'package:connectivity/connectivity.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final Connectivity connectivity;
  var subscription;

  _AppControllerBase(this.connectivity) {
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setConnectivityResult(result);
    });
  }

  @observable
  ConnectivityResult connectivityResult;

  @action
  setConnectivityResult(value) {
    connectivityResult = value;
  }

  dispose() {
    subscription?.cancel();
  }
}
