

import 'package:bloc/bloc.dart';
import 'package:booky_app/features/home/presentation_home/manager/All_Books/AllBooks_state.dart';

import '../../../data/repo/home_repo.dart';

class AllbooksCubit extends Cubit<AllBooksState>{
  final HomeRepo homeRepo;

  AllbooksCubit(this.homeRepo):super(AllBooksIntial());

  FeatchAllBooks()async{
    emit(AllBooksLoading());
    var result=await homeRepo.FetchAllBooks();
    result.fold((ifLeft){
      emit(AllBooksFailure(error: ifLeft.error));
    }, (ifRight){
      emit(AllBooksSuccess(books: ifRight));
    });
  }

}