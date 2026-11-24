import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:provider/provider.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';

void main() {
  runApp(MyApp(apiClient: ApiClient()));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.apiClient, super.key});

  final ApiClient apiClient;

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF6D2932);
    const paper = Color(0xFFFFFDF1);
    const accent = Color(0xFF3C2A21);

    return MultiProvider(
      providers: [
        Provider.value(value: apiClient),
        ChangeNotifierProvider(create: (_) => AuthState(apiClient)),
      ],
      child: MaterialApp(
        title: 'MyPortofolio',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: paper,
          colorScheme: ColorScheme.fromSeed(
            seedColor: ink,
            primary: ink,
            onPrimary: paper,
            secondary: accent,
            surface: paper,
          ),
          cardTheme: CardThemeData(
            color: Colors.white,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4), // --radius
              side: const BorderSide(
                color: Color(0xFF412D15),
                width: 0.5,
              ), // --line
            ),
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
