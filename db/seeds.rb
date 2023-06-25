
restaurants = Restaurant.create([
  { name: 'Pizza_inn', address: 'Tom Mboya St' },
  { name: "Dominio's", address: 'Kenyatta Avenue' },
  { name: 'Pizza_hut', address: 'Moi Avenue' },
  { name: 'Norfolk hotel', address: 'UpperHill'},
  { name: 'Kempinski Villa Rosa', address: 'Waiyaki Way'}
])


pizzas = Pizza.create([
  { name: 'Cheese', ingredients: 'Dough, Tomato Sauce, Cheese' },
  { name: 'Pepperoni', ingredients: 'Dough, Tomato Sauce, Cheese, Pepperoni' },
  { name: 'Margherita', ingredients: 'Dough, Tomato Sauce, Cheese, Basil' },
  { name: 'Periperi', ingredients: 'Dough, Tomato Sauce, Cheese, Periperi' },
  { name: 'Mushroom', ingredients: 'Dough, Tomato Sauce, Cheese, Mushrooms'}
])

# Create RestaurantPizzas
5.times do
  restaurant = restaurants.sample
  pizza = pizzas.sample
  price = rand(1..30)

  RestaurantPizza.create(restaurant: restaurant, pizza: pizza, price: price)
end