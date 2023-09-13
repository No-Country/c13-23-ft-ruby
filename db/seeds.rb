# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
puts "Deleting data"
Account.destroy_all
Business.destroy_all
Earning.destroy_all
Egress.destroy_all
Movement.destroy_all
Notification.destroy_all
Transfer.destroy_all
User.destroy_all

#User
user1 = User.new(first_name:"Sabrina ", last_name: "López", email: "sabrinalopez01@gmail.com", password: "Sqck4562")


photo1 = URI.open("https://hips.hearstapps.com/hmg-prod/images/ona-carbonell-1550572349.jpg")
user1.avatar.attach(io: photo1, filename: "user1.png", content_type: "image/png")
user1.save

#Bussines
business1 = Business.new(name_busines: "Creativart", description:"Arte y decoración para el hogar", user_id: user1.id)
photo2 = URI.open("https://premium-storefronts.s3.amazonaws.com/storefronts/my-store-de15b8/assets/logo.jpeg")
business1.logo.attach(io: photo2, filename: "business1.png", content_type: "image/png")
business1.save

business2 = Business.new(name_busines: "Sabrina Nails", description:"Estética y cuidado se las uñas", user_id: user1.id)
photo3 = URI.open("https://premium-storefronts.s3.amazonaws.com/storefronts/my-store-de15b8/assets/logo.jpeg")
business2.logo.attach(io: photo3, filename: "business2.png", content_type: "image/png")
business2.save

#Account
account1u1 = Account.new(name:"Banco Nación", balance:"300000", business_id: business2.id)
account2u1 = Account.new(name:"Tarjeta Naranja", balance:"200000", business_id: business2.id)
account3u1 = Account.new(name:"Mercado Pago", balance:"150000", business_id: business2.id)

account1b1 = Account.new(name:"Banco Galicia", balance:"55000", business_id: business1.id)
account2b1 = Account.new(name:"Mercado Pago", balance:"150000", business_id: business1.id)

account1u1.save
account2u1.save
account3u1.save
account1b1.save
account2b1.save

#Movements
move1 = Movement.new(balance:"$14.000",category:"Dinero Extra", beneficiary:"Ingreso", note:"Dinero", account_id:account1u1.id)
move2 = Movement.new(balance:"$80.000",category:"Salario", beneficiary:"Ingreso", note:"Salario", account_id:account2u1.id)
move3 = Movement.new(balance:"$150.000",category:"Préstamos", beneficiary:"Ingreso", note:"Venta", account_id:account3u1.id)
move4 = Movement.new(balance:"$120.000",category:"Venta", beneficiary:"Ingreso", note:"Préstamo", account_id:account1u1.id)
move5 = Movement.new(balance:"$10.000",category:"Otro", beneficiary:"Ingreso", note:"Dinero Extra", account_id:account1u1.id)
move6 = Movement.new(balance:"$8.000",category:"Venta", beneficiary:"Ingreso", note:"Venta", account_id:account3u1.id)
move7 = Movement.new(balance:"$30.000",category:"Dinero Extra", beneficiary:"Ingreso", note:"Venta", account_id:account1u1.id)
move8 = Movement.new(balance:"$10.000",category:"Venta", beneficiary:"Ingreso", note:"Venta", account_id:account2b1.id)
move9 = Movement.new(balance:"$45.000",category:"Venta", beneficiary:"Ingreso", note:"Venta", account_id:account2b1.id)
move10 = Movement.new(balance:"$100.000",category:"Venta", beneficiary:"Ingreso", note:"Préstamo", account_id:account2b1.id)

move11 = Movement.new(balance:"-$20.000",category:"Insumos", beneficiary:"Egreso", note:"Insumos", account_id:account1u1.id)
move12 = Movement.new(balance:"-$10.000",category:"Servicios", beneficiary:"Egreso", note:"Servicios", account_id:account2u1.id)
move13 = Movement.new(balance:"-$5.0000",category:"Transporte", beneficiary:"Egreso", note:"Transporte", account_id:account3u1.id)
move14 = Movement.new(balance:"-$18.000",category:"Impuestos", beneficiary:"Egreso", note:"Impuestos", account_id:account1u1.id)
move15 = Movement.new(balance:"-$2.500",category:"Otro", beneficiary:"Egreso", note:"Alquiler", account_id:account1u1.id)
move16 = Movement.new(balance:"-$10.000",category:"Gastos Personales", beneficiary:"Egreso", note:"Gastos Personales", account_id:account3u1.id)
move17 = Movement.new(balance:"$30.000",category:"Insumos", beneficiary:"Egreso", note:"Insumos", account_id:account1u1.id)
move18 = Movement.new(balance:"$10.000",category:"Impuestos", beneficiary:"Egreso", note:"Impuestos", account_id:account2b1.id)
move19 = Movement.new(balance:"$45.000",category:"Servicios", beneficiary:"Egreso", note:"Servicios", account_id:account2b1.id)
move20 = Movement.new(balance:"$100.000",category:"otro", beneficiary:"Egreso", note:"Otro", account_id:account2b1.id)

move21 = Movement.new(balance:"-$5.000",category:"Insumos", beneficiary:"Transferencia", note:"Insumos", account_id:account1u1.id)
move22 = Movement.new(balance:"-$10.000",category:"Servicios", beneficiary:"Transferencia", note:"Servicios", account_id:account2u1.id)
move23 = Movement.new(balance:"-$2.500",category:"Gastos personales", beneficiary:"Transferencia", note:"Gastos personales", account_id:account3u1.id)
move24 = Movement.new(balance:"-$10.000",category:"Impuestos", beneficiary:"Transferencia", note:"Impuestos", account_id:account1b1.id)
move25 = Movement.new(balance:"-$7.000",category:"Otro", beneficiary:"Transferencia", note:"Alquiler", account_id:account1b1.id)

move1.save
move2.save
move3.save
move4.save
move5.save
move6.save
move7.save
move8.save
move9.save
move10.save
move11.save
move12.save
move13.save
move14.save
move15.save
move16.save
move17.save
move18.save
move19.save
move20.save
move21.save
move22.save
move23.save
move24.save
move25.save

puts 'end seeds filled'
#Earnings
# earn1 = Earning.new(movements_id: move1.id)
# earn2 = Earning.new(movements_id: move2.id)
# earn3 = Earning.new(movements_id: move3.id)
# earn4 = Earning.new(movements_id: move4.id)
# earn5 = Earning.new(movements_id: move5.id)
# earn6 = Earning.new(movements_id: move6.id)
# earn7 = Earning.new(movements_id: move7.id)
# earn8 = Earning.new(movements_id: move8.id)
# earn9 = Earning.new(movements_id: move9.id)
# earn10 = Earning.new(movements_id: move10.id)

#Egresses
# eg1 = Egress.new(movements_id: move1.id)
# eg2 = Egress.new(movements_id: move2.id)
# eg3 = Egress.new(movements_id: move3.id)
# eg4 = Egress.new(movements_id: move4.id)
# eg5 = Egress.new(movements_id: move5.id)
# eg6 = Egress.new(movements_id: move6.id)
# eg7 = Egress.new(movements_id: move7.id)
# eg8 = Egress.new(movements_id: move8.id)
# eg9 = Egress.new(movements_id: move9.id)
# eg10 = Egress.new(movements_id: move10.id)