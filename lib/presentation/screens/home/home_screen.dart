import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../utills/constants/utils.dart';
import '../../components/appbar.dart';
import '../../components/book_item.dart';
import '../../components/book_shimmer.dart';
import '../../components/category_item.dart';
import '../../components/category_shimmer.dart';
import '../../components/home_row_components.dart';
import 'home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = homeBloc;
  final refreshController = RefreshController();

  @override
  void initState() {
    super.initState();

    bloc.add(Init(false));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBarComponent(
            appBarName: 'Explore',
            appBarColor: Theme.of(context).colorScheme.background,
            textColor: redColor,
            leadingIcon: const Icon(
              Icons.arrow_back,
              size: 26,
            ),
            action: const Icon(
              Icons.more_vert,
              size: 26,
            ),
          ),
          body: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state.status != Status.LOADING) {
                refreshController.refreshCompleted();
              }
            },
            child: SmartRefresher(
              onRefresh: () => bloc.add(Init(true)),
              header: const ClassicHeader(),
              controller: refreshController,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const HomeRowComponents(componentName: 'New Releases Book'),
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) => (previous.books) != (current.books),
                    builder: (context, state) {
                      return SizedBox(
                        height: 150,
                        child: (state.status == Status.SUCCESS)
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.books?.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: (index == 0) ? 20 : 10,
                                      right: (((state.books?.length ?? 0) - 1) == index) ? 20 : 0
                                  ),
                                  child: BookItem(
                                    book: state.books?[index],
                                    tag: '',
                                  ),
                                );
                              }
                            )
                          : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: EdgeInsets.only(
                                          left: (index == 0) ? 20 : 10,
                                          right: ((7 - 1) == index) ? 20 : 0
                                      ),
                                      child: const BookShimmer()
                                  );
                            }
                        )
                      );
                    },
                  ),
                  const HomeRowComponents(componentName: 'Category'),
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) => (previous.categories) != (current.categories),
                    builder: (context, state) {
                      return SizedBox(
                          height: 50,
                          child: (state.status == Status.SUCCESS)
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.categories?.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: EdgeInsets.only(
                                            left: (index == 0) ? 20 : 10,
                                            right: ((7 - 1) == index) ? 20 : 0
                                        ),
                                        child: CategoryItem(
                                          categoryColor: categoryColors[index],
                                          categoryText: state.categories?[index]
                                              .name ?? '',
                                        )
                                    );
                                  }
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 7,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: EdgeInsets.only(
                                            left: (index == 0) ? 20 : 10,
                                            right: ((7 - 1) == index) ? 20 : 0
                                        ),
                                        child: const CategoryShimmer()
                                    );
                                  }
                                )
                      );
                    },
                  ),
                  const HomeRowComponents(componentName: 'Featured Books'),
                  BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) => (previous.books) != (current.books),
                      builder: (context, state) {
                        var fullSize = state.books?.length ?? 6;
                        var temp = (fullSize % 3 == 0) ? 0 : 1;
                        var size = (fullSize ~/ 3) + temp;

                        return Column(
                          children: [
                            for (int i = 0; i < size; i++)
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      if ((i * 3) < fullSize)
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: (state.status == Status.SUCCESS)
                                              ? BookItem(
                                                  book: state.books?[(i * 3)],
                                                  tag: '_',
                                                )
                                              : const BookShimmer()
                                        ),
                                      if ((i * 3) + 1 < fullSize)
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: (state.status == Status.SUCCESS)
                                              ? BookItem(
                                                  book: state.books?[(i * 3) + 1],
                                                  tag: '_',
                                                )
                                              : const BookShimmer()
                                        ),
                                      if ((i * 3) + 2 < fullSize)
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: (state.status == Status.SUCCESS)
                                              ? BookItem(
                                                  book: state.books?[(i * 3) + 2],
                                                  tag: '_',
                                                )
                                              : const BookShimmer()
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 20)
                                ],
                              ),
                          ],
                        );
                      }
                  ),
                  const SizedBox(height: 80)
                ],
              ),
            ),
          )
      ),
    );
  }
}