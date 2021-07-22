part of 'players_cubit.dart';

class PlayersScreen extends StatefulWidget {
  PlayersScreen({Key? key}) : super(key: key);

  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  final List<Season> seasons = StubObjects.stubSeasons;
  final TextEditingController controllerMinAverageFilter =
      new TextEditingController();
  final TextEditingController controllerMaxAverageFilter =
      new TextEditingController();
  final TextEditingController controllerNameSurnameFilter =
  new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PlayersCubit playersCubit = context.read<PlayersCubit>();
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
                    playersCubit.changeFilterSeason,
                  ),
                  PlayersFilter(
                      controllerNameSurnameFilter,
                          (newVal) => playersCubit..changeFilterNameSurname(newVal),
                          (enable, value) =>
                          playersCubit..subscribeNameSurnameFilter(enable, value),
                      FilterType.nameSurname,
                      'Name Surname',
                      widthField: 170,
                    alwaysEnable: playersCubit.nameSurnameAlwaysEnable(),
                  ),
                  PlayersFilter(
                      controllerMinAverageFilter,
                      (newVal) => playersCubit.changeFilterMinAverage(newVal),
                      (enable, value) =>
                          playersCubit.subscribeMinAverageFilter(enable, value),
                      FilterType.minAverage,
                      'min average'),
                  PlayersFilter(
                      controllerMaxAverageFilter,
                      (newVal) => playersCubit.changeFilterMaxAverage(newVal),
                      (enable, value) =>
                          playersCubit.subscribeMaxAverageFilter(enable, value),
                      FilterType.maxAverage,
                      'Max average'),
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
