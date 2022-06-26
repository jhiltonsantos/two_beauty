import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/injection/injection.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/bottom_navy/bottom_navy_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/bottom_navy/bottom_navy_state.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/create_owner_intro_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/create_store_intro_page.dart';
import 'package:two_beauty/features/2beauty/presentation/pages/home_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/close_app_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/logout_modal.dart';

class BottomNavyPage extends StatefulWidget {
  const BottomNavyPage({Key? key}) : super(key: key);

  @override
  State<BottomNavyPage> createState() => _BottomNavyPageState();
}

class _BottomNavyPageState extends State<BottomNavyPage> {
  int currentIndex = 0;
  int previousIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(closeAppRoute);
        return false;
      },
      child: Scaffold(
        body: BlocBuilder<BottomNavyCubit, BottomNavyState>(
            builder: (context, state) {
          if (state is HomePageLoadedState) {
            return showHomePage();
          }
          if (state is MyStorePageLoadedState) {
            return const CreateStoreIntroPage();
          }
          if (state is CreateOwnerIntroState) {
            return const CreateOwnerIntroPage();
          }
          if (state is LogoutPageLoadedState) {
            return const CloseAppWidget();
          }
          return const ErrorPage();
        }),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTapBottomNavy,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Criar Negócio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Sair',
            )
          ],
          selectedLabelStyle: TextStyles.labelBottomNavy(),
          unselectedLabelStyle: TextStyles.labelBottomNavy(),
        ),
      ),
    );
  }

  void onTapBottomNavy(int index) {
    setState(() {
      previousIndex = currentIndex;
      currentIndex = index;

      if (currentIndex == 0) {
        BlocProvider.of<BottomNavyCubit>(context).toHomePage();
      }
      if (currentIndex == 1) {
        BlocProvider.of<BottomNavyCubit>(context).getOwnerUser();
      }

      if (currentIndex == 2) {
        LogoutModal().call(context);
        currentIndex = previousIndex;
      }
    });
  }

  BlocProvider<HomeCubit> showHomePage() {
    return BlocProvider<HomeCubit>(
      create: (_) => getIt(),
      child: const HomePage(),
    );
  }
}
