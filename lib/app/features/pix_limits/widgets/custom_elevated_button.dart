import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_text_styles.dart';

class CustomElevatedButton extends SDUIWidget {
  String label = '';
  double horizontalPadding = 0.0;
  double verticalPadding = 0.0;
  String backgroundColor = '';
  ActionCallback? onPressed;
  bool hasPop = false;
  String popMessage = '';

  @override
  SDUIWidget fromJson(Map<String, dynamic>? json) {
    label = json?['label'] ?? '';
    horizontalPadding = json?['horizontalPadding'] ?? 16.0;
    verticalPadding = json?['verticalPadding'] ?? 0.0;
    backgroundColor = json?['backgroundColor'] ?? '';
    hasPop = json?['hasPop'] ?? false;
    popMessage = json?['popMessage'] ?? '';
    return this;
  }

  @override
  Widget toWidget(BuildContext context) {
    Future<String?> onSubmit(BuildContext context) => onPressed == null
        ? action.execute(context, null).then((value) => action.handleResult(context, value))
        : onPressed!(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: toColor(backgroundColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        onPressed: () async {
          onSubmit(context);
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const SimpleDialog(
                elevation: 0.0,
                backgroundColor: Colors.transparent, // can change this to your prefered color
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            },
          );
          if (hasPop) {
            await Future.delayed(const Duration(seconds: 3)).then((_) {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(popMessage),
                ),
              );
            });
          }
        },
        child: Text(
          label,
          style: context.appTextStyles.titleSmall.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
