import 'package:fiolet/feature/model/team.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  TeamCard(this.showOnPress, this.team, {Key? key})
      : super(key: key);

  final Function(Team team) showOnPress;
  final Team team;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: [
            ListTile(
              title: Text(team.name),
              subtitle: Text(
                  '${team.season.year} - ${team.season.seasonInYear}'),
            ),
            ElevatedButton(
                onPressed: () => showOnPress(team),
                child: Text('SHOW'))
          ],
        ));
  }
}
