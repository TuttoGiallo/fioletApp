import 'package:fiolet/feature/pages/players/players_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayersFilter extends StatelessWidget {
  const PlayersFilter(
    this.textController,
    this.onChangeValue,
    this.onEnableSwitch,
    this.filterType,
    this.caption, {
    Key? key,
    this.widthField = 20,
    this.alwaysEnable = false,
  }) : super(key: key);

  final TextEditingController textController;
  final Function(String newValue) onChangeValue;
  final Function(bool enable, String value) onEnableSwitch;
  final FilterType filterType;
  final String caption;
  final double widthField;
  final alwaysEnable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(caption),
        BlocBuilder<PlayersCubit, PlayersState>(
          builder: (context, state) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: widthField,
                    child: TextField(

                        controller: textController,
                        onChanged: (newValue) => onChangeValue(newValue),
                        keyboardType: TextInputType.number),
                  ),
                ),
                Visibility(
                  visible: !alwaysEnable,
                  child: Switch(
                      value: state.filterEnable[filterType]!,
                      onChanged: (subscribeUnsubscribe) => onEnableSwitch(
                          subscribeUnsubscribe, textController.value.text)),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
