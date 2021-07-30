part of 'matches_cubit.dart';

class MatchesScreen extends StatelessWidget {
  MatchesScreen({Key? key}) : super(key: key);

  final List<Season> seasons = StubObjects.stubSeasons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
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
                      context.read<MatchesCubit>().changeSeason,
                    )
                  ],
                ),
                BlocBuilder<MatchesCubit, MatchesState>(
                  builder: (context, state) {
                    return Column(
                      children: state.filteredMatches
                          .map<Widget>((match) => MatchCard(
                              (match) => context.read<MatchesCubit>().navigateToMatch(match),
                          match))
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