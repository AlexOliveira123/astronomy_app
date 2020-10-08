import 'details_page.dart';
import 'repositories/astronomy_repository.dart';
import 'astronomy_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'astronomy_page.dart';

class AstronomyModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AstronomyRepository,
        $AstronomyController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => AstronomyPage(),
        ),
        ModularRouter(
          '/details',
          child: (_, args) => DetailsPage(),
        )
      ];

  static Inject get to => Inject<AstronomyModule>.of();
}
