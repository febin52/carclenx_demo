
import 'package:carclenx_demo/data/models/makes_list_model.dart';
import 'package:equatable/equatable.dart';

class MakeState extends Equatable {
  @override
  List<Object> get props => [];
}

class MakeInitial extends MakeState {}

class ViewingProduct extends MakeState {}

class MakeSuccess extends MakeState {
  MakeSuccess({this.makesListModel});

  @override
  List<Object> get props => [];
  final MakesListModel? makesListModel;
}

class MakeEmpty extends MakeState {
  @override
  List<Object> get props => [];
}

class MakeError extends MakeState {
  MakeError({this.error});

  @override
  List<Object> get props => [];
  final String? error;
}
