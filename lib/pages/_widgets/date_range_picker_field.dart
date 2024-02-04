import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangePickerField extends StatefulWidget {
  const DateRangePickerField({
    Key? key,
    this.textInputAction,
    this.currentRangeValue,
    this.currentValue,
    required this.labelText,
    required this.dateRangePickerView,
    this.allowViewNavigation,
    required this.onChanged,
  }) : super(key: key);
  final DateTimeRange? currentRangeValue;
  final DateTime? currentValue;
  final String labelText;
  final DateRangePickerView dateRangePickerView;
  final ValueChanged<DateTimeRange> onChanged;
  final TextInputAction? textInputAction;
  final bool? allowViewNavigation;

  @override
  State<DateRangePickerField> createState() => _DateRangePickerFieldState();
}

class _DateRangePickerFieldState extends State<DateRangePickerField> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.currentRangeValue != null) {
      _textController.text =
          '${widget.currentRangeValue!.start}/${widget.currentRangeValue!.end}';
    }
    if (widget.currentValue != null) {
      _textController.text = '${widget.currentValue!}';
    }
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        key: const Key('numberInputKey'),
        readOnly: true,
        onTap: () async {
          await showModalBottomSheet<Widget>(
            context: context,
            builder: (BuildContext context) => Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: SfDateRangePicker(
                  showActionButtons: true,
                  view: widget.dateRangePickerView,
                  selectionMode: DateRangePickerSelectionMode.range,
                  allowViewNavigation: widget.allowViewNavigation ?? true,
                  minDate: DateTime.now(),
                  onSubmit: (date) {
                    if (date is PickerDateRange) {
                      DateTime? endTime;
                      if (date.endDate == null) endTime = date.startDate;
                      final DateTimeRange rangeDate = DateTimeRange(
                        start: date.startDate!,
                        end: endTime ?? date.endDate!,
                      );
                      _textController.text =
                          '${DateFormat('dd.MM.yyyy').format(rangeDate.start)}/${DateFormat('dd.MM.yyyy').format(rangeDate.end)}';
                      widget.onChanged(rangeDate);
                      Navigator.pop(context);
                    } else if (date is DateTime) {
                      final DateTime selectedDate = date;
                      widget.onChanged(selectedDate as DateTimeRange);
                    }
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
        },
        controller: _textController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: const SizedBox(
            width: 24,
          ),
        ),
        // textInputAction: widget.textInputAction,
        // onChanged: (_) => widget.onChanged(_value),
      );
}
