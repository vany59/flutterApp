import 'package:app/store/main_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

enum Type { text, password }

class RoundedInput extends StatefulWidget {
  RoundedInput({
    Key key,
    this.hint,
    this.model,
    this.field,
    this.type,
    this.icon,
    this.appendIcon,
  }) : super(key: key);

  final String hint;
  final String model;
  final String field;
  final Type type;
  final Icon icon;
  final Icon appendIcon;
  @override
  _RoundedInputState createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  bool isHiddenPass = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: widget.type == Type.password && isHiddenPass,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "${widget.hint}",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            prefixIcon: widget.icon ?? null,
            suffixIcon: IconButton(
              icon: Icon(
                widget.appendIcon ?? widget.type == Type.password
                    ? isHiddenPass
                        ? CupertinoIcons.eye_slash_fill
                        : CupertinoIcons.eye_fill
                    : null,
              ),
              onPressed: () {
                setState(() {
                  isHiddenPass = !isHiddenPass;
                });
              },
            )),
        onChanged: (val) {
          store[widget.model].change(field: widget.field, value: val);
        },
      ),
    );
  }
}
