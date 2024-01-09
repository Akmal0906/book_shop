part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitialState extends RegisterState {
  @override
  List<Object?> get props => [];

}

class RegisterLoadingState extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccessState extends RegisterState {
  final String success;
 const RegisterSuccessState({required this.success});
  @override
  List<Object?> get props => [];
}

class RegisterFailureState extends RegisterState {
  final String message;

  const RegisterFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
