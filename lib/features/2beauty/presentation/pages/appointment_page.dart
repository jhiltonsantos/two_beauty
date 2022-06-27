// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
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

import '../../../../core/routes/routes.dart';

class AppointmentPage extends StatefulWidget {
  final String id;

  const AppointmentPage({Key? key, required this.id}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
      if (state is LoadingAppointmentState) {
        return const ProgressWidget();
      }
      if (state is LoadedAppointmentState) {
        return AppointmentFormWidget(id: widget.id);
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

    List<Map<String, dynamic>> hoursOpen = [
      {'value': "08:00"},
      {'value': "09:00"},
      {'value': "10:00"},
      {'value': "11:00"},
      {'value': "12:00"},
      {'value': "13:00"},
      {'value': "14:00"},
      {'value': "15:00"},
      {'value': "16:00"},
      {'value': "17:00"},
      {'value': "18:00"},
      {'value': "19:00"},
      {'value': "20:00"},
    ];

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
        physics: const BouncingScrollPhysics(),
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
                      width: 70,
                      height: 90,
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
                    child: LabelFormItem(title: 'Horário disponíveis'),
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown,
                    initialValue: hoursOpen[0][0],
                    labelText: 'Selecione um horário',
                    items: hoursOpen,
                    onChanged: (value) {
                      valueHour.text = value;
                    },
                  ),
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
                        .emit(const LoadedAppointmentState());
                  }
                  final AgendaEntity appointmentData = AgendaEntity(
                    store: int.parse(widget.id),
                    service: 1,
                    date: day,
                    timetable: hour,
                  );

                  BlocProvider.of<AppointmentCubit>(context)
                      .postAppointment(appointmentData, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedHourWidget extends StatefulWidget {
  const SelectedHourWidget({
    Key? key,
    required ScrollController scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  @override
  State<SelectedHourWidget> createState() => _SelectedHourWidgetState();
}

class _SelectedHourWidgetState extends State<SelectedHourWidget> {
  bool isSelected = false;
  int valueHour = 8;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: SizedBox(
          height: 80,
          width: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: widget._scrollController,
              itemCount: 13,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: ListTile(
                    title: Text('$index:00'),
                    leading: Radio(
                      value: index,
                      groupValue: valueHour,
                      activeColor: ColorManager.purple_200,
                      onChanged: index == 5
                          ? null
                          : (int? value) {
                              valueHour = value!;
                            },
                    ),
                  ),
                );
              }),
        )),
      ],
    );
  }
}
