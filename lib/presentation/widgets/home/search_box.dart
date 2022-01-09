import 'package:flutter/material.dart';

import 'package:chairs_factory/presentation/widgets/utils/text_from_fielid.dart';
import 'package:chairs_factory/utils/themes/color.dart';

class SreachBox extends StatefulWidget {
  const SreachBox({
    Key? key,
    required this.title,
    required this.onChanged,
  }) : super(key: key);
  final String title;
  final Function(String?) onChanged;

  @override
  _SreachBoxState createState() => _SreachBoxState();
}

class _SreachBoxState extends State<SreachBox> {
  bool clickedUnread = false;
  final TextEditingController _controller = TextEditingController();

  String? values;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.conColor3.withOpacity(.6),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColor.txtColor4,
          ),
          Expanded(
            child: TextFormFieldApp(
              title: widget.title,
              validator: validator,
              onSaved: onSaved,
              onChanged: onChanged,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.transparent),
              ),
              bColor: AppColor.transparent,
              padding: EdgeInsets.zero,
              controller: _controller,
            ),
          ),
          if (values != null && values!.isNotEmpty)
            IconButton(
              onPressed: () => setState(() {
                _controller.clear();
                values = null;
              }),
              icon: const Icon(Icons.clear),
            ),
        ],
      ),
    );
  }

  String? validator(String? p1) {}

  onSaved(String? p1) {}

  String? onChanged(String? val) {
    setState(() {
      values = val;
    });
    widget.onChanged(val);
  }
}
