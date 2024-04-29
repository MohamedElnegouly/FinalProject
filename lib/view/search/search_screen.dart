import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/search/cubit/search_cubit.dart';
import '../../widget/search_category.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                iconColor: Colors.grey.shade50,
                hintText: "Where do you want to work ?",
                border: InputBorder.none,
                helperStyle: TextStyle(
                  color: Colors.grey.shade100,
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                const Text(
                  'Booking for:',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                const Text(
                  ' 26 june',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 125,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    )),
                const Text(
                  'Filters',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
              // crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoaded) {
                  return ListView.builder(
                      itemCount: state.workspaces.length,
                      itemBuilder: (context, index) {
                        return SearchCategory(
                          searchmodel: state.workspaces[index],
                        );
                      });
                }
                if (state is FailedToGetSearch) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
