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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Text('filters:'),
                  SeasonDropDown(
                    seasons,
                    context.read<PlayersCubit>().changeSeason,
                  )
                ],
              ),
              BlocBuilder<PlayersCubit, PlayersState>(
                builder: (context, state) {
                  return Column(
                      children: state.filteredPlayers
                          .map<Widget>((playerInSeason) => PlayerInSeasonCard(
                              (playerInSeason) => context
                                  .read<PlayersCubit>()
                                  .navigateToPlayer(playerInSeason),
                              playerInSeason))
                          .toList());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
