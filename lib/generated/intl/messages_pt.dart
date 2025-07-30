// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  static String m0(versionNumber) => "Versão ${versionNumber}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Sobre"),
        "aboutAppText": MessageLookupByLibrary.simpleMessage(
            "Este aplicativo foi desenvolvido para ajudar músicos a organizar seus estudos, registrar o progresso e dominar suas músicas favoritas."),
        "appLema": MessageLookupByLibrary.simpleMessage(
            "Pratique hoje, evolua sempre!"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Guitar Learner"),
        "dev": MessageLookupByLibrary.simpleMessage("Desenvolvedor"),
        "editSong": MessageLookupByLibrary.simpleMessage("Editar Música"),
        "menu": MessageLookupByLibrary.simpleMessage("Menu"),
        "modoEscuro": MessageLookupByLibrary.simpleMessage("Modo Escuro"),
        "newSong": MessageLookupByLibrary.simpleMessage("Nova Música"),
        "settings": MessageLookupByLibrary.simpleMessage("Configurações"),
        "step": MessageLookupByLibrary.simpleMessage("Passo"),
        "step1Desc": MessageLookupByLibrary.simpleMessage(
            "Para começar, preencha as informações principais para identificar a música. O título é essencial para que você possa encontrá-la depois."),
        "step1Title": MessageLookupByLibrary.simpleMessage("Dados da Música"),
        "step2Desc": MessageLookupByLibrary.simpleMessage(
            "Nesta etapa, você define a estrutura da música. Crie as diferentes seções e preencha o ritmo e a progressão de acordes correspondentes. Você pode adicionar quantas partes precisar."),
        "step2Title": MessageLookupByLibrary.simpleMessage("Partes da Música"),
        "version": m0
      };
}
