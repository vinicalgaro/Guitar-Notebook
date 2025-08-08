import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:guitar_notebook/extensions/color_extension.dart';
import 'package:guitar_notebook/theme/app_theme.dart';
import 'package:guitar_notebook/widgets/banner/default_banner.dart';

void _displayToast(String titulo, String descricao, _ToastUteis tipoToast,
    ToastDuration toastDuration,
    {Function? saberMaisOnClick}) {
  GestureTapCallback? cancel;
  cancel = BotToast.showCustomText(
    duration: Duration(seconds: toastDuration.getDuration()),
    onlyOne: true,
    align: Alignment.bottomCenter,
    toastBuilder: (_) => GestureDetector(
      onTap: () => cancel!(), //Ao clicar sobre o toast, ele é dispensado
      child: Container(
          margin: const EdgeInsets.only(bottom: 22),
          child: DefaultBanner(
            titulo: titulo,
            descricao: descricao,
            tituloColor: tipoToast._toastFontColor,
            descricaoColor: tipoToast._toastFontColor,
            icon: tipoToast.getToastIcon(),
            mainColor: tipoToast.getToastColor(),
            backgroundColor: tipoToast.getToastBackgroundColor(),
            useAnimatedIcon: true,
            saberMaisOnClick: saberMaisOnClick,
          )),
    ),
  );
}

///Exibe um toast de Sucesso no contexto atual
void displaySuccessToast(String titulo, String descricao,
    [ToastDuration toastDuration = ToastDuration.toastShort,
    Function? saberMaisOnClick]) {
  _displayToast(titulo, descricao, _ToastUteis.toastSucess, toastDuration,
      saberMaisOnClick: saberMaisOnClick);
}

///Exibe um toast de Erro no contexto atual
void displayErrorToast(String titulo, String descricao,
    [ToastDuration toastDuration = ToastDuration.toastShort,
    Function? saberMaisOnClick]) {
  _displayToast(titulo, descricao, _ToastUteis.toastError, toastDuration,
      saberMaisOnClick: saberMaisOnClick);
}

///Exibe um toast de Informação no contexto atual
void displayInfoToast(String titulo, String descricao,
    [ToastDuration toastDuration = ToastDuration.toastShort,
    Function? saberMaisOnClick]) {
  _displayToast(titulo, descricao, _ToastUteis.toastInfo, toastDuration,
      saberMaisOnClick: saberMaisOnClick);
}

///Exibe um toast de Aviso no contexto atual
void displayWarningToast(String titulo, String descricao,
    [ToastDuration toastDuration = ToastDuration.toastShort,
    Function? saberMaisOnClick]) {
  _displayToast(titulo, descricao, _ToastUteis.toastWarning, toastDuration,
      saberMaisOnClick: saberMaisOnClick);
}

///Enum para controle do toast
enum _ToastUteis {
  toastSucess(
      toastMainColor: AppTheme.paletaGreen, toastIcon: Icons.check_circle),
  toastError(toastMainColor: AppTheme.paletaBrightRed, toastIcon: Icons.error),
  toastInfo(
      toastMainColor: AppTheme.paletaLightBlue, toastIcon: Icons.info_outlined),
  toastWarning(
      toastMainColor: AppTheme.paletaAmbar, toastIcon: Icons.warning_amber);

  /// Cor principal
  final Color _toastMainColor;

  /// Cor da fonte
  final Color _toastFontColor;

  /// Ícone
  final IconData _toastIcon;

  const _ToastUteis(
      {required Color toastMainColor,
      required IconData toastIcon,
      Color toastFontColor = Colors.black})
      : _toastIcon = toastIcon,
        _toastFontColor = toastFontColor,
        _toastMainColor = toastMainColor;

  IconData getToastIcon() => _toastIcon;

  Color getToastColor() => _toastMainColor;

  Color getToastBackgroundColor() => _toastMainColor.lighten();

  Color getToastFontColor() => _toastFontColor;
}

///Enum para controle do tempo de duração do toast
enum ToastDuration {
  toastSuperShort(duration: 3),
  toastShort(duration: 4),
  toastLong(duration: 6),
  toastSuperLong(duration: 14);

  /// Duração em segundos
  final int _duration;

  const ToastDuration({required int duration}) : _duration = duration;

  int getDuration() => _duration;
}
