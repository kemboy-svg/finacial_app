import 'package:flutter/material.dart';
import 'package:gcib_bank/app_exports.dart';

class UtilityWidgets {
  static showFeedbackDialog(ctx,
      {required String msg,
      required bool isError,
      required VoidCallback onClick}) {
    return showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Center(
            child: isError
                ?  Icon(
                    Icons.error_outline,
                    color: appTheme.indigo800,
                    size: 44.0,
                  )
                : const Icon(
                    // Icons.check_circle_outline,
                    Icons.check,
                    color: Colors.green,
                    size: 44.0,
                  ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ElevatedButton(
                  onPressed: onClick,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(isError ? appTheme.red900 : appTheme.blueGray100),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the value as needed
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13.0),
                    child: Text(
                      'Ok',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

 
}




class UtilityDialogWidget extends StatelessWidget {
  final String msg;
  final String typerr;

   UtilityDialogWidget({super.key, required this.msg, required this.typerr});
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      boundaryMargin: EdgeInsets.all(80),
      minScale: 0.5,
      maxScale: 4,
      child: AlertDialog(
        title: Text(
          typerr,
          style: TextStyle(color: Colors.red),
        ),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
        ],
      ),
    );
  }
}
