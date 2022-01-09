part of 'chair_cubit.dart';

@immutable
abstract class ChairState {}

class ChiarInitial extends ChairState {}

class ChairSelectAll extends ChairState {
  List<Chair> chairs;
  ChairSelectAll({
    required this.chairs,
  });
}

class ChairSelectOne extends ChairState {
  Chair chair;
  ChairSelectOne({
    required this.chair,
  });
}

class ChairAdded extends ChairState {
  Chair chair;

  ChairAdded({
    required this.chair,
  });
}

class ChairLoadingState extends ChairState {}

class ChairUpdated extends ChairState {
  Chair chair;

  ChairUpdated({
    required this.chair,
  });
}

class ChairError extends ChairState {
  String error;

  ChairError({
    required this.error,
  });
}

class ChairDeleted extends ChairState {
  String done;

  ChairDeleted({
    required this.done,
  });
}
