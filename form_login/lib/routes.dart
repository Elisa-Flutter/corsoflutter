import 'package:form_login/components/impostazioni.dart';
import 'package:form_login/components/pagina_1.dart';
import 'package:form_login/components/pagina_2.dart';
import 'package:form_login/components/profilo.dart';
import 'package:form_login/main.dart';

generateRoutes() {
  return {
    '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
    '/pagina1': (context) => const Pagina1(),
    '/pagina2': (context) => const Pagina2(),
    '/impostazioni': (context) => const Impostazioni(),
    '/profilo': (context) => const Profilo(),
  };
}
