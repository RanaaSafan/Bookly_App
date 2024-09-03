import 'package:booky_app/core/styles.dart';
import 'package:booky_app/features/home/data/models/books.dart';
import 'package:booky_app/features/home/presentation_home/manager/best_seller/BestSeller_cubit.dart';
import 'package:booky_app/features/home/presentation_home/manager/best_seller/BestSeller_state.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewestBooks extends StatefulWidget {
  final Books book;

  const NewestBooks({Key? key, required this.book}) : super(key: key);

  @override
  State<NewestBooks> createState() => _NewestBooksState();
}

class _NewestBooksState extends State<NewestBooks> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestsellerCubit, BestsellerState>(
        builder: (context, state) {
      if (state is BestsellerSuccess) {
        return
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 140,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetails(book: widget.book,)));
                   /*   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: BlocProvider.of<BestsellerCubit>(context),
                            child: BookDetails(book: widget.book),
                          ),
                        ),
                      );*/
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: widget.book.volumeInfo?.imageLinks?.smallThumbnail != null
                            ? Image.network(
                          widget.book.volumeInfo?.imageLinks?.smallThumbnail?? " ",
                          height: 120,
                          width: 120,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/book1.jpeg',
                              height: 100,
                              width: 100,
                              fit: BoxFit.fill,
                            );
                          },
                        )
                            : Image.asset(
                          'assets/images/book1.jpeg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.book.volumeInfo?.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.book.volumeInfo?.description ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("8",style: Stlyes.textStyle16,),
                            Icon(Icons.attach_money_rounded,size: 22,color: Colors.black,),
                            Text("      "),

                            Icon(Icons.star_rounded,size: 22,color: Colors.yellow,),
                            Text("4.89",style: Stlyes.textStyle16,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }else if (state is BestsellerFailure ) {
        return Text("Error fetching books.");  // Improved error message
      } else {
        return Center(child: CircularProgressIndicator());
      }
      }
    );
  }
}



