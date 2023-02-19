// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:food_scanner/data/repository/recipes_repo.dart' as _i3;
import 'package:food_scanner/data/repository/recipes_repo_impl.dart' as _i4;
import 'package:food_scanner/domain/usecases/get_random_recipes_usecase.dart'
    as _i5;
import 'package:food_scanner/domain/usecases/get_recipe_detail_usecase.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.IRecipesRepo>(() => _i4.RecipesRepoImpl());
    gh.factory<_i5.IGetRandomRecipesUseCase>(
        () => _i5.GetRandomRecipesUseCaseImpl(gh<_i3.IRecipesRepo>()));
    gh.factory<_i6.IGetRecipeDetailUseCase>(
        () => _i6.GetRecipeDetailUseCaseImpl(gh<_i3.IRecipesRepo>()));
    return this;
  }
}
