import 'package:fiolet/feature/model/match.dart';
import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  MatchCard(this.showOnPress, this.match, {Key? key}) : super(key: key);

  final Function(Match match) showOnPress;
  final Match match;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  match.homeTeam.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'VS',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  match.foreignTeam.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          subtitle: Text('${match.data.year} - ${match.data.month} - ${match.data.day}'),
        ),
        ElevatedButton(onPressed: () => showOnPress(match), child: Text('SHOW'))
      ],
    ));
  }
}
