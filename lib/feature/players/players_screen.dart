part of 'players_cubit.dart';

class PlayersScreen extends StatelessWidget {
  PlayersScreen({Key? key}) : super(key: key);

  final List<Season> seasons = StubObjects.stubSeasons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Text('filters:'),
                BlocBuilder<PlayersCubit, PlayersState>(
                  builder: (context, state) { return DropdownButton<Season>(
                    value:state.season,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (Season? newSeason) {
                      context.read<PlayersCubit>().changeSeason(newSeason);
                    },
                    items: seasons.map<DropdownMenuItem<Season>>((Season season) {
                      return DropdownMenuItem<Season>(
                        value: season,
                        child: Text('${season.year} - ${season.seasonInYear}'),
                      );
                    }).toList(),
                  );},
                ),
              ],
            ),
            BlocBuilder<PlayersCubit, PlayersState>(
              builder: (context, state) {
                return Column(
                    children: state.filteredPlayers
                        .map<Widget>((player) => Card(
                              child: Text('${player.name} - ${player.average}' ),
                            ))
                        .toList());
              },
            ),
          ],
        ),
      ),
    );
  }
}
