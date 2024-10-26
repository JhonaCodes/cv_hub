import 'package:cvhub/ui/layout/main_layout.dart';
import 'package:cvhub/ui/screen/standard_cv.dart';

import 'package:go_router/go_router.dart';

class Routes{
  static GoRouter initial(){

    return GoRouter(
        initialLocation: '/',
        routes: [
          ShellRoute(
            routes: [

              GoRoute(
                path: '/',
                builder: (context, state){
                  return StandardCV();
                }
              ),




            ],
            
            builder: (context, state, child) => MainLayout( child: child, )
          )
        ]
    );

    // return {
    //   '/' : (context) => StandardCV(),
    //   '/text' : (context) => Text("Route text")
    // };
  }
}