import 'dart:ui';

import 'package:boycott_center/common/icon_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 100);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
          color: Colors.white
        ),
        child: SafeArea(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(radarIcon, color: Colors.black,),
              ),

              Container(
                margin: const EdgeInsets.only(left: 15),
                child: const Text("Boycott Center", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),),
              )
            ],
          ),
        ),
      ),
    );
  }
}