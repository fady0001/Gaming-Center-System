import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../domain/entities/unified_device.dart';
import '../cubit/devices_overview_cubit.dart';

/// ثلاث بطاقات: شغالة / شاغرة / معطلة. الضغط على بطاقة يفعّل الفلتر،
/// والضغط عليها مرة ثانية يلغيه.
class DeviceStatusBar extends StatelessWidget {
  final DeviceStatus? selected;
  final ValueChanged<DeviceStatus?> onChanged;

  const DeviceStatusBar({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  static const Map<DeviceStatus, Color> _colors = {
    DeviceStatus.active: ColorPalette.statusActive,
    DeviceStatus.idle: ColorPalette.statusIdle,
    DeviceStatus.maintenance: ColorPalette.statusMaintenance,
  };

  static const Map<DeviceStatus, IconData> _icons = {
    DeviceStatus.active: Icons.play_circle_outline,
    DeviceStatus.idle: Icons.check_circle_outline,
    DeviceStatus.maintenance: Icons.build_circle_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesOverviewCubit, DevicesOverviewState>(
      builder: (context, state) {
        return Row(
          children: [
            for (final status in DeviceStatus.values) ...[
              Expanded(
                child: _StatusCard(
                  label: status.arabicLabel,
                  count: state.countOf(status),
                  color: _colors[status]!,
                  icon: _icons[status]!,
                  isSelected: selected == status,
                  onTap: () => onChanged(selected == status ? null : status),
                ),
              ),
              if (status != DeviceStatus.values.last)
                const SizedBox(width: Dimensions.spaceS),
            ],
          ],
        );
      },
    );
  }
}

class _StatusCard extends StatefulWidget {
  final String label;
  final int count;
  final Color color;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _StatusCard({
    required this.label,
    required this.count,
    required this.color,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<_StatusCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.color;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(Dimensions.radiusM),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.spaceM,
              vertical: Dimensions.spaceS,
            ),
            decoration: BoxDecoration(
              color: color.withValues(alpha: widget.isSelected ? 0.22 : 0.10),
              borderRadius: BorderRadius.circular(Dimensions.radiusM),
              border: Border.all(
                color: color.withValues(alpha: widget.isSelected ? 1.0 : 0.45),
                width: widget.isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Icon(widget.icon, color: color, size: Dimensions.iconL),
                const SizedBox(width: Dimensions.spaceS),
                Expanded(
                  child: Text(
                    widget.label,
                    style: TextStyle(color: color, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  '${widget.count}',
                  style: TextStyle(
                    color: color,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
