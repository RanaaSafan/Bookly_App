import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/list_viewBooks.dart';
import '../../../../../core/network/service_locator.dart';
import '../../../../../core/styles.dart';
import '../../../data/models/books.dart';
import '../../../data/repo/home_repo_impl.dart';
import '../../manager/All_Books/AllBooks_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetails extends StatefulWidget {
  final Books book;

  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    final priceAvailable = widget.book.saleInfo?.retailPrice?.amount != null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE3F2FD),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE3F2FD), Color(0xFFFFFFFF)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: widget.book.volumeInfo?.imageLinks?.thumbnail != null
                        ? Image.network(
                      widget.book.volumeInfo?.imageLinks?.thumbnail ?? "",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/book1.jpeg',
                          fit: BoxFit.cover,
                        );
                      },
                    )
                        : Image.asset(
                      'assets/images/book1.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  widget.book.volumeInfo?.title ?? 'No Title',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black12,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  widget.book.volumeInfo?.authors?.join(', ') ?? 'Unknown Author',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 26,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "4.89",
                      style: Stlyes.textStyle16.copyWith(color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  priceAvailable
                      ? 'Price: \$${widget.book.saleInfo?.retailPrice?.amount.toString() ?? ''}'
                      : 'Price: Not Available',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // عرض رسالة مع رابط للقراءة
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Read Now'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Click the link below to read the book:'),
                                const SizedBox(height: 8),
                                TextButton(
                                  onPressed: () async {
                                    // Get the reading link from your book data
                                    String readingLink = widget.book.accessInfo?.webReaderLink ?? '';

                                    // Check if the link is valid
                                    if (await canLaunch(readingLink)) {
                                      await launch(readingLink);
                                    } else {
                                      // Handle the case where the link is invalid
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: const Text('Invalid reading link.'),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(widget.book.accessInfo?.webReaderLink ?? 'No Link Available'),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF81C784),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Read Now",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // عرض الوصف عند الضغط على Free Preview
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Book Description'),
                            content: Text(
                              widget.book.volumeInfo?.description ?? 'No description available.',
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Container(
                        width: 160,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF81D4FA),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Free Preview",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              priceAvailable
                  ? ElevatedButton.icon(
                onPressed: () {
                  // عرض نافذة منبثقة لتأكيد عملية الشراء
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm Purchase'),
                        content: Text(
                          'Do you want to buy this book for \$${widget.book.saleInfo?.retailPrice?.amount.toString()}?',
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Buy'),
                            onPressed: () {
                              // عملية الشراء هنا
                              // عرض رسالة "تم الشراء بنجاح" مع أيقونة
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: [
                                      const Icon(Icons.check_circle, color: Colors.green),
                                      const SizedBox(width: 8),
                                      const Text('Purchased Successfully '),
                                    ],
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Buy Now'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
                  : const SizedBox.shrink(), // Empty widget when price is not available
              const SizedBox(height: 20),
              const Text(
                "You May Also Like",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              BlocProvider(
                create: (context) => AllbooksCubit(getIt.get<HomeRepoImpl>()),
                child: const ListViewBooks(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
