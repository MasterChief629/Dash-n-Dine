import 'package:dash_n_dine/helpers/iconhelper.dart';
import 'package:dash_n_dine/helpers/models/categories.dart';
import 'appcolors.dart';

class Utils {
  static List<Categories> getCategories() {
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

  static List<Categories> getMozziesCategories() {
    return [
      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'BYO Pasta',
        imageName: 'pasta.PNG',
        icon: IconFontHelper.PASTA,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'BYO Pizza',
        imageName: 'pizza.PNG',
        icon: IconFontHelper.PIZZA,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Gluten Free Pizza',
        imageName: 'gf_pizza.PNG',
        icon: IconFontHelper.GFPIZZA,
        subCategories: [],
      ),
    ];
  }

  static List<Categories> getUrbanCategories1() {
    return [
      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Catfish Poboy',
        imageName: 'catfish_po.PNG',
        icon: IconFontHelper.CATFISH,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'French Fries',
        imageName: 'fries.PNG',
        icon: IconFontHelper.FRIES,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Gluten Free Tenders and/or Fries',
        imageName: 'gf_tenders_fries.PNG',
        icon: IconFontHelper.GLUTEN_FREE,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Grilled Cheese',
        imageName: 'grilled_cheese.PNG',
        icon: IconFontHelper.GRILLED_CHEESE,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Hallal BBQ Chicken',
        imageName: 'Hallal_BBQ_chicken.PNG',
        icon: IconFontHelper.HALLAL_BBQ_CHICKEN,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Orange Chicken',
        imageName: 'orange_chicken.PNG',
        icon: IconFontHelper.ORANGE_CHICKEN,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Skirt Steak',
        imageName: 'skirt_steak.PNG',
        icon: IconFontHelper.SKIRT_STEAK,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Smash Burger',
        imageName: 'smash_burger.PNG',
        icon: IconFontHelper.SMASH_BURGER,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Soup',
        imageName: 'soup_and_chili.PNG',
        icon: IconFontHelper.SOUP,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Chili',
        imageName: 'soup_and_chili.PNG',
        icon: IconFontHelper.CHILI,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Chicken Tenders',
        imageName: 'tenders.PNG',
        icon: IconFontHelper.TENDERS,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Turkey Melt',
        imageName: 'turkey_melt.PNG',
        icon: IconFontHelper.TURKEY_MELT,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Veggie Burger',
        imageName: 'veggie_burger.PNG',
        icon: IconFontHelper.VEGGIE_BURGER,
        subCategories: [],
      ),
    ];
  }

  static List<Categories> getCopperCategories() {
    return [
      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Burrito',
        imageName: 'burrito.PNG',
        icon: IconFontHelper.BURRITO,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Chips and Dip',
        imageName: 'chip_and_dip.PNG',
        icon: IconFontHelper.CHIPS_AND_DIP,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Quesadilla',
        imageName: 'quesadilla.PNG',
        icon: IconFontHelper.QUESADILLA,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Salad Bowl',
        imageName: 'salad_bowl.PNG',
        icon: IconFontHelper.SALAD_BOWL,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Tacos (2)',
        imageName: 'tacos(2).PNG',
        icon: IconFontHelper.TACOS,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Burrito Bowl',
        imageName: 'burrito_bowl.PNG',
        icon: IconFontHelper.BURRITO_BOWL,
        subCategories: [],
      ),
    ];
  }

  static List<Categories> getBreakfastCategories() {
    return [
      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Biscuit',
        imageName: 'Biscuit.PNG',
        icon: IconFontHelper.BISCUIT,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Breakfast Protein',
        imageName: 'breakfast_protein.PNG',
        icon: IconFontHelper.BREAKFAST_PROTEIN,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Breakfast Quesadilla',
        imageName: 'breakfast_quesadilla.PNG',
        icon: IconFontHelper.BREAKFAST_QUESADILLA,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'BYO Breakfast Sandwich',
        imageName: 'BYO_breakfast_sandwich.PNG',
        icon: IconFontHelper.BREAKFAST_SANDWICH,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'BYO Omelet',
        imageName: 'BYO_omelet.PNG',
        icon: IconFontHelper.OMELET,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Eggs',
        imageName: 'eggs.PNG',
        icon: IconFontHelper.EGGS,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'French Toast',
        imageName: 'french_toast.PNG',
        icon: IconFontHelper.FRENCH_TOAST,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Hashbrowns',
        imageName: 'hashbrowns.PNG',
        icon: IconFontHelper.HASHBROWNS,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Honey Butter Biscuits and Gravy',
        imageName: 'HB_biscuit_gravy.PNG',
        icon: IconFontHelper.BISCUITS_GRAVY,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Mary Griddle',
        imageName: 'mary_griddle.PNG',
        icon: IconFontHelper.MARY_GRIDDLE,
        subCategories: [],
      ),
    ];
  }

  static List<Categories> getLouiesCategories() {
    return [
      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'BYO Burger',
        imageName: 'burrito.PNG',
        icon: IconFontHelper.BURRITO,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'BYO Sandwich',
        imageName: 'chip_and_dip.PNG',
        icon: IconFontHelper.CHIPS_AND_DIP,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Fries',
        imageName: 'quesadilla.PNG',
        icon: IconFontHelper.QUESADILLA,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Mini Chicken Tacos',
        imageName: 'salad_bowl.PNG',
        icon: IconFontHelper.SALAD_BOWL,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Toasted Ravioli',
        imageName: 'tacos(2).PNG',
        icon: IconFontHelper.TACOS,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Mac and Cheese Bites',
        imageName: 'burrito_bowl.PNG',
        icon: IconFontHelper.BURRITO_BOWL,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Drinks',
        imageName: 'burrito_bowl.PNG',
        icon: IconFontHelper.BURRITO_BOWL,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Louies Snacks',
        imageName: 'burrito_bowl.PNG',
        icon: IconFontHelper.BURRITO_BOWL,
        subCategories: [],
      ),
      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Ice Cream Sunday',
        imageName: 'burrito_bowl.PNG',
        icon: IconFontHelper.BURRITO_BOWL,
        subCategories: [],
      ),
    ];
  }
  static List<Categories> getUrbanCategories2() {
    return [
      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Catfish Poboy',
        imageName: 'catfish_po.PNG',
        icon: IconFontHelper.CATFISH,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'French Fries',
        imageName: 'fries.PNG',
        icon: IconFontHelper.FRIES,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Gluten Free Tenders and/or Fries',
        imageName: 'gf_tenders_fries.PNG',
        icon: IconFontHelper.GLUTEN_FREE,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Grilled Cheese',
        imageName: 'grilled_cheese.PNG',
        icon: IconFontHelper.GRILLED_CHEESE,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Hallal BBQ Chicken',
        imageName: 'Hallal_BBQ_chicken.PNG',
        icon: IconFontHelper.HALLAL_BBQ_CHICKEN,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Orange Chicken',
        imageName: 'orange_chicken.PNG',
        icon: IconFontHelper.ORANGE_CHICKEN,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Skirt Steak',
        imageName: 'skirt_steak.PNG',
        icon: IconFontHelper.SKIRT_STEAK,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Smash Burger',
        imageName: 'smash_burger.PNG',
        icon: IconFontHelper.SMASH_BURGER,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Soup',
        imageName: 'soup_and_chili.PNG',
        icon: IconFontHelper.SOUP,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Chili',
        imageName: 'soup_and_chili.PNG',
        icon: IconFontHelper.CHILI,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Chicken Tenders',
        imageName: 'tenders.PNG',
        icon: IconFontHelper.TENDERS,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Turkey Melt',
        imageName: 'turkey_melt.PNG',
        icon: IconFontHelper.TURKEY_MELT,
        subCategories: [],
      ),

      Categories(
        color: AppColors.DEFAULT_COLOR, //default color (gray)
        name: 'Veggie Burger',
        imageName: 'veggie_burger.PNG',
        icon: IconFontHelper.VEGGIE_BURGER,
        subCategories: [],
      ),
    ];
  }
}
