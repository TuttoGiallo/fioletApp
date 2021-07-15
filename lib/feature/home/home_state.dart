part of 'home_cubit.dart';

class HomeState extends BaseState{
  @override
  List<Object?> get props => [homeTitle];

  String homeTitle;

  HomeState(this.homeTitle);
}