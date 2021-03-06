import 'package:fiolet/router/base_router.dart';
import 'package:fiolet/router/fiolet_router.dart';
import 'package:fiolet/utils/model_services/match_service.dart';
import 'package:fiolet/utils/model_services/player_service.dart';
import 'package:flutter/material.dart';
import 'get_it_injector.dart';
import 'model_services/team_service.dart';
import 'mok_services/mok_db_service.dart';


//metodo che crea e registra, da capo, tutte i servizzi in DI.
Future createAndRegisterInjectedServices() async {
  injector.registerSingleton<BaseRouter>(
      FioletRouter(GlobalKey<NavigatorState>(debugLabel: 'fiolet_router')));

  //se registro una lazy singleton posso anche mettere della logica nel costruttore, altrimenti devo stare attento
  injector.registerLazySingleton(() => MokService.createForGetItRegistration());

  injector.registerLazySingleton<PlayerService>(() => PlayerService.createForGetItRegistration());

  injector.registerLazySingleton<TeamService>(() => TeamService.createForGetItRegistration());

  injector.registerLazySingleton<MatchService>(() => MatchService.createForGetItRegistration());
}
