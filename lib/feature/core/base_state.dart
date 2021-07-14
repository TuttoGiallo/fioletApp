part of 'base_cubit.dart';

abstract class BaseState extends Equatable {}

class EmptyState extends BaseState {
  @override
  List<Object?> get props => [];
}