def most_expensive
  max = 0
  item = ''
  restaurant = ''
  restaurants.each do |rest, info|
    info[:meals].each do |meal, items|
      items.each do |name, details|
        if details[:price_in_cents] > max
          max = details[:price_in_cents]
          item = name
          restaurant = rest
        end
      end
    end
  end
  "#{item.to_s.capitalize.gsub('_', ' ')} from #{restaurant}"
end

def one_of_everything_from(name)
  restaurants[name][:meals].map{|meal, items| items.map{|item, info| info[:price_in_cents]}}.flatten.reduce(:+) / 100.0
end

def monthly_egg_count
  count = 0
  restaurants.each do |rest, info|
    info[:meals].each do |meal, items|
      count += items.count{|name, details| details[:ingredients].include?("eggs") } * info[:hours] * 8 * 2
    end
  end
  count * 30
end

def lactose_free_items
  lactose_free = {}
  restaurants.each do |rest, info|
    info[:meals].each do |meal, items|
      items.each do |name, details|
        lactose_free[name] = details[:price_in_cents] unless details[:ingredients].include?("cheese")
      end
    end
  end
  lactose_free.sort_by{|k,v| v}.map(&:first)
end



# restaurant data
def restaurants
  {
    "Sam's Sandwhiches" => {
      hours: 7,
      meals: {
        breakfast: {
          hamncheese: {
            price_in_cents: 499,
            ingredients: ["ham", "cheese", "english muffin"]
          },
          mcwaffle: {
            price_in_cents: 525,
            ingredients: ["waffles", "syrup", "sausage", "cheese"]
          }
        },
        lunch: {
          meatball_rollup: {
            price_in_cents: 709,
            ingredients: ["meatballs", "cheese", "tortilla"]
          },
          fluffer_nutter_with_bacon: {
            price_in_cents: 639,
            ingredients: ["bread", "fluff", "peanutbutter", "bacon"]
          }
        }
      }
    },
    "Adam's Veggie Express" => {
      hours: 9,
      meals: {
        breakfast: {
          asparagus_omlette: {
            price_in_cents: 688,
            ingredients: ["eggs", "cheese", "asparagus"]
          },
          fajita_frittata: {
            price_in_cents: 500,
            ingredients: ["eggs", "green peppers", "red peppers", "yellow peppers", "onions", "cheese"]
          }
        },
        lunch: {
          veggie_surprise_bag: {
            price_in_cents: 925,
            ingredients: ["tomato", "onion", "squash", "other stuff"]
          },
          corn_on_the_cob: {
            price_in_cents: 229,
            ingredients: ["corn"]
          }
        }
      }
    },
    "Eric's Emo Eats" => {
      hours: 3,
      meals: {
        breakfast: {
          sad_cereal: {
            price_in_cents: 277,
            ingredients: ["cereal", "milk"]
          },
          apathetic_eggs: {
            price_in_cents: 320,
            ingredients: ["eggs"]
          }
        },
        lunch: {
          mopey_falafels: {
            price_in_cents: 625,
            ingredients: ["pita", "falafel", "tahini"]
          },
          tearful_tacos: {
            price_in_cents: 719,
            ingredients: ["beef", "taco shells", "cheese", ]
          }
        }
      }
    }
  }
end
