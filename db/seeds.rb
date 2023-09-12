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
ApplicationRecord.destroy_all
Bussiness.destroy_all
Earning.destroy_all
Egress.destroy_all
Movement.destroy_all
Notification.destroy_all
Transfer.destroy_all
User.destroy_all

#User
user1 = User.new(first_name:"Sabrina ", last_name: "López",
email: "sabrinalopez01@gmail.com", encrypted_password: "Sqck4562")

photo1 = URI.open("https://hips.hearstapps.com/hmg-prod/images/ona-carbonell-1550572349.jpg")
user1.photo.attach(io: photo1, filename: "user1.png", content_type: "image/png")
user1.save

#Bussines
business1 = Bussiness.new(name_business:"Creativart", description:"Arte y decoración para el hogar", user_id: user1.id)
photo2 = URI.open("https://premium-storefronts.s3.amazonaws.com/storefronts/my-store-de15b8/assets/logo.jpeg")
business1.photo.attach(io: photo2, filename: "business1.png", content_type: "image/png")
business1.save

business2 = Bussiness.new(name_business:"Sabrina Nails", description:"Estética y cuidado se las uñas", user_id: user1.id)
photo3 = URI.open("https://scontent.fcor10-3.fna.fbcdn.net/v/t39.30808-6/304768228_1054735998589954_7123848284854417951_n.jpg")
business2.photo.attach(io: photo3, filename: "business2.png", content_type: "image/png")
business2.save

#Account
account1u1 = Account.new(name:"Banco Nación", balance:"300000", business_id: business2.id)
account2u1 = Account.new(name:"Tarjeta Naranja", balance:"200000", business_id: business2.id)
account3u1 = Account.new(name:"Mercado Pago", balance:"150000", business_id: business2.id)

account1b1 = Account.new(name:"Banco Galicia", balance:"55000", business_id: business1.id)
account2b1 = Account.new(name:"Mercado Pago", balance:"150000", business_id: business1.id)

#Movements
move1 = Movement.new(balance:"$14.000",category:"Dinero Extra", beneficiary:"Ingreso", note:"Dinero", accounts_id:account1u1.id)
move2 = Movement.new(balance:"$80.000",category:"Salario", beneficiary:"Ingreso", note:"Salario", accounts_id:account2u1.id)
move3 = Movement.new(balance:"$150.000",category:"Préstamos", beneficiary:"Ingreso", note:"Venta",, accounts_id:account3u1.id)
move4 = Movement.new(balance:"$120.000",category:"Venta", beneficiary:"Ingreso", note:"Préstamo", accounts_id:account1u1.id)
move5 = Movement.new(balance:"$10.000",category:"Otro", beneficiary:"Ingreso", note:"Dinero Extra", accounts_id:account1u1.id)
move6 = Movement.new(balance:"$8.000",category:"Venta", beneficiary:"Ingreso", note:"Venta", accounts_id:account3u1.id)
move7 = Movement.new(balance:"$30.000",category:"Dinero Extra", beneficiary:"Ingreso", note:"Venta", accounts_id:account1u1.id)
move8 = Movement.new(balance:"$10.000",category:"Venta", beneficiary:"Ingreso", note:"Venta", accounts_id:account2b1.id)
move9 = Movement.new(balance:"$45.000",category:"Venta", beneficiary:"Ingreso", note:"Venta", accounts_id:account2b1.id)
move10 = Movement.new(balance:"$100.000",category:"Venta", beneficiary:"Ingreso", note:"Préstamo", accounts_id:account2b1.id)

move11 = Movement.new(balance:"-$20.000",category:"Insumos", beneficiary:"Egreso", note:"Insumos", accounts_id:account1u1.id)
move12 = Movement.new(balance:"-$10.000",category:"Servicios", beneficiary:"Egreso", note:"Servicios", accounts_id:account2u1.id)
move13 = Movement.new(balance:"-$5.0000",category:"Transporte", beneficiary:"Egreso", note:"Transporte",, accounts_id:account3u1.id)
move14 = Movement.new(balance:"-$18.000",category:"Impuestos", beneficiary:"Egreso", note:"Impuestos", accounts_id:account1u1.id)
move15 = Movement.new(balance:"-$2.500",category:"Otro", beneficiary:"Egreso", note:"Alquiler", accounts_id:account1u1.id)
move16 = Movement.new(balance:"-$10.000",category:"Gastos Personales", beneficiary:"Egreso", note:"Gastos Personales", accounts_id:account3u1.id)
move17 = Movement.new(balance:"$30.000",category:"Insumos", beneficiary:"Egreso", note:"Insumos", accounts_id:account1u1.id)
move18 = Movement.new(balance:"$10.000",category:"Impuestos", beneficiary:"Egreso", note:"Impuestos", accounts_id:account2b1.id)
move19 = Movement.new(balance:"$45.000",category:"Servicios", beneficiary:"Egreso", note:"Servicios", accounts_id:account2b1.id)
move20 = Movement.new(balance:"$100.000",category:"otro", beneficiary:"Egreso", note:"Otro", accounts_id:account2b1.id)

move21 = Movement.new(balance:"-$5.000",category:"Insumos", beneficiary:"Transferencia", note:"Insumos", accounts_id:account1u1.id)
move22 = Movement.new(balance:"-$10.000",category:"Servicios", beneficiary:"Transferencia", note:"Servicios", accounts_id:account2u1.id)
move23 = Movement.new(balance:"-$2.500",category:"Gastos personales", beneficiary:"Transferencia", note:"Gastos personales",, accounts_id:account3u1.id)
move24 = Movement.new(balance:"-$10.000",category:"Impuestos", beneficiary:"Transferencia", note:"Impuestos", accounts_id:account1b1.id)
move25 = Movement.new(balance:"-$7.000",category:"Otro", beneficiary:"Transferencia", note:"Alquiler", accounts_id:account1b1.id)



#Earnings
earn1 = Earning.new(movements_id: move1.id)
earn2 = Earning.new(movements_id: move2.id)
earn3 = Earning.new(movements_id: move3.id)
earn4 = Earning.new(movements_id: move4.id)
earn5 = Earning.new(movements_id: move5.id)
earn6 = Earning.new(movements_id: move6.id)
earn7 = Earning.new(movements_id: move7.id)
earn8 = Earning.new(movements_id: move8.id)
earn9 = Earning.new(movements_id: move9.id)
earn10 = Earning.new(movements_id: move10.id)

#Egresses
eg1 = Egress.new(movements_id: move1.id)
eg2 = Egress.new(movements_id: move2.id)
eg3 = Egress.new(movements_id: move3.id)
eg4 = Egress.new(movements_id: move4.id)
eg5 = Egress.new(movements_id: move5.id)
eg6 = Egress.new(movements_id: move6.id)
eg7 = Egress.new(movements_id: move7.id)
eg8 = Egress.new(movements_id: move8.id)
eg9 = Egress.new(movements_id: move9.id)
eg10 = Egress.new(movements_id: move10.id)