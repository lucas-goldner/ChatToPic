import 'package:chattopic/ui/shared/ds_modal.dart';
import 'package:chattopic/ui/style/constants/ds_modal_constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(context, title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 40),
      behavior: SnackBarBehavior.floating,
      content: SizedBox(
        height: DSModalConstants.modalHeight,
        width: DSModalConstants.modalWidth,
        child: DSModal(title),
      ),
    ),
  );
}
