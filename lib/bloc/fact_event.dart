part of 'fact_bloc.dart';

@immutable
abstract class FactEvent {}

class UpdateFact extends FactEvent{
    UpdateFact();
}
