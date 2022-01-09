import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:chairs_factory/data/models/chiars/chair.dart';
import 'package:chairs_factory/data/repository/database_repository.dart';

part 'chair_state.dart';

class ChairCubit extends Cubit<ChairState> {
  DatabaseRepository databaseRepository;
  List<Chair>? chairs;
  Chair? chair;

  ChairCubit(
    this.databaseRepository,
  ) : super(ChiarInitial());

  setInit() {
    emit(ChiarInitial());
  }

  findAllChiar() {
    databaseRepository.findAllChiar()!.then((value) {
      chairs = value;
      if (chairs != null && chairs!.isNotEmpty) {
        emit(ChairSelectAll(chairs: chairs!));
      } else {
        emit(ChairError(error: 'Not Found Items'));
      }
      print('Entity Bloc ' + chairs.toString());
    });

    return chairs;
  }

  insertChiar(Chair chiarAdd) {
    emit(ChairLoadingState());
    databaseRepository.insertChiar(chiarAdd)!.then((value) {
      chair = value;
      if (chair != null) {
        emit(ChairAdded(chair: chair!));
      } else {
        emit(ChairError(error: 'Error Insert'));
      }
      print('Entity Bloc ' + chairs.toString());
    });

    return chairs;
  }

  updateChiar(Chair chiarAdd) {
    emit(ChairLoadingState());
    databaseRepository.updateChiar(chiarAdd)!.then((value) {
      chair = value;
      if (chair != null) {
        emit(ChairAdded(chair: chair!));
      } else {
        emit(ChairError(error: 'Error Insert'));
      }
      print('Entity Bloc ' + chairs.toString());
    });

    return chairs;
  }

  deleteChiar(Chair chiarAdd) {
    emit(ChairLoadingState());
    databaseRepository.deleteChiar(chiarAdd.id ?? 0).then((value) {
      chair = chiarAdd;
      if (value > 0) {
        findAllChiar();
      } else {
        emit(ChairError(error: 'Error Insert'));
      }
      print('Entity Bloc ' + chairs.toString());
    });

    return chairs;
  }
}
