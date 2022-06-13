import 'package:carclenx_demo/utilities/appsizes.dart';
import 'package:flutter/material.dart';

class HelperComponent {
  Widget showModal(context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      child: SizedBox(
        height: AppSize.height(context) * .35,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
             const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 32,
                  )),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisCount: 4,
                children: <Widget>[
                  Column(
                    children: const [
                      Icon(
                        Icons.account_circle,
                        color: Colors.blue,
                        size: 40,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Profile',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.library_books_outlined,
                        size: 40,
                        color: Color(0xffFFCC00),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Privacy Policy',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.account_circle,
                        color: Color(0xffFFCC00),
                        size: 40,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Terms and Conditions',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.support_agent,
                        color: Color(0xffFFCC00),
                        size: 40,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Support',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Colors.redAccent,
                        size: 40,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Logout',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
