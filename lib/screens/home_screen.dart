import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:pmsn2025/screens/challenge_screen.dart';
import 'package:pmsn2025/screens/home_screen_food.dart';
import 'package:pmsn2025/utils/value_listener.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  final colors = const [Colors.blue, Colors.blue, Colors.blue, Colors.blue];

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);

    // Mantén sincronizado el índice actual con el TabBarView.
    tabController.animation?.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted) {
        setState(() => currentPage = value);
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unselectedColor = colors[currentPage].computeLuminance() < 0.5
        ? Colors.white
        : Colors.black;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PMSN2025', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          actions: [
            ValueListenableBuilder(
              valueListenable: ValueListener.idDark,
              builder: (context, value, child) {
                return value
                    ? IconButton(
                        onPressed: () {
                          ValueListener.idDark.value = false;
                        },
                        icon: Icon(Icons.sunny, color: Colors.white),
                      )
                    : IconButton(
                        onPressed: () {
                          ValueListener.idDark.value = true;
                        },
                        icon: Icon(Icons.nightlight, color: Colors.white),
                      );
              },
            ),
          ],
        ),
        body: BottomBar(
          fit: StackFit.expand,
          borderRadius: BorderRadius.circular(32),
          duration: const Duration(milliseconds: 400),
          curve: Curves.decelerate,
          showIcon: true, // muestra el “handle”/icono central
          iconHeight: 28,
          iconWidth: 28,
          icon: (w, h) => Center(
            child: Icon(
              Icons.arrow_upward_rounded,
              size: w,
              color: unselectedColor,
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.86,
          barColor: colors[currentPage].computeLuminance() > 0.5
              ? Colors.black
              : const Color.fromARGB(255, 0, 0, 0),
          start: 2, // distancia desde arriba
          end: 0, // distancia desde abajo
          offset: 10, // separación lateral
          barAlignment: Alignment.bottomCenter,
          hideOnScroll: true,
          scrollOpposite: false,
          respectSafeArea: true,

          body: (context, controller) => TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: [
              _page(controller, colors[0], 'Inicio'),
              ChallengeScreen(),
              HomeScreenFood(),
              _page(controller, colors[3], 'Ajustes'),
            ],
          ),
          // ---- Contenido de la barra (tu navegación) ----
          child: TabBar(
            controller: tabController,
            indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: colors[currentPage], width: 4),
              insets: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            ),
            tabs: [
              _tabIcon(
                Icons.home,
                currentPage == 0 ? colors[0] : unselectedColor,
              ),
              _tabIcon(
                Icons.games_outlined,
                currentPage == 1 ? colors[1] : unselectedColor,
              ),
              _tabIcon(
                Icons.food_bank,
                currentPage == 2 ? colors[2] : unselectedColor,
              ),
              _tabIcon(
                Icons.settings,
                currentPage == 3 ? colors[3] : unselectedColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper para íconos de pestañas
  Widget _tabIcon(IconData icon, Color color) => SizedBox(
    height: 55,
    width: 40,
    child: Center(child: Icon(icon, color: color)),
  );

  // Página de ejemplo con ListView que permite ocultar la barra al desplazarse
  Widget _page(ScrollController controller, Color color, String title) {
    return Container(
      //color: const Color.fromARGB(255, 130, 169, 189),
      child: Center(child: Text('Pagina principal')),
    );
  }
}
