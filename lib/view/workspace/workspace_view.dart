
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject/view/workspace/manager/workspace_cubit.dart';
import 'package:graduationproject/view/workspace/workspace_model.dart';
import 'package:graduationproject/widget/rating_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../core/shared_preferences.dart';
import '../workspac_details/details_view/vieww.dart';
import '../workspac_details/view/details_screen.dart';
import '../workspac_details/manager/workspace_detail_model.dart';
import '../workspac_details/manager/workspace_details_cubit.dart';

// class CustomWorkspace extends StatefulWidget {
//   CustomWorkspace({
//     required this.model,
//     super.key});
//   WorkspaceModel model;
//
//   @override
//   State<CustomWorkspace> createState() => _CustomWorkspaceState();
// }
//
// class _CustomWorkspaceState extends State<CustomWorkspace> {
//   @override
//   Widget build(BuildContext context) {
//     return  MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (context) => WorkspaceCubit())
//         ],
//         child: BlocBuilder<WorkspaceCubit, WorkspaceState>(builder: (context, state) {
//           return
//             Padding(
//                 padding: const EdgeInsets.only(bottom: 8),
//                 child:
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           print('taped');
//                     Navigator.push(context,
//                               MaterialPageRoute(builder: (context)=> DetailView() ,));
//                         },
//                         child:
//                         Stack(
//                           alignment: Alignment.topLeft,
//                           children: [
//                             widget.model.cover == null
//                                 ? Padding(
//                               padding: EdgeInsets.only(top: 20),
//                               child: Center(
//                                 child: Icon(
//                                   Icons.image_not_supported_outlined,
//                                   size: 50.sp,
//                                 ),
//                               ),
//                             )
//                                 : CachedNetworkImage(
//                               imageUrl: widget.model.cover!,
//                               width: 50.sp,
//                               height: 50.sp,
//                               fit: BoxFit.cover,
//                             ),
//                             Positioned(
//                               height: 40,
//                               child: IconButton(
//                                 icon: const Icon(Icons.favorite_border,
//                                   size: 27,),
//                                 color: mainColor,
//                                 onPressed: () {
//                                   //Navigator.push(context, route),
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(15.sp),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 widget.model.name!,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20),
//                               ),
//                               Row(
//                                   children: [
//                                     Icon(Icons.location_on_outlined),
//                                     Text(widget.model.address!,
//                                     style: TextStyle(color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
//                                     ? Colors.white
//                                         : Colors.black87
//                                     ),
//                                     )
//                                   ]),
//                               StarRatingBar(size: 15),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 25.sp),
//                                 child:
//                                 RichText(
//                                   text: TextSpan(
//                                     text: '\$17 ',
//                                     style: TextStyle(
//                                         color:PreferenceUtils.getBool(PreferenceKey.darkTheme)
//                                             ? Colors.white
//                                             : Colors.black,
//                                         fontWeight: FontWeight.w900,
//                                         fontSize: 15),
//                                     children: [
//                                       TextSpan(
//                                         text: '/Hour',
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             fontWeight: FontWeight.normal
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ]),
//                       )
//                     ])
//             );
//         })
//     );
//   }
//}