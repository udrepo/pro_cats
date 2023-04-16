part of 'fact_bloc.dart';

@immutable
abstract class FactState {}

class FactInitial extends FactState {

}

class FactLoaded extends FactState {
 final CatFact catFact;

  FactLoaded({required this. catFact});
}
