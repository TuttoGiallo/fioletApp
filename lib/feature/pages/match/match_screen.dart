part of 'match_cubit.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({Key? key}) : super(key: key);

  static const int numberOfHit = 10;
  static const double lineHeight = 50;

  @override
  Widget build(BuildContext context) {
    MatchCubit matchCubit = context.read<MatchCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Match'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                BlocBuilder<MatchCubit, MatchState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              matchCubit.match.homeTeam.name,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              'VS',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              matchCubit.match.foreignTeam.name,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                        Text(
                            '${matchCubit.match.data.year} - ${matchCubit.match.data.month} - ${matchCubit.match.data.day}'),
                        Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: lineHeight+7,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Player',
                                      style:
                                          TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ]..addAll(
                                    getMatchNamesOfPlayers(matchCubit.match)),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    dataRowHeight: lineHeight,
                                    columns: getMatchColumnsForPoints(),
                                    rows:
                                        getMatchRowsForPoints(matchCubit.match),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  List<DataRow> getMatchRowsForPoints(Match match) {
    List<DataRow> listPoints = [];

    for (PlayerInSeason player in match.homeTeam.players) {
      listPoints.add(
        DataRow(
            cells: List<DataCell>.generate(
          numberOfHit,
          (index) => DataCell(Text('0')),
        )),
      );
    }

    return listPoints;
  }

  List<DataColumn> getMatchColumnsForPoints() {
    List<DataColumn> listPoints = List.generate(
      numberOfHit,
      (index) => DataColumn(
        label: Text(
          '-${index + 1}-',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    );

    return listPoints;
  }

  Iterable<Widget> getMatchNamesOfPlayers(Match match) {
    List<Widget> listPlayersRow = [];

    for (PlayerInSeason player in match.homeTeam.players) {
      listPlayersRow.add(
        Container(
            width: 200,
            height: lineHeight,
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: Colors.amber, // Set border color
                      width: 0.1)), // Set border width
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${player.name}',
                  overflow: TextOverflow.clip,
                ),
                Text(
                  '${player.surname}',
                  overflow: TextOverflow.clip,
                ),
              ],
            )),
      );
    }
    return listPlayersRow;
  }
}
