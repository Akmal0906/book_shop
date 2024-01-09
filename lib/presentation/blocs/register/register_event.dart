part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}
final class RegisterInitial extends RegisterEvent {
  @override
  List<Object?> get props => [];

}

final class RegisterSubmitted extends RegisterEvent {
final SignUserModel model;

  const RegisterSubmitted({
   required this.model
  });

  @override
  List<Object?> get props => [model];
}

final class RegisterSignInEvent extends RegisterEvent{
  final String name;
  final String password;
 const RegisterSignInEvent({required this.name,required this.password});
  @override
  List<Object?> get props => [name,password];
}
