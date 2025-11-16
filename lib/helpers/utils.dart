import 'package:dash_n_dine/helpers/iconhelper.dart';
import 'package:dash_n_dine/helpers/models/categories.dart';
import 'appcolors.dart';
class Utils {
  static List<Categories> getCategories(){
    return [

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Copperhead Jacks',
        imageName: 'copperheadjacks.png',
        icon: IconFontHelper.COPPERHEAD,
        subCategories: [],
      ),
      
      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Louies',
        imageName: 'Louies.png',
        icon: IconFontHelper.LOUIES,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Mozzies',
        imageName: 'Mozzies.png',
        icon: IconFontHelper.MOZZIES,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Rice it Up!',
        imageName: 'Rice.png',
        icon: IconFontHelper.PLACEHOLDER_LOGO,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Sushi with Faith',
        imageName: 'Sushi.png',
        icon: IconFontHelper.PLACEHOLDER_LOGO,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Urban Hen',
        imageName: 'Urban Hen.png',
        icon: IconFontHelper.PLACEHOLDER_LOGO,
        subCategories: [],
      ),
    ];
  }
}