part of 'team_cubit.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              BlocBuilder<TeamCubit, TeamState>(
                builder: (context, state) {
                  return Column(
                    children: state.team.players
                        .map<Widget>((playerInSeason) => PlayerInSeasonCard(
                            (playerInSeason) => context
                            .read<TeamCubit>()
                            .navigateToPlayer(playerInSeason),
                        playerInSeason))
                        .toList());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
