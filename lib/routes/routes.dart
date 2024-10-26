import 'package:cvhub/ui/layout/main_layout.dart';
import 'package:cvhub/ui/screen/home.dart';
import 'package:cvhub/ui/screen/standard_cv.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class Routes{
  static GoRouter initial(){

    return GoRouter(
        initialLocation: Navigate.home,
        routes: [
          ShellRoute(
            routes: [

              GoRoute(
                path: Navigate.home,
                builder: (context, state) => const HomePage()
              ),


              GoRoute(
                  path: '/my-profile',
                  builder: (context, state) => StandardCV()
              ),

            ],
            
            builder: (context, state, child) => MainLayout( child: child, )
          )
        ]
    );

  }


  static void go(BuildContext context, String path) {
    GoRouter.of(context).go(path);
  }

  static void pop(BuildContext context) {
    GoRouter.of(context).pop();
  }

  /// If you want to return to the last screen use [push]
  static void push(BuildContext context, String path, {String? extra}) {
    GoRouter.of(context).push(path, extra: extra);
  }

}



class Navigate{
  static const String home='/';
  static const String myProfile = '/my-profile';
}