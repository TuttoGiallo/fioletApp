part of 'teams_cubit.dart';

class TeamsScreen extends StatelessWidget {
  TeamsScreen({Key? key}) : super(key: key);

  final List<Season> seasons = StubObjects.stubSeasons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teams'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Text('filters:'),
                    SeasonDropDown(
                      seasons,
                      context.read<TeamsCubit>().changeSeason,
                    )
                  ],
                ),
                BlocBuilder<TeamsCubit, TeamsState>(
                  builder: (context, state) {
                    return Column(
                      children: state.filteredTeams
                          .map<Widget>(
                            (team) => Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(team.name),
                                    subtitle: Text(
                                        '${team.season.year} - ${team.season.seasonInYear}'),
                                  ),
                                  ElevatedButton(
                                      onPressed: () => context
                                          .read<TeamsCubit>()
                                          .navigateToPlayer(team),
                                      child: Text('SHOW')),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
