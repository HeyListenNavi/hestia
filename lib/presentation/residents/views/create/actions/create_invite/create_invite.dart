import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/core/text_validators.dart';
import 'package:hestia/features/invitation_management/data/models.dart';
import 'package:hestia/features/invitation_management/domain/entities.dart';
import 'package:hestia/presentation/common/blocs/create_invitation/create_invitation_bloc.dart';
import 'package:hestia/presentation/common/views/widgets/big_icon_button.dart';
import 'package:hestia/presentation/common/views/widgets/form_date_time_field.dart';
import 'package:hestia/presentation/common/views/widgets/form_text_field.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

final _guestFormKey = GlobalKey<FormBuilderState>();
final _codeFormKey = GlobalKey<FormBuilderState>();

class CreateInvite extends StatelessWidget {
  const CreateInvite({super.key});

  static final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<CreateInvitationBloc, CreateInvitationState>(
      listener: (context, state) {
        if (state is CreateInvitationSuccess) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          minimum: EdgeInsets.only(
            bottom: bottomInset == 0 ? 56.0 : bottomInset + 22.0,
          ),
          child: ExpandablePageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: _guestForm(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: _invitationForm(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: switch (state) {
                  CreateInvitationSuccess(:final qrCode) =>
                    InvitationResult.success(invitationCode: qrCode),
                  CreateInvitationFailure(:final errorMessage) =>
                    InvitationResult.failed(message: errorMessage),
                  _ => InvitationResult.failed(message: 'Error'),
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Column _guestForm(BuildContext context) {
    return Column(
      spacing: 22.0,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          spacing: 12.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Detalles del invitado',
              style: TypographyStyles.textTheme.headlineLarge,
            ),
            Text(
              'Ingresa los datos de la persona invitada para completar la invitación',
              style: TypographyStyles.textTheme.bodySmall,
              textAlign: TextAlign.center,
            )
          ],
        ),
        FormBuilder(
          key: _guestFormKey,
          child: Column(
            spacing: 18.0,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormTextField(
                name: 'name',
                hintText: 'Ingresa el nombre(s) del invitado',
                customValidators: [InputFieldValidators.firstName],
              ),
              FormTextField(
                name: 'lastName',
                hintText: 'Ingresa los apellidos del invitado',
                customValidators: [InputFieldValidators.lastName],
              ),
              FormTextField(
                name: 'phone',
                hintText: 'Ingresa el número de teléfono del invitado',
                customValidators: [InputFieldValidators.phone],
              ),
              FormTextField(
                name: 'email',
                hintText: 'Ingresa el correo electrónico del invitado',
                customValidators: [InputFieldValidators.email],
              ),
              FilledButton(
                onPressed: () {
                  if (_guestFormKey.currentState?.saveAndValidate() == true) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Siguiente'),
                    Icon(
                      Boxicons.bx_right_arrow_alt,
                      size: 22.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _invitationForm(BuildContext context) {
    return Column(
      spacing: 22.0,
      children: [
        Column(
          spacing: 12.0,
          children: [
            Text(
              'Detalles de la invitación',
              style: TypographyStyles.textTheme.headlineLarge,
            ),
            Text(
              'Ingresa los datos para crear una invitación',
              style: TypographyStyles.textTheme.bodySmall,
              textAlign: TextAlign.center,
            )
          ],
        ),
        FormBuilder(
          key: _codeFormKey,
          child: Column(
            spacing: 18.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormTextField(
                name: 'title',
                hintText: 'Ingresa el titulo de la invitación',
              ),
              FormTextField(
                name: 'visitorsNumber',
                hintText: 'Ingresa la cantidad de invitados',
                customValidators: [InputFieldValidators.numeric],
              ),
              FormDateTimeField(
                name: 'entranceDateTime',
                hintText: 'Fecha y hora de entrada',
                inputType: InputType.both,
              ),
              FormTextField(
                name: 'reason',
                hintText: 'Ingresa la razón de la visita',
              ),
              FilledButton(
                onPressed: () {
                  if (_codeFormKey.currentState?.saveAndValidate() == true) {
                    final codeFormValues = _codeFormKey.currentState?.value;
                    final guestFormValues = _guestFormKey.currentState?.value;

                    context.read<CreateInvitationBloc>().add(
                          CreateInvitationSubmit(
                            InvitationModel(
                              code: Code(
                                title: codeFormValues?['title'],
                                visitorsNumber:
                                    codeFormValues?['visitorsNumber'],
                                entranceDateTime:
                                    codeFormValues?['entrandeDateTime']
                                            .toString() ??
                                        '',
                                description: codeFormValues?['reason'],
                              ),
                              guest: Guest(
                                name: guestFormValues?['name'],
                                lastName: guestFormValues?['lastName'],
                                phoneNumber: guestFormValues?['phone'],
                                email: guestFormValues?['email'],
                              ),
                            ),
                          ),
                        );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Crear Invitación'),
                    Icon(
                      Boxicons.bx_plus,
                      size: 22.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InvitationResult extends StatelessWidget {
  final String title;
  final String message;
  final bool success;
  final String? invitationCode;

  const InvitationResult.success({
    super.key,
    required this.invitationCode,
  })  : success = true,
        title = '¡Invitación generada correctamente!',
        message =
            'Comparte este código con tu invitado para facilitar su acceso';

  const InvitationResult.failed({
    super.key,
    required this.message,
  })  : success = false,
        title = 'No ha sido posible crear la invitación',
        invitationCode = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22.0,
      children: [
        Column(
          spacing: 10.0,
          children: [
            Text(
              title,
              style: TypographyStyles.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              message,
              style: TypographyStyles.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Container(
          child: success
              ? QrImageView(data: invitationCode!)
              : Icon(
                  Boxicons.bx_x_circle,
                  size: 140.0,
                  color: ColorPalette.error,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: success
              ? [
                  BigIconButton.secondary(
                    onPressed: () {},
                    text: 'Compartir',
                    icon: Boxicons.bx_share_alt,
                  ),
                  BigIconButton.secondary(
                    onPressed: () {},
                    text: 'Guardar',
                    icon: Boxicons.bxs_save,
                  )
                ]
              : [Text('Intenta nuevamente más tarde')],
        ),
      ],
    );
  }
}
