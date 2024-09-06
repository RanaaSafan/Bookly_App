
import 'package:booky_app/features/home/presentation_home/manager/best_seller/BestSeller_cubit.dart';
import 'package:booky_app/features/home/presentation_home/manager/best_seller/BestSeller_state.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/newest_books.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksView extends StatefulWidget {
  const NewestBooksView({Key? key}) : super(key: key);

  @override
  State<NewestBooksView> createState() => _NewestBooksViewState();
}

class _NewestBooksViewState extends State<NewestBooksView> {

  @override
  void initState() {
    super.initState();
    context.read<BestsellerCubit>().FeatchBestSellerBooks(); // Fetch data in initState
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestsellerCubit, BestsellerState>(
      builder: (context, state) {
        if (state is BestsellerSuccess) {
          return SizedBox(
            child: ListView.builder(
              shrinkWrap: true,  // Added to avoid unbounded height errors
              physics: const NeverScrollableScrollPhysics(),  // Replaced SliverList with ListView.builder
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return NewestBooks(book: state.books[index]);
              },
            ),
          );
        } else if (state is BestsellerFailure) {
          return const Text("Error fetching books.");  // Improved error message
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
