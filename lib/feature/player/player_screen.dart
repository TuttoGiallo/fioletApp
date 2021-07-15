part of 'player_cubit.dart';


class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Player staticPlayer = context.read<PlayerCubit>().state.player;
    return Scaffold(
      appBar: AppBar(title: Text('Player'),),
      body: SafeArea(
        child: Row(
          children: [
            Text('campionato: ${DateTime.now().year} - primaverile'),
            Text(staticPlayer.name),
            Text(staticPlayer.surname),
          ],
        ),
      ),

    );
  }
}



