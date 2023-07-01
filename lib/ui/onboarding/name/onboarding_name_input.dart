import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_colors.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_text_styles.dart';
import 'package:chattopic/ui/style/constants/ds_name_input_constants.dart';
import 'package:chattopic/ui/onboarding/name/onboarding_name_input_names_squares.dart';
import 'package:chattopic/ui/style/helper/show_snackbar.dart';
import 'package:chattopic/ui/style/painters/ds_modal_background_painter.dart';
import 'package:chattopic/ui/shared/ds_button.dart';
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
        Center(
          child: CustomPaint(
            painter: DSModalBackgroundPainter(),
            size: const Size(
              DSNameInputConstants.orangeWidth,
              DSNameInputConstants.orangeHeight,
            ),
          ),
        ),
        Center(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                horizontal: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: ChatToPicColors.dsModalOutlineColor,
                    ),
                    horizontal: BorderSide(
                      color: ChatToPicColors.dsModalOutlineColor,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    height: DSNameInputConstants.containerHeight,
                    width: DSNameInputConstants.innerContainerWidth,
                    child: Center(
                      child: TextField(
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
                  ),
                ),
              ),
            ),
          ),
        ),
        const OnboardingNameInputNamesSquares(),
        Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSButton(
                  title: translate.erase,
                  letter: "B",
                  callback: _deleteLastLetter,
                ),
                const SizedBox(
                  width: 40,
                ),
                DSButton(
                  title: translate.input,
                  letter: "A",
                  callback: _onContinue,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}
