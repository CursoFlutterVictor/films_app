import 'package:films_app/controllers/auth_controller.dart';
import 'package:films_app/controllers/user_controller.dart';
import 'package:films_app/controllers/wrapped_list_controller.dart';
import 'package:films_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarUserWidget extends StatelessWidget {
  const AppBarUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    UserController userController = Get.find();
    WrappedListController wrappedListController = Get.find();
    return AppBar(
      backgroundColor: Colors.blueGrey,
      actions: [
        // ********************************************************
        // FloatingActionButton(
        //   onPressed: () {
        //     authController.signOut();
        //   },
        // ),
        // FloatingActionButton(
        //   onPressed: () async {
        //     await userController.fillFavouriteMovies();
        //     wrappedListController.wrappedMovieList.value =
        //         userController.favMovies.value;
        //     Get.toNamed(AppRoutes.WRAPPEDLIST, arguments: "FAVOURITE LIST");
        //   },
        // ),
        // ********************************************************
        PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20).copyWith(
              topRight: const Radius.circular(0),
            ),
          ),
          color: Colors.blueGrey,
          iconSize: 30,
          icon: const Icon(
            Icons.person,
          ),
          //******************************************** */
          onSelected: (value) async {
            switch (value) {
              case "Profile":
                break;
              case "Home":
                Get.offAllNamed(AppRoutes.HOME);
                break;
              case "Favourites":
                await userController.fillFavouriteMovies();
                wrappedListController.wrappedMovieList.value =
                    userController.favMovies.value;
                Get.toNamed(AppRoutes.WRAPPEDLIST, arguments: "FAVOURITE LIST");
                break;
              case "Signout":
                authController.signOut();
                break;
              default:
            }
            // ScaffoldMessenger.of(context)
            //     .showSnackBar(SnackBar(content: Text('$value item pressed')));
          },
          //******************************************** */
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'Profile',
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.face),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                  )
                ],
              ),
            ),
            PopupMenuItem(
              value: 'Home',
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.home),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'Favourites',
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.favorite),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Favourites",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                  )
                ],
              ),
            ),
            PopupMenuItem(
              value: 'Signout',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  // const Divider(
                  //   color: Colors.white,
                  // )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
