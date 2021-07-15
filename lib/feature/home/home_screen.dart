part of 'home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Text(state.homeTitle);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    BlocProvider.of<HomeCubit>(context).changeRandomlyTitle(),
                child: Text(
                  'press and wait the magical change of title',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    BlocProvider.of<HomeCubit>(context).navigateToPlayers(),
                child: Text(
                  'Players',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
