import 'package:flutter/material.dart';

import '../../domain/entities/date_range.dart';

/// يومي / أسبوعي / شهري / نطاق مخصص (الأخير يفتح منتقي تاريخ).
class RangeSelector extends StatelessWidget {
  final RangeSelection selection;
  final ValueChanged<RangeSelection> onChanged;

  const RangeSelector({
    super.key,
    required this.selection,
    required this.onChanged,
  });

  Future<void> _pickCustom(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: now,
      initialDateRange: selection.custom == null
          ? null
          : DateTimeRange(
              start: selection.custom!.start,
              end: selection.custom!.end.subtract(const Duration(days: 1)),
            ),
    );
    if (picked == null) return;
    final start = DateTime(picked.start.year, picked.start.month, picked.start.day);
    final endDay = DateTime(picked.end.year, picked.end.month, picked.end.day);
    onChanged(RangeSelection(
      RangePreset.custom,
      custom: DateRange(start, endDay.add(const Duration(days: 1))),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<RangePreset>(
      showSelectedIcon: false,
      segments: [
        for (final p in RangePreset.values)
          ButtonSegment(value: p, label: Text(p.arabicLabel)),
      ],
      selected: {selection.preset},
      onSelectionChanged: (s) {
        final preset = s.first;
        if (preset == RangePreset.custom) {
          _pickCustom(context);
        } else {
          onChanged(RangeSelection(preset));
        }
      },
    );
  }
}
