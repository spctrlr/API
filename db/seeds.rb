# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u1 = User.create(username: 'Tod', email: 'tod@email.com',
  password: 'todpass', password_confirmation: 'todpass')

u2 = User.create(username: 'Mark', email: 'mark@email.com',
  password: 'markpass', password_confirmation: 'markpass')

gift_card = Voucher.create(balance: 250.99, currency: 'USD', secret_code: 'super-secret-code',
  expires_on: Date.today + 7.days, users_id: u1.id)