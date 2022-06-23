// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/appointment/appointment_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/appointment/appointment_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_card_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_form_item.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_field_item.dart';

import '../../../../core/routes/routes.dart';

class AppointmentPage extends StatelessWidget {
  final String id;

  const AppointmentPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
      if (state is LoadingAppointmentState) {
        return const ProgressWidget();
      }
      if (state is LoadedAppointmentState) {
        return AppointmentFormWidget(id: id);
      }
      if (state is SentAppointmentState) {
        return ErrorCardWidget(
          message: state.appointmentData.date,
          function: () => BlocProvider.of<AppointmentCubit>(context)
              .emit(const LoadedAppointmentState()),
        );
      }
      if (state is ErrorAppointmentState) {
        return ErrorCardWidget(
          message: state.message,
          function: () => BlocProvider.of<AppointmentCubit>(context)
              .emit(const LoadedAppointmentState()),
        );
      }
      return const ErrorPage();
    });
  }
}

class AppointmentFormWidget extends StatefulWidget {
  const AppointmentFormWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<AppointmentFormWidget> createState() => _AppointmentFormWidgetState();
}

class _AppointmentFormWidgetState extends State<AppointmentFormWidget> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TextEditingController valueHour = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: AppBarWidget(
            title: 'Agendamento',
            leadingIcon: Icons.arrow_back,
            leadingOnTap: () => Navigator.of(context)
                .pushReplacementNamed(detailStore, arguments: widget.id),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 24.0, right: 24.0),
              child: Text(
                'Para realizar o agendamento, escolha um dia e um horário logo abaixo.',
                style: TextStyles.subtitleInitApp(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 24.0, right: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelFormItem(title: 'Dias disponíveis'),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: DatePicker(
                      DateTime.now(),
                      onDateChange: (date) {
                        setState(() {
                          selectedDay = date;
                        });
                      },
                      initialSelectedDate: DateTime.now(),
                      width: 60,
                      height: 80,
                      locale: "pt_BR",
                      daysCount: 15,
                      selectionColor: ColorManager.purple_100,
                      selectedTextColor: ColorManager.purple_200,
                      deactivatedColor: ColorManager.red_200,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 24.0, right: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: LabelFormItem(title: 'Horários disponíveis'),
                  ),
                  TextFieldItem(
                    controller: valueHour,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
              child: ButtonIntroApp(
                styleButton: ButtonStyles.buttonPrimary(),
                styleText: TextStyles.buttonApp(ColorManager.white_100),
                text: 'Agendar',
                onPressed: () async {
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String dateFormatted = formatter.format(selectedDay);

                  final String day = dateFormatted;
                  final String hour = valueHour.text;

                  if (day.isEmpty || hour.isEmpty) {
                    BlocProvider.of<AppointmentCubit>(context)
                        .emit(const ErrorAppointmentState("Faltando dados"));
                  }
                  final AgendaEntity appointmentData = AgendaEntity(
                    store: int.parse(widget.id),
                    service: 1,
                    date: day,
                    timetable: hour,
                  );

                  BlocProvider.of<AppointmentCubit>(context)
                      .postAppointment(appointmentData);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
