import 'package:drone/bloc/plan_flight_cubit/plan_flight_cubit.dart';
import 'package:drone/models/uas_id_model.dart';
import 'package:drone/pages/_widgets/name_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UasIDInput extends StatelessWidget {
  const UasIDInput({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PlanFlightCubit, PlanFlightState>(
        buildWhen: (previous, current) =>
            previous.uasID.value != current.uasID.value ||
            previous.errorMessage != current.errorMessage,
        builder: (_, state) => NameTextFormField(
          labelText: 'UAS ID',
          validator: (_) =>
              (state.uasID.isNotValid && state.uasID.error != null)
                  ? UasID.getError(state.uasID.error!)
                  : _getError(state.errorMessage),
          textInputAction: TextInputAction.next,
          initialValue: state.uasID.value,
          onChanged: (value) {
            context.read<PlanFlightCubit>().uasIDChanged(uasID: value);
          },
        ),
      );

  String? _getError(String? error) {
    if (error == null) return null;
  }
}
