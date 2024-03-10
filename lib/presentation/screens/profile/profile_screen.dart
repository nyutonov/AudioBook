import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utills/constants/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bloc = profileBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar:  AppBar(
          title: const Center(
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Uni Neue',
                fontWeight: FontWeight.w600,
              ),
            )
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 26,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const ImageIcon(
                AssetImage(
                  'assets/icons/edit.png',
                ),
                color: Colors.white,
                size: 22,
              ),
              onPressed: () {  },
            ),
          ],
          elevation: 0,
          backgroundColor: redColor,
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: ShapeDecoration(
                color: redColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Colors.deepPurple
                          ),
                          child: const CircularProgressIndicator(),
                        ),
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.transparent,
                          backgroundImage: CachedNetworkImageProvider(
                            CurrentUser.photo
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                        CurrentUser.userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Uni Neue',
                          fontWeight: FontWeight.w700,
                        )
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0,vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User Name',
                        style: TextStyle(
                          color: redColor,
                          fontSize: 14,
                          fontFamily: 'Uni Neue',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        CurrentUser.userName,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.5,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0,vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: redColor,
                          fontSize: 14,
                          fontFamily: 'Uni Neue',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          var email = CurrentUser.email;
                          var index = email.indexOf('@');

                          return Text(
                            (email.substring(0, index).length > 20)
                                ? '${email.substring(0, index).substring(0, 20)}...${email.substring(index, email.length)}'
                                : email,
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodySmall?.color,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        }
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.5,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 12),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             'Dark Mode',
            //             style: TextStyle(
            //               color: redColor,
            //               fontSize: 14,
            //               fontFamily: 'Uni Neue',
            //               fontWeight: FontWeight.w700,
            //             ),
            //           ),
            //           BlocBuilder<ProfileBloc, ProfileState>(
            //             builder: (context, state) {
            //               return Switch(
            //                 value: state.switchValue ?? false,
            //                 onChanged: (value) => BlocProvider.of<ProfileBloc>(context).add(ChangeSwitch(value)),
            //               );
            //             },
            //           )
            //         ],
            //       ),
            //       const SizedBox(height: 10),
            //       Container(
            //         decoration: const ShapeDecoration(
            //           shape: RoundedRectangleBorder(
            //             side: BorderSide(
            //               width: 1,
            //               strokeAlign: BorderSide.strokeAlignCenter,
            //               color: Color(0xFFF2F2F2),
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
