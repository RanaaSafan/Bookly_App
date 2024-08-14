import 'package:bloc/bloc.dart';
import 'package:booky_app/features/home/presentation_home/manager/best_seller/BestSeller_state.dart';

import '../../../data/repo/home_repo.dart';

class BestsellerCubit extends Cubit<BestsellerState>{
  final HomeRepo homeRepo;

  BestsellerCubit(this.homeRepo):super(BestsellerIntial());

  FeatchBestSellerBooks()async{
    emit(BestsellerLoading());
    var result=await homeRepo.FetchNewestBooks();
    result.fold((ifLeft){
      emit(BestsellerFailure(error: ifLeft.error));
    }, (ifRight){
      emit(BestsellerSuccess(books: ifRight));
    });
  }

}