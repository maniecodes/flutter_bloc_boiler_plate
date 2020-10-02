import 'package:equatable/equatable.dart';

abstract class SongsEvent extends Equatable {
  const SongsEvent();

  @override
  List<Object> get props => [];
}

class SongsLoaded extends SongsEvent {
  final int hymnId;

  const SongsLoaded(this.hymnId);

  @override
  List<Object> get props => [hymnId];

  @override
  String toString() => 'SongsLoaded {hymnId: $hymnId}';
}
