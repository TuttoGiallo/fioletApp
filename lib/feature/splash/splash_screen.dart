part of 'splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<SplashCubit>().onInit();
    return Container(
        child: Center(
            child:Text('splash')));
  }
}
