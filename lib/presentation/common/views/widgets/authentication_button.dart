import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/presentation/common/blocs/blocs.dart';

class AuthenticationButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final String text;
  final AuthenticationEvent event;

  const AuthenticationButton({
    super.key,
    required this.formKey,
    required this.text,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final isLoading = state is AuthenticationLoading;

        return FilledButton(
          onPressed: isLoading
              ? () {}
              : () {
                  formKey.currentState?.saveAndValidate();
                  context.read<AuthenticationBloc>().add(event);
                },
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: ColorPalette.foregroundLight,
                    strokeWidth: 2,
                  ),
                )
              : Text(text),
        );
      },
    );
  }
}
