import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/workspac_details/details_view/testooo.dart';

import 'details_cubit.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DetailsCubit>(context);
    int index = 0;
    return
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => DetailsCubit()..getWorkspacesDetail(id:cubit.workspaceList[index].id))
          ],
          child: BlocBuilder<DetailsCubit, DetailsState>(builder: (context, state) {
            return Scaffold(
              body: ListView(
                  children: [
                    cubit.workspaceList.isEmpty
                        ? Center(child: const CupertinoActivityIndicator())
                        : Testoooo(model: cubit.workspaceList[index],id:cubit.workspaceList[index].id,),
                  ]),
            );
          }
          )
      );
  }
}