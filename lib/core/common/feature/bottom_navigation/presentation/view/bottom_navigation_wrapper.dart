import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../../../../config/routes/routes.gr.dart';
import '../../../../../themes/text_theme/all_text_styles.dart';

// TODO: Needs to be checked
@RoutePage(name: 'BottomNavWrapperRoute')
class BottomNavWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  const BottomNavWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        const HomeScreen(),
        const CalenderScreen(),
        const AppointmentScreen(),
        const NotificationScreen(),
        const ArticlesScreen(),
      ],
      builder: (context, child) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          body: child,
          bottomNavigationBar: _buildBottomNavigationBar(tabsRouter),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(TabsRouter tabsRouter) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        width: double.infinity,
        child: BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          elevation: 3,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => _onItemTapped(index, tabsRouter),
          items: _navBarItems(tabsRouter),
          selectedItemColor: PrimitiveColors.primary,
          unselectedItemColor: PrimitiveColors.stroke,
          selectedLabelStyle: AllTextStyle.f10W4.copyWith(
            color: PrimitiveColors.primary,
          ),
          unselectedLabelStyle: AllTextStyle.f10W4.copyWith(
            color: PrimitiveColors.stroke,
          ),
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  void _onItemTapped(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }

  List<BottomNavigationBarItem> _navBarItems(TabsRouter tabsRouter) {
    return [
      _navBarItem(
        icon: Icons.home_outlined,
        label: 'Home',
        isActive: tabsRouter.activeIndex == 0,
      ),
      _navBarItem(
        icon: Icons.calendar_today_outlined,
        label: 'Calender',
        isActive: tabsRouter.activeIndex == 1,
      ),
      _navBarItem(
        icon: Icons.add_box_outlined,
        label: '',
        isActive: tabsRouter.activeIndex == 2,
      ),
      _navBarItem(
        icon: Icons.history_outlined,
        label: 'History',
        isActive: tabsRouter.activeIndex == 3,
      ),
      _navBarItem(
        icon: Icons.article_outlined,
        label: 'Articles',
        isActive: tabsRouter.activeIndex == 4,
      ),
    ];
  }

  BottomNavigationBarItem _navBarItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: FittedBox(
        child: Icon(
          icon,
          color: isActive ? PrimitiveColors.primary : PrimitiveColors.stroke,
          size: label == "" ? 30.r : 20.r,
        ),
      ),
      label: label,
    );
  }
}
