part of 'player_cubit.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SeasonDropDown(
                StubObjects.stubSeasons,
                (season) => context.read<PlayerCubit>().changeSeason(season),
                initialSeason: context.read<PlayerCubit>().currentSeason,
              ),
              BlocBuilder<PlayerCubit, PlayerState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text(state.playerInSeason.name),
                      Text(state.playerInSeason.surname),
                      Text('${state.playerInSeason.currentSeason}'),
                      Text('${state.playerInSeason.average}'),
                      TeamCard(
                          (team) =>
                              context.read<PlayerCubit>().navigateToTeam(team),
                          state.playerInSeason.team),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
