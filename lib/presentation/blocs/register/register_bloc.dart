import 'package:bloc/bloc.dart';
import 'package:book_shop/data/network/api.dart';
import 'package:book_shop/domain/models/textfield_models/sign_user_model.dart';
import 'package:book_shop/utils/resource/data_state.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    on<RegisterSubmitted>(_signup);
    on<RegisterInitial>(_initial);
    on<RegisterSignInEvent>(_signIn);
  }

  _signup(RegisterSubmitted event, Emitter<RegisterState>emit) async {
    emit(RegisterLoadingState());
    DataState s = await FetchData().signUpMethod(event.model);
    if (s.runtimeType == DataSuccess) {
      DataState ss = await FetchData().getToken(s.data);
      switch (ss.runtimeType) {
        case const (DataSuccess):
          emit(RegisterSuccessState(success: ss.data,));
          break;
        case const (DataError):
          emit(RegisterFailureState(s.data));
          break;
        case const (DataFailed):
          emit(RegisterFailureState(s.error.toString()));
          break;
        default:
          print('SWITCHNING BIRONTASIGA TUSHMADI');
      }
    }
  }

  _signIn(RegisterSignInEvent event, Emitter<RegisterState>emit) async {
    emit(RegisterLoadingState());
    final SignUserModel model = SignUserModel(username: event.name,
        email: 'defaultemail1@gmail.com',
        password1: event.password,
        password2: event.password);

    DataState ss = await FetchData().getToken(model);
    switch (ss.runtimeType) {
      case const (DataSuccess):
        emit(RegisterSuccessState(success: ss.data,));
        break;
      case const (DataError):
        emit(RegisterFailureState(ss.data));
        break;
      case const (DataFailed):
        emit(RegisterFailureState(ss.error.toString()));
        break;
      default:
        print('SWITCHNING BIRONTASIGA TUSHMADI');
    }
  }

  _initial(RegisterInitial event, Emitter<RegisterState>emit) {
    emit(RegisterInitialState());
  }
}
