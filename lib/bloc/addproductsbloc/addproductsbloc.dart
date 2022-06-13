import 'dart:async';

import 'package:carclenx_demo/bloc/addproductsbloc/addproductsevent.dart';
import 'package:carclenx_demo/bloc/addproductsbloc/addproductstate.dart';
import 'package:carclenx_demo/data/models/makes_list_model.dart';

import 'package:carclenx_demo/data/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMakeBloc extends Bloc<MakeEvent, MakeState> {
  GetMakeBloc() : super(MakeState()) {
    on<GetMake>(_getMake);
  }

  Future<FutureOr<void>> _getMake(
      GetMake event, Emitter<MakeState> emit) async {
    emit(ViewingProduct());
    MakesListModel makesListModel;

    makesListModel =
        await Repository().fetchMake(url: '/v1.0/make/');
    if (makesListModel.status == 'OK') {
      emit(MakeSuccess(makesListModel:makesListModel));
    } else {
      emit(MakeError(error:makesListModel.message));
    }
  }
}
