import 'dart:ui';

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
      value: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.transparent),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
          color: Colors.black12
        ),
        child: SafeArea(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Icon(Icons.timelapse_sharp, color: Colors.black,),
              ),

              Container(
                child: const Text("Boycott Center", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),),
              )
            ],
          ),
        ),
      ),
    );
  }
}