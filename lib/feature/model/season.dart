import 'package:equatable/equatable.dart';

class Season extends Equatable{
  Season(this.year, this.seasonInYear);

  int year;
  String seasonInYear;



  @override
  // TODO: implement props
  List<Object?> get props => [year, seasonInYear];
}

enum SeasonInYear {spring, autumn}