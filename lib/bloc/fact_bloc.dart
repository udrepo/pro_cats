import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:pro_cats/entity/cat_fact.dart';
import 'package:dio/dio.dart';

import '../api/api_client.dart';

part 'fact_event.dart';

part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  FactBloc() : super(FactInitial()) {
    on<UpdateFact>((event, emit) async {
      emit(FactInitial());
      final dio = Dio(BaseOptions(contentType: 'application/json'));
      final client = ApiClient(dio);
      CatFact catFact = await client.getTasks();
      var box = await Hive.openBox<CatFact>('facts');
      catFact.createdAt = DateTime.now();
      box.put('${box.length}', catFact);
      await CachedNetworkImage.evictFromCache("https://cataas.com/cat");
      emit(FactLoaded(catFact: catFact));
    });
  }
}
