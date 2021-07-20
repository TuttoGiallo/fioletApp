import 'package:fiolet/feature/model/season.dart';
import 'package:flutter/material.dart';

class SeasonDropDown extends StatefulWidget {
  SeasonDropDown(this.seasons, this.onChangeSeason,
      {this.initialSeason, Key? key})
      : super(key: key);

  final Function(Season? newSeason) onChangeSeason;
  final List<Season> seasons;
  final Season? initialSeason;

  @override
  _SeasonDropDownState createState() => _SeasonDropDownState();
}

class _SeasonDropDownState extends State<SeasonDropDown> {
  Season? currentSeason;

  @override
  void initState() {
    currentSeason = widget.initialSeason ?? widget.seasons.last;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Season>(
      value: currentSeason,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (Season? newSeason) {
        setState(() => currentSeason = newSeason);
        widget.onChangeSeason(newSeason);
      },
      items: widget.seasons.map<DropdownMenuItem<Season>>((Season season) {
        return DropdownMenuItem<Season>(
          value: season,
          child: Text('${season.year} - ${season.seasonInYear}'),
        );
      }).toList(),
    );
  }
}
