# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tod = User.create(username: 'Tod', email: 'tod@email.com',
  password: 'todpass', password_confirmation: 'todpass')

mark = User.create(username: 'Mark', email: 'mark@email.com',
  password: 'markpass', password_confirmation: 'markpass')

gift_card = Voucher.create(balance: 599, currency: 'USD', 
  secret_code: 'super-secret-code', user_id: 1)

gift_card = Voucher.create(balance: 50.99, currency: 'GBP', 
  secret_code: 'secret-code', user_id: 1)

brand_1 = Brand.create(name: 'SomeBrand', address: 'Some addres somewhere in the world',
  email: 'some@email.com', status: true)

brand_2 = Brand.create(name: 'OtherBrand', address: 'Another addres somewhere in the world',
  email: 'another@email.com', status: true)