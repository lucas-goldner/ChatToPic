import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/ui/onboarding/name/widgets/onboarding_name_input_background.dart';
import 'package:chattopic/ui/onboarding/name/widgets/onboarding_name_input_borders.dart';
import 'package:chattopic/ui/onboarding/name/widgets/onboarding_name_input_button_row.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_text_styles.dart';
import 'package:chattopic/ui/style/constants/ds_name_input_constants.dart';
import 'package:chattopic/ui/onboarding/name/widgets/onboarding_name_input_names_squares.dart';
import 'package:chattopic/ui/style/helper/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingNameInput extends StatefulWidget {
  const OnboardingNameInput(this.goToNextPage, {super.key});
  final VoidCallback goToNextPage;

  @override
  State<OnboardingNameInput> createState() => _OnboardingNameInputState();
}

class _OnboardingNameInputState extends State<OnboardingNameInput> {
  final TextEditingController _textEditingController = TextEditingController();

  _onEdit(String value) {
    if (_textEditingController.text.length >=
        DSNameInputConstants.letterLimit) {
      _textEditingController.text =
          value.substring(1, DSNameInputConstants.letterLimit) +
              value.substring(0, 1);
    }
  }

  void _deleteLastLetter() {
    String currentText = _textEditingController.text;
    if (currentText.isNotEmpty) {
      _textEditingController.text =
          currentText.substring(0, currentText.length - 1);
      _textEditingController.selection =
          TextSelection.collapsed(offset: currentText.length - 1);
    }
  }

  Future<void> _onContinue() async {
    if (_textEditingController.text.isEmpty) {
      showSnackBar(context, S.of(context).pleaseEnterName);
    } else {
      await BlocProvider.of<SharedPrefCubit>(context)
          .setUsername(_textEditingController.text);
      widget.goToNextPage();
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translate = S.of(context);

    return Stack(
      children: [
        const OnboardingNameInputBackground(
          key: Key(
            "OnboardingNameInputBackground",
          ),
        ),
        OnboardingNameInputBorders(
          key: const Key(
            "OnboardingNameInputBorders",
          ),
          child: TextField(
            key: const Key(
              "OnboardingNameInputTextField",
            ),
            controller: _textEditingController,
            onChanged: _onEdit,
            decoration: InputDecoration.collapsed(
              hintStyle: ChatToPicTextStyles().getDefaultTextStyle(
                color: Colors.white,
                letterSpacing: DSNameInputConstants.letterSpacing,
              ),
              hintText: translate.username,
            ),
            style: ChatToPicTextStyles().getDefaultTextStyle(
              fontsize: fontSize14,
              color: Colors.white,
              letterSpacing: DSNameInputConstants.letterSpacing,
            ),
          ),
        ),
        const OnboardingNameInputNamesSquares(
          key: Key(
            "OnboardingNameInputNamesSquares",
          ),
        ),
        OnboardingNameInputButtonRow(
          key: const Key(
            "OnboardingNameInputButtonRow",
          ),
          onContinue: _onContinue,
          onErase: _deleteLastLetter,
        ),
      ],
    );
  }
}
