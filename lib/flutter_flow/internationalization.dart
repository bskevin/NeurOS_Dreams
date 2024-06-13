import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    't705or6k': {
      'en': 'Weekly Sleep Data',
      'es': 'Información Semanal ',
    },
    'm0qvtdn8': {
      'en': 'Weekly sleep ',
      'es': 'Sueño Semanal',
    },
    '418dzvu1': {
      'en': 'Average Weekly Data',
      'es': 'Datos Promedio Semanales',
    },
    '05dwjr56': {
      'en': 'Idk',
      'es': 'no se',
    },
    '25z8u8js': {
      'en': 'Average Time',
      'es': 'Tiempo Promedio',
    },
    'ihkykmzs': {
      'en': 'Sleep Style',
      'es': 'Estilo de Sueño',
    },
    'vkj1pawd': {
      'en': 'HOME ',
      'es': 'INICIO',
    },
    'tz50z5zp': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // LogIn
  {
    'mj7vxk5q': {
      'en': 'NeurOS Dreams',
      'es': 'NeurOS Dreams',
    },
    'h2yat4mj': {
      'en': 'Sign In',
      'es': 'Ingresar',
    },
    '1ubj1rvn': {
      'en': 'Let\'s get started by filling out the form below.',
      'es': 'Empecemos por completar el siguiente formulario',
    },
    'qhji4t9v': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    '5iitakg3': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'baw4dbyg': {
      'en': 'Sign In',
      'es': 'Ingresar',
    },
    'bux8ojcg': {
      'en': 'Forgot Password',
      'es': 'Olvidé la contraseña',
    },
    'ihu23fr2': {
      'en': 'Or sign up with',
      'es': 'O registrate con',
    },
    'x4tdp5ys': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
    },
    'ar3apah8': {
      'en': 'Continue with Apple',
      'es': 'Continuar con Apple',
    },
    'u00zhee0': {
      'en': 'Sign Up',
      'es': 'Registrate',
    },
    '2dxla0vy': {
      'en': 'Let\'s get started by filling out the form below.',
      'es': 'Empecemos por completar el siguiente formulario',
    },
    'dtj1vsft': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'pf0zsjmg': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'c71yjj61': {
      'en': 'Confirm Password',
      'es': 'Confirma la contraseña',
    },
    'uc0x3ifi': {
      'en': 'Create Account',
      'es': 'Crear cuenta',
    },
    '66dveu0z': {
      'en': 'Or sign up with',
      'es': 'O registrate con',
    },
    'wepkrelk': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
    },
    'jxmj5id7': {
      'en': 'Continue with Apple',
      'es': 'Continuar con Apple',
    },
    'cnw0zoa4': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // UpdateProfile
  {
    'oxl0oqxn': {
      'en': 'Name',
      'es': 'Nombre',
    },
    'hx5gaqh8': {
      'en': 'Add your name here',
      'es': 'Ingresa tu nombre aquí',
    },
    'yagt5o7z': {
      'en': 'Last name ',
      'es': 'Appelido(s)',
    },
    '6rujznzb': {
      'en': 'Add your last name',
      'es': 'Ingresa tu(s) apellido(s)',
    },
    'vlx71zzc': {
      'en': 'E-mail',
      'es': 'Correo electrónico',
    },
    'deq8732j': {
      'en': 'Age',
      'es': 'Edad',
    },
    '1m79g536': {
      'en': 'Add your age',
      'es': 'Ingresa tu edad',
    },
    'g43oupbq': {
      'en': 'Sex',
      'es': 'Sexo',
    },
    'g5bnit56': {
      'en': 'Male',
      'es': 'Hombre',
    },
    'ak6ive1u': {
      'en': 'Female',
      'es': 'Mujer',
    },
    'ibvk0v2c': {
      'en': 'Other',
      'es': 'Otro',
    },
    'tadyvc93': {
      'en': 'Please select ',
      'es': 'Selecciona uno',
    },
    '2cj3s6g6': {
      'en': 'Search for an item...',
      'es': 'Buscar un item...',
    },
    'x4h7vfqp': {
      'en': 'Height',
      'es': 'Altura',
    },
    'iotq2h7u': {
      'en': 'Add your height',
      'es': 'Ingresa tu altura',
    },
    'jys8uzf6': {
      'en': 'Weight',
      'es': 'Peso',
    },
    '72sky4sx': {
      'en': 'Add your weight',
      'es': 'Ingresa tu peso',
    },
    'y5buxw7m': {
      'en': 'Update',
      'es': 'Acutalizar',
    },
    'w15bhbxh': {
      'en': 'Update Profile Data',
      'es': 'Actualizar Información de Perfil',
    },
    'yw4fpw82': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // SleepData
  {
    'zp487hjz': {
      'en': 'Select date',
      'es': 'Selecciona la fecha',
    },
    'cmky5arf': {
      'en': 'Select your sleep schedule',
      'es': 'Selecciona tu horario de sueño',
    },
    'qfrz0iv6': {
      'en': 'Beginning',
      'es': 'Inicio',
    },
    'p3whqt5r': {
      'en': 'End',
      'es': 'Fin',
    },
    'ass03lie': {
      'en': 'How well did you sleep?',
      'es': '¿Qué tan bien dormiste?',
    },
    'y9oh1ae9': {
      'en': 'How would you say you rested?',
      'es': '¿Cómo dirías que descansate?',
    },
    'ep2ustln': {
      'en': 'Lightly',
      'es': 'Ligero',
    },
    'et41k1zv': {
      'en': 'Deeply',
      'es': 'Profundo',
    },
    'auxakyjl': {
      'en': 'Submit',
      'es': '',
    },
    'exk2qrja': {
      'en': 'Sleep Data',
      'es': 'Información de Sueño',
    },
    'c8o3ijri': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // Settings
  {
    'ibvfqtp7': {
      'en': 'User\'s Name',
      'es': 'Nombre del Usuario',
    },
    '2w3sm59l': {
      'en': 'Personal Information',
      'es': 'Información Personal',
    },
    '74qotk6c': {
      'en': 'Account',
      'es': 'Cuenta',
    },
    'sea0fwuq': {
      'en': 'Log out',
      'es': 'Cerrar sesión',
    },
    'yxynduek': {
      'en': 'Button',
      'es': 'Botón',
    },
    'kr1qhqw2': {
      'en': 'Settings',
      'es': 'Configuración',
    },
    'qcx8nox6': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // Profile
  {
    'ptathqyi': {
      'en': 'E-mail:',
      'es': 'Correo electrónico',
    },
    'uol08gyv': {
      'en': 'Age:',
      'es': 'Edad',
    },
    'ok0nux1b': {
      'en': 'Sex',
      'es': 'Sexo',
    },
    'omon5lk5': {
      'en': 'Height:',
      'es': 'Altura',
    },
    'gcjskjug': {
      'en': 'Weight:',
      'es': 'Peso',
    },
    'ued6hlv8': {
      'en': 'Edit Data',
      'es': 'Editar info',
    },
    'ilhj6bdn': {
      'en': 'Profile',
      'es': 'Perfil',
    },
    '0bzwv749': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // Miscellaneous
  {
    '23e7wdst': {
      'en': '',
      'es': '',
    },
    'm8b82wv4': {
      'en': '',
      'es': '',
    },
    'j2p61fq6': {
      'en': '',
      'es': '',
    },
    'pc3d7hh3': {
      'en': '',
      'es': '',
    },
    'xqud2usp': {
      'en': '',
      'es': '',
    },
    'f20l2o58': {
      'en': '',
      'es': '',
    },
    'merk52v2': {
      'en': '',
      'es': '',
    },
    'n5ygp986': {
      'en': '',
      'es': '',
    },
    'gca6hbi0': {
      'en': '',
      'es': '',
    },
    'cgmbfy1w': {
      'en': '',
      'es': '',
    },
    '2jazkv1a': {
      'en': '',
      'es': '',
    },
    'kttcznqp': {
      'en': '',
      'es': '',
    },
    '6r2ajgei': {
      'en': '',
      'es': '',
    },
    'dsb9eddr': {
      'en': '',
      'es': '',
    },
    '4cwzi2w2': {
      'en': '',
      'es': '',
    },
    '1yblwhfq': {
      'en': '',
      'es': '',
    },
    'kh78yqy1': {
      'en': '',
      'es': '',
    },
    '1kwz20a0': {
      'en': '',
      'es': '',
    },
    'cagyiec5': {
      'en': '',
      'es': '',
    },
    'u62nhnnp': {
      'en': '',
      'es': '',
    },
    'qxutu161': {
      'en': '',
      'es': '',
    },
    'em1s03e5': {
      'en': '',
      'es': '',
    },
    'xnf5el06': {
      'en': '',
      'es': '',
    },
    'pwhvji5z': {
      'en': '',
      'es': '',
    },
    'qatk98ej': {
      'en': '',
      'es': '',
    },
    'k7468hgl': {
      'en': '',
      'es': '',
    },
    '7ur8ijoh': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
