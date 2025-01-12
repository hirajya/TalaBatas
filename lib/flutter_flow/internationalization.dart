import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tl'];

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
    String? tlText = '',
  }) =>
      [enText, tlText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ArticleView
  {
    'iq7i052f': {
      'en': 'Featured',
      'tl': '',
    },
    '54hatj8r': {
      'en': 'Religion',
      'tl': '',
    },
    'r1epspuq': {
      'en': 'Health & Sanitation',
      'tl': '',
    },
    'haewlv89': {
      'en': 'Gender Equity',
      'tl': '',
    },
    'm5zg3n6h': {
      'en': 'RESOLUTION \nNo. 646 S2024',
      'tl': '',
    },
    'y0hsgzxp': {
      'en':
          'RESOLUTION GRANTING \nACCREDITATION IN FAVOR OF\n UNIFIED MUSLIM CHRISTIAN \nALLIANCE OF THE PHILIPPINES \nCORP., AS PEOPLE\'S ORGANIZATION',
      'tl': '',
    },
    '5qyto82l': {
      'en': 'Religion',
      'tl': '',
    },
    'd49nx0mo': {
      'en': 'Approved',
      'tl': '',
    },
    'z8jn21ml': {
      'en': 'Hon. Ricardo “Boy” A. Isip, Jr.',
      'tl': '',
    },
    'f0lt3uxy': {
      'en': 'January 2, 2020',
      'tl': '',
    },
    'etp66jtm': {
      'en': 'D.O. No. 8735',
      'tl': '',
    },
    'fqkzm8fw': {
      'en':
          'AN ORDINANCE PROVIDING FOR \nMANDATORY PET CANIINE \nANIMAL CARE AND WELFARE \nSYSTEM, REQUIRING BARANGAY \nPET ANIMAL REGISTRATION AND \nMICROCHIP IMPLANT SYSTEM WITH \nANTI-RABIES VACCINATION IN THE \nCITY OF MANILA, AND FOR OTHER \nPURPOSES, AS PER BASIC PAPERS.',
      'tl': '',
    },
    'rx1mbsvc': {
      'en': 'Religion',
      'tl': '',
    },
    'hm9xvl90': {
      'en': 'Approved',
      'tl': '',
    },
    'cin241je': {
      'en': 'Hon. Ricardo “Boy” A. Isip, Jr.',
      'tl': '',
    },
    'a2id8i8h': {
      'en': 'January 2, 2020',
      'tl': '',
    },
    '87y7a0kp': {
      'en': 'ORDINANCE No. 8933',
      'tl': '',
    },
    '3ctj0kq8': {
      'en':
          'AN ORDINANCE ESTABLISHING A \nWOMEN AND CHILDREN CRISIS \nCENTER FOR THE VICTIMS/SURVIVORS \nOF VIOLENCE AND ABUSE IN THE CITY \nOF MANILA, ADOPTING A \nCOMPREHENSIVE PROGRAM \nTHEREFOR, AND FOR OTHER PURPOSES.',
      'tl': '',
    },
    'uyjzcdp4': {
      'en': 'Religion',
      'tl': '',
    },
    '5udm9boh': {
      'en': 'Approved',
      'tl': '',
    },
    'dhkxe74i': {
      'en': 'Hon. Ricardo “Boy” A. Isip, Jr.',
      'tl': '',
    },
    'rmn8bzc5': {
      'en': 'January 2, 2020',
      'tl': '',
    },
    'nmiiuv1c': {
      'en': 'RESOLUTION \nNo. 646 S2024',
      'tl': '',
    },
    'thg1ts4p': {
      'en':
          'RESOLUTION GRANTING \nACCREDITATION IN FAVOR OF\n UNIFIED MUSLIM CHRISTIAN \nALLIANCE OF THE PHILIPPINES \nCORP., AS PEOPLE\'S ORGANIZATION',
      'tl': '',
    },
    '08gvaomq': {
      'en': 'Religion',
      'tl': '',
    },
    'nbxbg51z': {
      'en': 'Approved',
      'tl': '',
    },
    'xysrf4bs': {
      'en': 'Hon. Ricardo “Boy” A. Isip, Jr.',
      'tl': '',
    },
    'nuidajsj': {
      'en': 'January 2, 2020',
      'tl': '',
    },
    '931ttjf1': {
      'en': 'Resolution',
      'tl': '',
    },
    'vwqdmyua': {
      'en': 'Religion',
      'tl': '',
    },
    'cxqgjkwm': {
      'en': 'Health & Sanitation',
      'tl': '',
    },
    'ucnemqvz': {
      'en': 'Gender Equity',
      'tl': '',
    },
    '7vsmnuuf': {
      'en': 'RESOLUTION \nNo. 646 S2024',
      'tl': '',
    },
    'zjxqsy3j': {
      'en':
          'RESOLUTION GRANTING \nACCREDITATION IN FAVOR OF\n UNIFIED MUSLIM CHRISTIAN \nALLIANCE OF THE PHILIPPINES \nCORP., AS PEOPLE\'S ORGANIZATION',
      'tl': '',
    },
    'u4kcpep7': {
      'en': 'Religion',
      'tl': '',
    },
    'hbx4h23k': {
      'en': 'Approved',
      'tl': '',
    },
    '4qet3pz2': {
      'en': 'Hon. Ricardo “Boy” A. Isip, Jr.',
      'tl': '',
    },
    'tcq6df43': {
      'en': 'January 2, 2020',
      'tl': '',
    },
    '5934jueg': {
      'en': 'RESOLUTION \nNo. 646 S2024',
      'tl': '',
    },
    'qqi8m9vw': {
      'en':
          'RESOLUTION GRANTING \nACCREDITATION IN FAVOR OF\n UNIFIED MUSLIM CHRISTIAN \nALLIANCE OF THE PHILIPPINES \nCORP., AS PEOPLE\'S ORGANIZATION',
      'tl': '',
    },
    '3t6eaq1e': {
      'en': 'Religion',
      'tl': '',
    },
    '17wthenb': {
      'en': 'Approved',
      'tl': '',
    },
    'ruzbju6f': {
      'en': 'Hon. Ricardo “Boy” A. Isip, Jr.',
      'tl': '',
    },
    '3zniqrgt': {
      'en': 'January 2, 2020',
      'tl': '',
    },
    'rlzfscz6': {
      'en': 'Ordinance',
      'tl': '',
    },
    't66f32l1': {
      'en': 'Religion',
      'tl': '',
    },
    'wgb3rikg': {
      'en': 'Health & Sanitation',
      'tl': '',
    },
    'kmhp34dd': {
      'en': 'Gender Equity',
      'tl': '',
    },
    '4cybfca8': {
      'en': 'D.O. No. 8735',
      'tl': '',
    },
    'rdlqozfk': {
      'en':
          'AN ORDINANCE PROVIDING FOR \nMANDATORY PET CANIINE \nANIMAL CARE AND WELFARE \nSYSTEM, REQUIRING BARANGAY \nPET ANIMAL REGISTRATION AND \nMICROCHIP IMPLANT SYSTEM WITH \nANTI-RABIES VACCINATION IN THE \nCITY OF MANILA, AND FOR OTHER \nPURPOSES, AS PER BASIC PAPERS.',
      'tl': '',
    },
    'cuzg07vn': {
      'en': 'Religion',
      'tl': '',
    },
    'qbl9youw': {
      'en': 'Approved',
      'tl': '',
    },
    'q4xiv3xo': {
      'en': 'Hon. Ricardo “Boy” A. Isip, Jr.',
      'tl': '',
    },
    'orb0bvu5': {
      'en': 'January 2, 2020',
      'tl': '',
    },
    '1cwyenxz': {
      'en': 'ORDINANCE No. 8933',
      'tl': '',
    },
    'q3i729pr': {
      'en':
          'AN ORDINANCE ESTABLISHING A \nWOMEN AND CHILDREN CRISIS \nCENTER FOR THE VICTIMS/SURVIVORS \nOF VIOLENCE AND ABUSE IN THE CITY \nOF MANILA, ADOPTING A \nCOMPREHENSIVE PROGRAM \nTHEREFOR, AND FOR OTHER PURPOSES.',
      'tl': '',
    },
    'ymbnlqv3': {
      'en': 'Religion',
      'tl': '',
    },
    'uehrr702': {
      'en': 'Approved',
      'tl': '',
    },
    'eowv4p8f': {
      'en': 'Hon. Ricardo “Boy” A. Isip, Jr.',
      'tl': '',
    },
    'of9szr47': {
      'en': 'January 2, 2020',
      'tl': '',
    },
    'azbwz34n': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // Chatbot
  {
    'rtya7582': {
      'en': 'Message Lex...',
      'tl': 'Message Legie...',
    },
    't7t6n26g': {
      'en': 'Lex',
      'tl': 'Legie',
    },
    'pqi5tsm8': {
      'en': 'Hi Juan',
      'tl': 'Hi Juan',
    },
    'nq3jsi1e': {
      'en': 'How can I help you with?',
      'tl': 'Paano kita matutulungan?',
    },
  },
  // Quest
  {
    '79marf9i': {
      'en': 'Daily Quests',
      'tl': '',
    },
    'd1hfw2hn': {
      'en': 'Complete tasks to earn coins!',
      'tl': '',
    },
    'uqvzk5ol': {
      'en': '2,450',
      'tl': '',
    },
    'fgwob6hu': {
      'en': 'Daily Login',
      'tl': '',
    },
    'bu4tzzmq': {
      'en': 'Log in for 7 consecutive days',
      'tl': '',
    },
    'q5ta1njd': {
      'en': '50',
      'tl': '',
    },
    'c706r25n': {
      'en': '5/7 days completed',
      'tl': '',
    },
    'or3nhaqg': {
      'en': 'Complete Workout',
      'tl': '',
    },
    'urvvagn6': {
      'en': 'Read a health legislation',
      'tl': '',
    },
    '62rzbbr5': {
      'en': '100',
      'tl': '',
    },
    'bw4gmm3l': {
      'en': 'Start Reading',
      'tl': '',
    },
    '5u73k312': {
      'en': 'Share Progress',
      'tl': '',
    },
    'njr0lyk0': {
      'en': 'Read 3 documents',
      'tl': '',
    },
    '8xtck492': {
      'en': '75',
      'tl': '',
    },
    '8sjmekf2': {
      'en': 'Start Reading',
      'tl': '',
    },
    't1j49cpj': {
      'en': 'Weekly Challenge',
      'tl': '',
    },
    'cgx3bl71': {
      'en': 'Comment on 5 legislations',
      'tl': '',
    },
    '3bl922i8': {
      'en': '200',
      'tl': '',
    },
    'fsgtppg4': {
      'en': '3/5 comments completed',
      'tl': '',
    },
    'k1a1mztq': {
      'en': 'Invite Friends',
      'tl': '',
    },
    '13beiyjx': {
      'en': 'Invite friends to join the app',
      'tl': '',
    },
    'oo7zqpau': {
      'en': '150',
      'tl': '',
    },
    '6qwofcdr': {
      'en': 'Invite Friends',
      'tl': '',
    },
  },
  // Coin
  {
    'ceq31o85': {
      'en': 'My Coins',
      'tl': '',
    },
    '8y9dzeo4': {
      'en': 'Convert your coins to rewards!',
      'tl': '',
    },
    'xlhvvu4a': {
      'en': '2,450',
      'tl': '',
    },
    '85jrxueo': {
      'en': 'Total Coins Available',
      'tl': '',
    },
    'oqsl2eb5': {
      'en': 'Convert Your Coins',
      'tl': '',
    },
    'lxauta4t': {
      'en': 'Globe Data Deal',
      'tl': '',
    },
    'p3e1vvj0': {
      'en': '1GB = 500 coins',
      'tl': '',
    },
    'qbivdzoz': {
      'en': 'Convert Now',
      'tl': '',
    },
    'fheorfqe': {
      'en': 'SM Hypermarket Exclusive',
      'tl': '',
    },
    'eksfyl1k': {
      'en': '₱100 Discount = 1000 coins',
      'tl': '',
    },
    '9sqa9b7r': {
      'en': 'Convert Now',
      'tl': '',
    },
    '4l1bwqet': {
      'en': 'Lazada Specials',
      'tl': '',
    },
    '9yetfhbh': {
      'en': '₱500 Discount = 5000 coins',
      'tl': '',
    },
    '4g1q52qr': {
      'en': 'Convert Now',
      'tl': '',
    },
    '0n5p9abn': {
      'en': 'Charity/NGO Donation',
      'tl': '',
    },
    'efwfwjo0': {
      'en': '₱1000 = 10000 coins',
      'tl': '',
    },
    'a6rw1tud': {
      'en': 'Convert Now',
      'tl': '',
    },
  },
  // Module
  {
    'z1vezjd6': {
      'en': 'Learning Modules',
      'tl': '',
    },
    'ai8plli7': {
      'en':
          'Understand the legislative process through \ninstructional content and test your knowledge to \nearn rewards!',
      'tl': '',
    },
    'xcqe5yi8': {
      'en': 'Introduction to Local Governance',
      'tl': '',
    },
    'c7mg6t3a': {
      'en':
          'Overview of how local government units (LGUs) are structured, their powers, and the roles of elected officials.',
      'tl': '',
    },
    'fvvt9sw6': {
      'en': '5 mins read',
      'tl': '',
    },
    'ybtfe0tk': {
      'en': 'Municipal Government Structure',
      'tl': '',
    },
    '80iuxfvk': {
      'en':
          'Detailed breakdown of the roles and functions of the municipal mayor, vice mayor, and the municipal council.',
      'tl': '',
    },
    'xhx8q9sc': {
      'en': '10 mins read',
      'tl': '',
    },
    'bg0fcg8g': {
      'en': 'Legislative Process at the \nMunicipal Level',
      'tl': '',
    },
    'pcvsa1m7': {
      'en':
          'Overview of how local government units (LGUs) are structured, their powers, and the roles of elected officials.',
      'tl': '',
    },
    'dpzki10j': {
      'en': '8 mins read',
      'tl': '',
    },
  },
  // ModuleView
  {
    '8hhygnvr': {
      'en': 'Introduction to Local \nGovernance',
      'tl': '',
    },
    '1nfhf7hl': {
      'en':
          'Overview of how local government units (LGUs) are \nstructured, their powers, and the roles of\nelected officials.',
      'tl': '',
    },
    'd9mdkgcc': {
      'en': 'What is Local Governance?',
      'tl': '',
    },
    'jdry4luw': {
      'en':
          'Local governance in the Philippines refers to the system through which local government units (LGUs)—such as provinces, cities, municipalities, and barangays—exercise their powers to serve their constituents. The foundation of local governance is enshrined in the Local Government Code of 1991 (Republic Act No. 7160), which decentralizes powers from the national government to local authorities, allowing them to address issues specific to their communities more effectively.',
      'tl': '',
    },
    'da65dnhz': {
      'en': 'Key Components:',
      'tl': '',
    },
    'lzkyuv8a': {
      'en': 'Decentralization of power',
      'tl': '',
    },
    'qs9lwhua': {
      'en': 'Local autonomy',
      'tl': '',
    },
    '48d6p97n': {
      'en': 'Participatory governance',
      'tl': '',
    },
    '6kcgwaxu': {
      'en': 'Transparency and accountability',
      'tl': '',
    },
    'zg9sj3hd': {
      'en':
          'Local governance ensures that services are tailored to the unique needs of communities. The Local Government Code empowers LGUs to collect taxes, create programs, and make decisions that benefit their residents.\n\nUnderstanding the structure and functions of local government is essential to being an informed citizen who can actively participate in governance',
      'tl': '',
    },
    'wxql64ge': {
      'en': 'Knowledge Check',
      'tl': '',
    },
    'n2n15mv5': {
      'en':
          'What is the primary law that decentralizes powers from the national government to local government units (LGUs) in the Philippines?',
      'tl': '',
    },
    '95492d4v': {
      'en': 'A) Local Government Code of \n    1991 (Republic Act No. 7160)',
      'tl': '',
    },
    'wpod6uya': {
      'en': 'B) Constitution of the Philippines',
      'tl': '',
    },
    'le07oi61': {
      'en': 'C) International policy making',
      'tl': '',
    },
    '0gd5newd': {
      'en': 'D) Municipal Development Act',
      'tl': '',
    },
    '4txzsr97': {
      'en': 'Submit Answer',
      'tl': '',
    },
    'qniluwt5': {
      'en': 'Page Title',
      'tl': '',
    },
  },
  // Profile
  {
    'd8owg18a': {
      'en': 'Hon. Ricardo A. Isip, Jr.',
      'tl': '',
    },
    'ye8zmqi4': {
      'en': '11th City Council | 3rd District of Manila',
      'tl': '',
    },
    '90ee5gz8': {
      'en': 'About',
      'tl': '',
    },
    'd3m2b8pf': {
      'en':
          'A dedicated public servant with over 20 years of experience in public service. Focused on education reform, healthcare accessibility, and economic development for marginalized communities.',
      'tl': '',
    },
    'f9w5zxaz': {
      'en': 'Manila City',
      'tl': '',
    },
    'y7wphb8q': {
      'en': 'Legislative Performance',
      'tl': '',
    },
    'zmkjc3bz': {
      'en': 'Bills \nAuthored',
      'tl': '',
    },
    '6emycz7h': {
      'en': '47',
      'tl': '',
    },
    '6hspvdnd': {
      'en': 'Bills \nCo-Authored',
      'tl': '',
    },
    '3ctevr0q': {
      'en': '156',
      'tl': '',
    },
    'khrjlzvz': {
      'en': 'Committee \nMembership',
      'tl': '',
    },
    'kolrtzyl': {
      'en': '5',
      'tl': '',
    },
    '6uilfir4': {
      'en': 'Recent Bill Positions',
      'tl': '',
    },
    'razu9wz3': {
      'en': 'Universal Healthcare Act',
      'tl': '',
    },
    '7rh5a2r2': {
      'en': 'Senate Bill No. 1896',
      'tl': '',
    },
    'p8a9xnpj': {
      'en': 'PRO',
      'tl': '',
    },
    '356wyini': {
      'en': 'Death Penalty Bill',
      'tl': '',
    },
    'vsc1urwe': {
      'en': 'Senate Bill No. 2456',
      'tl': '',
    },
    'mj0lvd6r': {
      'en': 'AGAINST',
      'tl': '',
    },
    '5f8xfj2d': {
      'en': 'Anti-Political Dynasty Bill',
      'tl': '',
    },
    'jqwe5jgh': {
      'en': 'Senate Bill No. 1823',
      'tl': '',
    },
    'gwcbxem9': {
      'en': 'ABSTAIN',
      'tl': '',
    },
    'mktb58fn': {
      'en': 'Committee Memberships',
      'tl': '',
    },
    'i616jt4z': {
      'en': 'Education',
      'tl': '',
    },
    'hqpkhfao': {
      'en': 'Health',
      'tl': '',
    },
    '9cfb2wtp': {
      'en': 'Finance',
      'tl': '',
    },
    '3jlyi88f': {
      'en': 'Social Justice',
      'tl': '',
    },
    'imy18h17': {
      'en': 'Women\'s Rights',
      'tl': '',
    },
  },
  // ViewArticle
  {
    'rj5wkbql': {
      'en': 'Approved',
      'tl': 'Naaprubahan',
    },
    '67fkqkog': {
      'en': 'RESOLUTION NO. 646 S2024',
      'tl': 'RESOLUSYON Blg. 646 S2024',
    },
    'evrtikpu': {
      'en': 'Religion',
      'tl': 'Relihiyon',
    },
    '8plq7now': {
      'en': 'Approved',
      'tl': 'Naaprubahan',
    },
    'hl89xyl5': {
      'en': 'Principal Author/s',
      'tl': 'Principal Author/s',
    },
    'ge8kutdm': {
      'en': 'Date',
      'tl': 'Petsa',
    },
    'ns2kwnkb': {
      'en': 'Hon. Ricardo “Boy” \nA. Isip, Jr.',
      'tl': 'Sinabi ni Hon. Ricardo \"Boy\" \nA. Isip, Jr.',
    },
    '1l7ay5a8': {
      'en': 'November 19, 2024\n',
      'tl': 'Nobyembre 19, 2024',
    },
    'vvev36es': {
      'en': 'Co-author/s',
      'tl': 'Co-author/s',
    },
    'x5ekvc67': {
      'en':
          'Hon. Benny Fog T. Abante III , Hon. Irma C. \nAlfonso-Juson , Hon. Arlene “Maile” I. Atienza, \nHon. Krystle Marie “Krys” Bacani , Hon. Don \nJuan “DJ” Bagatsing , Hon. Laris T. Borromeo, \nHon. Ruben “Dr. J” F. Buenaventura , \nHon. Carlos “Caloy” Castañeda , Hon. Louisito \n“Doc Louie” Chua, Hon. Niño M. Dela Cruz,\nHon. Pamela “Fa” Fugoso , Hon. Martin \n“Marjun” V.I. Isidro, Jr. , Hon. Rodolfo “Ninong \nRod” N. Lacsamana , Hon. Numero “Uno” G. \nLim, Hon. Erick Ian “Ian Banzai” O. Nieva , \nHon. Charry R. Ortega , Hon. Elmer “Joel” M. \nPar , Hon. Louisa Marie “Lady” J. Quintos-Tan',
      'tl':
          'Sinabi ni Hon. Benny Fog T. Abante III , Hon. Irma C. \nAlfonso-Juson , Hon. Arlene “Maile” I. Atienza, \nSinabi ni Hon. Krystle Marie “Krys” Bacani , Hon. Don \nJuan “DJ” Bagatsing , Hon. Laris T. Borromeo, \nSinabi ni Hon. Ruben “Dr. J” F. Buenaventura , \nSinabi ni Hon. Carlos “Caloy” Castañeda , Hon. Louisito \n“Doc Louie” Chua, Hon. Niño M. Dela Cruz,\nSinabi ni Hon. Pamela “Fa” Fugoso , Hon. Martin \n\"Marjun\" V.I. Isidro, Jr., Hon. Rodolfo “Ninong \nRod” N. Lacsamana , Hon. Numero \"Uno\" G. \nLim, Hon. Erick Ian “Ian Banzai” O. Nieva , \nSinabi ni Hon. Charry R. Ortega , Hon. Elmer “Joel” M. \nPar , Hon. Louisa Marie “Lady” J. Quintos-Tan',
    },
    'wbthi65g': {
      'en': 'Title',
      'tl': 'Pamagat',
    },
    'frwdxq5z': {
      'en':
          'RESOLUTION GRANTING ACCREDITATION IN \nFAVOR OF UNIFIED MUSLIM CHRISTIAN\nALLIANCE OF THE PHILIPPINES CORP., AS \nPEOPLE\'S ORGANIZATION',
      'tl':
          'RESOLUTION GRANTING ACCREDITATION IN \nPABOR NG UNIFIED MUSLIM CHRISTIAN\nALLIANCE OF THE PHILIPPINES CORP., AS \nSAMAHAN NG BAYAN',
    },
    'yuasiqyb': {
      'en': 'Comments',
      'tl': 'Mga komento',
    },
    'ss1oax55': {
      'en': 'Michael Chen',
      'tl': 'Michael Chen',
    },
    '3g6nb4r0': {
      'en': '2 hours ago',
      'tl': '2 oras ang nakalipas',
    },
    'aias95x3': {
      'en':
          'Great article! The discussion on how local governments can foster sustainable development is very thought-provoking.',
      'tl':
          'Mahusay na artikulo! Ang mga punto tungkol sa mga etikal na pagsasaalang-alang sa pagbuo ng AI ay partikular na nauugnay.',
    },
    '8jkwlgy6': {
      'en': 'Rico Blanco    ',
      'tl': 'Rico Blanco',
    },
    '3z8qzrv1': {
      'en': '5 hours ago',
      'tl': '5 oras ang nakalipas',
    },
    'pbf60xci': {
      'en':
          'Well-written piece! The emphasis on the importance of local government in disaster preparedness is both timely and relevant.',
      'tl':
          'Gusto kong makakita ng higit pang talakayan tungkol sa potensyal na epekto ng AI sa mga job market at kung paano tayo makapaghahanda para sa mga pagbabagong ito.',
    },
    'qgj5uy8k': {
      'en': 'David Cruz ',
      'tl': 'David Cruz',
    },
    'e4iqauxr': {
      'en': '1 day ago',
      'tl': '1 araw ang nakalipas',
    },
    '2nq6vjgj': {
      'en':
          'Insightful article! The exploration of local government initiatives to improve public services really highlights their impact on communities.',
      'tl':
          'Ang bilis ng pagsulong ng AI ay talagang kapansin-pansin. Inaasahan na makita kung paano nagbabago ang mga teknolohiyang ito sa mga darating na taon.',
    },
    '5hatipaw': {
      'en': 'Add a comment',
      'tl': 'Magdagdag ng komento',
    },
    'jqyt40ls': {
      'en': 'Write your thoughts...',
      'tl': 'Isulat ang iyong mga saloobin...',
    },
    'u9010uya': {
      'en': 'Post Comment',
      'tl': 'Mag-post ng Komento',
    },
    'slctelqo': {
      'en': 'How do you feel about this?',
      'tl': '',
    },
    'q7jiug8e': {
      'en': 'Happy',
      'tl': '',
    },
    '8x9132jk': {
      'en': 'Neutral',
      'tl': '',
    },
    'p91o5lk5': {
      'en': 'Sad',
      'tl': '',
    },
    'oowpzep3': {
      'en': 'Shocked',
      'tl': '',
    },
    'vtt2iahj': {
      'en': 'Angry',
      'tl': '',
    },
    'hlv5bb5g': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // Card
  {
    '22dopo4w': {
      'en': 'RESOLUTION \nNo. 646 S2024',
      'tl': '',
    },
    'mu1ndft7': {
      'en':
          'RESOLUTION GRANTING \nACCREDITATION IN FAVOR OF\n UNIFIED MUSLIM CHRISTIAN \nALLIANCE OF THE PHILIPPINES \nCORP., AS PEOPLE\'S ORGANIZATION',
      'tl': '',
    },
    '6whobs5r': {
      'en': 'Religion',
      'tl': '',
    },
    '2ck2jq00': {
      'en': 'Approved',
      'tl': '',
    },
    'ghd2gh7r': {
      'en': 'Hon. Ricardo “Boy” A. Isip, Jr.',
      'tl': '',
    },
    'qcvd7x3u': {
      'en': 'January 2, 2020',
      'tl': '',
    },
  },
  // Miscellaneous
  {
    'opanoz4o': {
      'en': 'TextField',
      'tl': 'TextField',
    },
    't9l6rhnk': {
      'en': '',
      'tl': '',
    },
    '0wgat4g3': {
      'en': '',
      'tl': '',
    },
    '3q112en4': {
      'en': '',
      'tl': '',
    },
    '00oui7xb': {
      'en': '',
      'tl': '',
    },
    'yo3olcfb': {
      'en': '',
      'tl': '',
    },
    'csgg0f35': {
      'en': '',
      'tl': '',
    },
    '805kigfp': {
      'en': '',
      'tl': '',
    },
    'nuamy7tt': {
      'en': '',
      'tl': '',
    },
    'esq576fg': {
      'en': '',
      'tl': '',
    },
    'gzxzet94': {
      'en': '',
      'tl': '',
    },
    'addgvrlo': {
      'en': '',
      'tl': '',
    },
    'wcj1laxw': {
      'en': '',
      'tl': '',
    },
    '9xdykuhu': {
      'en': '',
      'tl': '',
    },
    '2zegojo2': {
      'en': '',
      'tl': '',
    },
    'g3uq87a1': {
      'en': '',
      'tl': '',
    },
    'oip7vdfa': {
      'en': '',
      'tl': '',
    },
    '0y1j6sdn': {
      'en': '',
      'tl': '',
    },
    '3hitlifx': {
      'en': '',
      'tl': '',
    },
    'zorxqu3x': {
      'en': '',
      'tl': '',
    },
    '86g51swl': {
      'en': '',
      'tl': '',
    },
    '3jttzqil': {
      'en': '',
      'tl': '',
    },
    'ey00g48s': {
      'en': '',
      'tl': '',
    },
    'pxk7iw55': {
      'en': '',
      'tl': '',
    },
    '7uyu0b4u': {
      'en': '',
      'tl': '',
    },
    'nqdccqak': {
      'en': '',
      'tl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
