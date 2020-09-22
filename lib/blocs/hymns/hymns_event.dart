import 'package:equatable/equatable.dart';

abstract class HymnsEvent extends Equatable {
  const HymnsEvent();

  @override
  List<Object> get props => [];
}

class HymnsLoaded extends HymnsEvent {}
