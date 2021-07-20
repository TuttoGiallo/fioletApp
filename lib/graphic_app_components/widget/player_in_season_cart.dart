import 'package:fiolet/feature/model/player.dart';
import 'package:flutter/material.dart';

class PlayerInSeasonCard extends StatelessWidget {
  PlayerInSeasonCard(this.showOnPress, this.playerInSeason, {Key? key})
      : super(key: key);

  final Function(PlayerInSeason playerInSeason) showOnPress;
  final PlayerInSeason playerInSeason;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: [
            ListTile(
              title: Text(playerInSeason.player.name),
              subtitle: Text('average: ${
                  playerInSeason.average}'),
            ),
            ElevatedButton(
                onPressed: () => showOnPress(playerInSeason),
                child: Text('SHOW'))
          ],
        ));
  }
}
