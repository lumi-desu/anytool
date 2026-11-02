import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final bool useRounded;
  final bool invertText;
  final ValueChanged<bool> onUseRoundedChanged;
  final ValueChanged<bool> onInvertTextChanged;

  const SettingsPage({
    super.key,
    required this.useRounded,
    required this.invertText,
    required this.onUseRoundedChanged,
    required this.onInvertTextChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _styborder;
  late bool _inverttext;

  @override
  void initState() {
    super.initState();
    _styborder = widget.useRounded;
    _inverttext = widget.invertText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Use rounded corner'),
            value: _styborder,
            onChanged: (v) {
              setState(() => _styborder = v);
              widget.onUseRoundedChanged(v);
            },
          ),
          SwitchListTile(
            title: const Text('Invert text color'),
            value: _inverttext,
            onChanged: (v) {
              setState(() => _inverttext = v);
              widget.onInvertTextChanged(v);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            subtitle: const Text('AnyTool — AIO utilities app'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
