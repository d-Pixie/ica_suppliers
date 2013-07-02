#encoding : UTF-8

class CreateDefaultCategories < ActiveRecord::Migration
  def up
  	Category.create :name => "None",						:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Frukt och grönt",				:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Blommor",						:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Färdigmat",					:icon => "sandwich-2.png",	:parentid => 0
	Category.create :name => "Kött och fågel",				:icon => "butcher-2.png",	:parentid => 0
	Category.create :name => "Bröd och kex",				:icon => "bread.png",	:parentid => 0
	Category.create :name => "Mejeri, ägg",					:icon => "eggs.png",	:parentid => 0
	Category.create :name => "Chark",						:icon => "butcher-2.png",	:parentid => 0
	Category.create :name => "Fisk och skaldjur",			:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Ost",							:icon => "cheese.png",	:parentid => 0
	Category.create :name => "Ris, pasta, mos",				:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Flingor och müsli",			:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Hälsokost",					:icon => "grocery.png",	:parentid => 0
	Category.create :name => "Krydda, olja, ketchup",		:icon => "liquor.png",	:parentid => 0
	Category.create :name => "Tacos tillbehör",				:icon => "grocery.png",	:parentid => 0
	Category.create :name => "Sås, matmix, dressing",		:icon => "grocery.png",	:parentid => 0
	Category.create :name => "Skafferi och bak",			:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Sylt, kräm, marmelad",		:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Konserver",					:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Drycker",						:icon => "liquor.png",	:parentid => 0
	Category.create :name => "Glass, frysta bär",			:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Kaffe, te, chokladdryck",		:icon => "grocery.png",	:parentid => 0
	Category.create :name => "Godis och snacks",			:icon => "muffin_bagle.png",	:parentid => 0
	Category.create :name => "Fryst mat",					:icon => "sandwich-2.png",	:parentid => 0
	Category.create :name => "Kroppsvård",					:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Barnmat, blöjor",				:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Djurmat",						:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Hushållsartiklar",			:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Städ, disk, tvätt",			:icon => "liquor.png",	:parentid => 0
	Category.create :name => "Papper, påsar, formar",		:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Tidningar, pocket, tobak",	:icon => "farmstand.png",	:parentid => 0
	Category.create :name => "Apotek",						:icon => "farmstand.png",	:parentid => 0
  end  

  def down
  end
end
