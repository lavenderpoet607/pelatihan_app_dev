import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_enum.dart';
import 'package:pelatihan_app_dev/custom_widget/custom_widget_state.dart';

class CustomWidgetPreview extends StatefulWidget {
  final CustomWidgetConfig config;
  final ValueChanged<CustomWidgetConfig>? onConfigChanged;

  const CustomWidgetPreview({
    super.key,
    required this.config,
    this.onConfigChanged,
  });

  @override
  State<CustomWidgetPreview> createState() => _CustomWidgetPreviewState();
}

class _CustomWidgetPreviewState extends State<CustomWidgetPreview> {
  bool _darkCanvas = false;
  int _counterClick = 0;

  void _handleAction(BuildContext context) {
    setState(() {
      _counterClick++;
    });

    switch (widget.config.actionType) {
      case CustomActionType.snackBar:
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(widget.config.selectedIcon, color: Colors.white, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${widget.config.title} diklik! (Total: $_counterClick kali)',
                  ),
                ),
              ],
            ),
            backgroundColor: widget.config.colorTheme.primaryColor,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        break;

      case CustomActionType.dialogAlert:
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Row(
              children: [
                Icon(
                  widget.config.selectedIcon,
                  color: widget.config.colorTheme.primaryColor,
                ),
                const SizedBox(width: 8),
                Text(widget.config.title),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.config.subtitle),
                const SizedBox(height: 12),
                Text(
                  'Fungsi aksi berhasil dipicu dari widget yang dikustomisasi oleh user.',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Tutup'),
              ),
            ],
          ),
        );
        break;

      case CustomActionType.modalBottomSheet:
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (ctx) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: widget.config.colorTheme.primaryColor
                          .withValues(alpha: 0.2),
                      child: Icon(
                        widget.config.selectedIcon,
                        color: widget.config.colorTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.config.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.config.subtitle,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.share_rounded),
                  title: const Text('Bagikan Widget Ini'),
                  onTap: () => Navigator.pop(ctx),
                ),
                ListTile(
                  leading: const Icon(Icons.copy_rounded),
                  title: const Text('Salin Konfigurasi'),
                  onTap: () => Navigator.pop(ctx),
                ),
              ],
            ),
          ),
        );
        break;

      case CustomActionType.toggleState:
        if (widget.onConfigChanged != null) {
          widget.onConfigChanged!(
            widget.config.copyWith(isActive: !widget.config.isActive),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _darkCanvas ? const Color(0xFF0F172A) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _darkCanvas ? Colors.white12 : Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: _darkCanvas
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.grey.shade50,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              border: Border(
                bottom: BorderSide(
                  color: _darkCanvas ? Colors.white12 : Colors.grey.shade200,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Live Interactive Canvas',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: _darkCanvas ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _darkCanvas
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        size: 18,
                        color: _darkCanvas ? Colors.amber : Colors.grey,
                      ),
                      tooltip: 'Ubah Latar Kanvas',
                      onPressed: () {
                        setState(() {
                          _darkCanvas = !_darkCanvas;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(child: _buildSelectedWidget(context)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _darkCanvas
                  ? Colors.white.withValues(alpha: 0.03)
                  : Colors.grey.shade50,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Klik widget di atas untuk menguji aksi',
                  style: TextStyle(
                    fontSize: 11,
                    color: _darkCanvas ? Colors.white54 : Colors.grey.shade600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: widget.config.colorTheme.primaryColor.withValues(
                      alpha: 0.15,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.config.actionType.label,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: widget.config.colorTheme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedWidget(BuildContext context) {
    switch (widget.config.widgetType) {
      case CustomWidgetType.card:
        return _buildCardPreview(context);
      case CustomWidgetType.button:
        return _buildButtonPreview(context);
      case CustomWidgetType.inputField:
        return _buildInputFieldPreview(context);
      case CustomWidgetType.avatar:
        return _buildAvatarPreview(context);
      case CustomWidgetType.banner:
        return _buildBannerPreview(context);
    }
  }

  Widget _buildCardPreview(BuildContext context) {
    final theme = widget.config.colorTheme;
    return Container(
      decoration: BoxDecoration(
        color: widget.config.hasGradient ? null : theme.primaryColor,
        gradient: widget.config.hasGradient
            ? LinearGradient(
                colors: [theme.primaryColor, theme.accentColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: BorderRadius.circular(widget.config.borderRadius),
        border: widget.config.isOutlined
            ? Border.all(color: theme.primaryColor, width: 2)
            : null,
        boxShadow: widget.config.hasShadow
            ? [
                BoxShadow(
                  color: theme.primaryColor.withValues(alpha: 0.3),
                  blurRadius: widget.config.elevation * 3,
                  offset: Offset(0, widget.config.elevation),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.config.borderRadius),
          onTap: () => _handleAction(context),
          child: Padding(
            padding: EdgeInsets.all(widget.config.padding),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    widget.config.selectedIcon,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.config.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.config.subtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Colors.white70),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonPreview(BuildContext context) {
    final theme = widget.config.colorTheme;
    if (widget.config.hasGradient) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.primaryColor, theme.accentColor],
          ),
          borderRadius: BorderRadius.circular(widget.config.borderRadius),
          boxShadow: widget.config.hasShadow
              ? [
                  BoxShadow(
                    color: theme.primaryColor.withValues(alpha: 0.35),
                    blurRadius: widget.config.elevation * 2,
                    offset: Offset(0, widget.config.elevation),
                  ),
                ]
              : null,
        ),
        child: ElevatedButton.icon(
          onPressed: widget.config.isActive
              ? () => _handleAction(context)
              : null,
          icon: Icon(widget.config.selectedIcon, color: Colors.white),
          label: Text(
            widget.config.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: widget.config.padding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.config.borderRadius),
            ),
          ),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: widget.config.isActive ? () => _handleAction(context) : null,
      icon: Icon(widget.config.selectedIcon),
      label: Text(widget.config.title),
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
        elevation: widget.config.elevation,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: widget.config.padding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.config.borderRadius),
          side: widget.config.isOutlined
              ? const BorderSide(color: Colors.white, width: 2)
              : BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildInputFieldPreview(BuildContext context) {
    final theme = widget.config.colorTheme;
    return TextField(
      enabled: widget.config.isActive,
      decoration: InputDecoration(
        labelText: widget.config.title,
        hintText: widget.config.subtitle,
        prefixIcon: Icon(widget.config.selectedIcon, color: theme.primaryColor),
        filled: true,
        fillColor: _darkCanvas ? Colors.white12 : Colors.grey.shade50,
        labelStyle: TextStyle(
          color: _darkCanvas ? Colors.white70 : Colors.black87,
        ),
        hintStyle: TextStyle(
          color: _darkCanvas ? Colors.white38 : Colors.grey.shade400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.config.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.config.borderRadius),
          borderSide: BorderSide(color: theme.primaryColor, width: 2),
        ),
      ),
      onChanged: (value) => _handleAction(context),
    );
  }

  Widget _buildAvatarPreview(BuildContext context) {
    final theme = widget.config.colorTheme;
    return GestureDetector(
      onTap: () => _handleAction(context),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(widget.config.padding),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: widget.config.hasGradient
                  ? LinearGradient(
                      colors: [theme.primaryColor, theme.accentColor],
                    )
                  : null,
              color: !widget.config.hasGradient ? theme.primaryColor : null,
              boxShadow: widget.config.hasShadow
                  ? [
                      BoxShadow(
                        color: theme.primaryColor.withValues(alpha: 0.35),
                        blurRadius: widget.config.elevation * 2,
                        offset: Offset(0, widget.config.elevation),
                      ),
                    ]
                  : null,
            ),
            child: CircleAvatar(
              radius: widget.config.borderRadius.clamp(28.0, 50.0),
              backgroundColor: _darkCanvas
                  ? const Color(0xFF1E293B)
                  : Colors.white,
              child: Icon(
                widget.config.selectedIcon,
                size: 36,
                color: theme.primaryColor,
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: widget.config.isActive ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                  color: _darkCanvas ? const Color(0xFF0F172A) : Colors.white,
                  width: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerPreview(BuildContext context) {
    final theme = widget.config.colorTheme;
    return Container(
      padding: EdgeInsets.all(widget.config.padding),
      decoration: BoxDecoration(
        color: theme.primaryColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(widget.config.borderRadius),
        border: Border.all(
          color: theme.primaryColor.withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(widget.config.selectedIcon, color: theme.primaryColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.config.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: _darkCanvas ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.config.subtitle,
                  style: TextStyle(
                    color: _darkCanvas ? Colors.white70 : Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              size: 18,
              color: _darkCanvas ? Colors.white70 : Colors.black54,
            ),
            onPressed: () => _handleAction(context),
          ),
        ],
      ),
    );
  }
}
