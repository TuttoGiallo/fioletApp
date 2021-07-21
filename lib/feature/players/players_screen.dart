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
                  Row(
                    children: [
                      Text('min average'),
                      BlocBuilder<PlayersCubit, PlayersState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 20,
                                  child: TextField(
                                      controller: controllerMinAverageFilter,
onChanged: (newValue) => playersCubit.changeFilterMinAverage(newValue),
                                      keyboardType: TextInputType.number),
                                ),
                              ),
                              Switch(
                                  value: state.minAverageEnable,
                                  onChanged: (subscribeUnsubscribe) {
                                    playersCubit.subscribeMinAverageFilter(
                                        subscribeUnsubscribe);
                                  }),
                            ],
                          );
                        },
                      )
                    ],
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
