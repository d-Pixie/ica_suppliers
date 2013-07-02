class Category < ActiveRecord::Base
  has_many :categorizations, :dependent => :destroy
  has_many :suppliers, :through => :categorizations, :dependent => :destroy
  
  ICONS = ["beef.png", "bread.png", "breakfast.png", "cakes.png", "candy.png", "caution.png", 
           "cheese.png", "chicken.png", "clothers.png", "coffee.png", "cow.png", "default.png",
           "drugstore.png", "duck.png", "eggs.png", "farmstand.png", "fastfood.png", "fish.png",
           "flower.png", "fruits.png", "generic.png", "grocery.png", "icecream.png",
           "italian.png", "japanese.png", "liquor.png", "lobster.png", "makeup.png",
           "mediterranean.png", "meet.png", "mexican.png", "mushroom.png", "nursery.png",
           "paint.png", "paper.png", "perfumery.png", "pets.png", "phones.png", "pig.png", "pizzaria.png",
           "pork.png", "postal.png", "sandwich.png", "shoe.png", "shoppingbasket.png", "shrimp.png",
           "snail.png", "supermarket.png", "swordfish.png", "teahouse.png", "textiles.png",
           "toys.png", "underwear.png", "vegetable.png", "wine.png"]
end
