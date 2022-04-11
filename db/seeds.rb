# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#Rake::Task['db:populate_fake_data'].invoke

#Rake::Task['db:model_queries'].invoke
Rake::Task['db:populate_fake_data'].invoke

u1 = User.create(email: "admin2@gmail.com", first_name: "Juan", last_name:"Perez", rut: "10987234-8", password: "123456", admin: true)
u2 = User.create(email: 'epcamus@miuandes.cl', first_name:'Ernesto', last_name:'Camus', rut:'20286012-5', password:'123456')
u3 = User.create(email: "joserojas@gmail.com", first_name: "Jose", last_name:"Rojas", rut: "10987984-8", password: "123456")
u4 = User.create(email: "mariarosalez@gmail.com", first_name: "Maria", last_name:"Rosalez", rut: "13987234-8", password: "123456")
u5 = User.create(email: "martincarcamo@gmail.com", first_name: "Martin", last_name:"Carcamo", rut: "15587234-8", password: "123456")
u6 = User.create(email: "cavera2@miuandes.cl", first_name: "Cristian", last_name:"Vera", rut: "19635636-3", password: "123456", admin: true)

l1 = Lodging.create(user: u1, name: 'Casa Valle del Ocaso', availability_from: '2021-01-01', availability_to: '2021-12-01', description:'casa a la orilla del mar con 4 habitaciones y 3 baños, perfecta para unas lindas vacaciones en familia',daily_fee:50000,location:'Antofagasta, Valle del mar',pets_accepted:true,parking_lot:true,breakfast_included:true,single_bed:2,double_bed:2,rooms:4,bathrooms:3,jacuzzi:true,gym:true,smoke_free:true)
l2 = Lodging.create(user: u2, name: 'Casa valle del rio',availability_from: '2021-02-10', availability_to: '2022-02-10', description:'casa a la orilla del rio con 2 habitaciones y 1 baño, perfecta para unas lindas vacaciones en familia',daily_fee:25000,location:'Calama, valle del rio',pets_accepted:true,parking_lot:true,breakfast_included:true,single_bed:1,double_bed:2,rooms:2,bathrooms:1,jacuzzi:false,gym:true,smoke_free:false)
l3 = Lodging.create(user: u1, name: 'Marriot Hotel',availability_from: '2021-02-01', availability_to: '2021-07-22', description:'Ven a disfrutar del mejor hotel de la region',daily_fee:30000,location:'Santiago, las condes',pets_accepted:true,parking_lot:true,breakfast_included:true,single_bed:2,double_bed:2,rooms:4,bathrooms:2,jacuzzi:true,gym:true,smoke_free:true)
l4 = Lodging.create(user: u6, name: 'Casa valle del ocaso',availability_from: '2021-01-01', availability_to: '2022-12-01', description:'Casa a la orilla del mar con 4 habitaciones y 3 baños, perfecta para unas lindas vacaciones en familia',daily_fee:20000,location:'Antofagasta, Valle del mar',pets_accepted:false,parking_lot:true,breakfast_included:true,single_bed:2,double_bed:2,rooms:4,bathrooms:4,jacuzzi:false,gym:false,smoke_free:false)
l5 = Lodging.create(user: u2, name: 'Depto americo vespucio',availability_from: '2021-02-01', availability_to: '2021-12-05', description:'Perfecto lugar para venir a descansar',daily_fee:30000,location:'Santiago, las condes americo vespucio',pets_accepted:true,parking_lot:true,breakfast_included:true,single_bed:2,double_bed:2,rooms:4,bathrooms:2,jacuzzi:true,gym:false,smoke_free:true)
l6 = Lodging.create(user: u3, name: 'Hotel Kennedy',availability_from: '2021-03-03', availability_to: '2022-07-03', description:'Un lugar ideal para un stop en tu semana santiaguina',daily_fee:55000,location:'Santiago, vitacura',pets_accepted:true,parking_lot:true,breakfast_included:true,single_bed:2,double_bed:2,rooms:4,bathrooms:2,jacuzzi:true,gym:true,smoke_free:true)


ru1 = ReviewUser.create(made_id: u1.id, received_id: u2.id,  text: "pesimo huesped", rating: 1, is_a_guest:false)
ru2 = ReviewUser.create(made_id: u2.id, received_id: u1.id, text: "excelente h", rating: 5, is_a_guest:true)
ru3 = ReviewUser.create(made_id: u3.id, received_id: u4.id, text: "buen host", rating: 4.5, is_a_guest:true)
rl1 = ReviewLodging.create(user: u1, lodging: l1, text: "Cool place and host. Stephanie was very friendly and gave us practice tips about where to go and what to do.", rating: 4.2)
rl2 = ReviewLodging.create(user: u2, lodging: l3, text: "a perfect place to stay, isolated in the mountains, listening to the birds and watching the moon traverse the night sky. highly recommended", rating: 4.3)
rl3 = ReviewLodging.create(user: u3, lodging: l5, text: "The house was amazing . Nuff said. Beautiful views from the house. We had a lot of privacy although the owners lived downstairs , they let us play music and enjoy ourselves without any disruption. They were very responsive and I would love to stay here again.", rating: 5)
rl4 = ReviewLodging.create(user: u4, lodging: l6, text: "Everything was beautiful even complimentary wine and chocolate. It is definitely a nice getaway!", rating: 4)
rl5 = ReviewLodging.create(user: u5, lodging: l2, text: "The Treetop is the perfect spot for relaxation and a good view. It was lovely. The hot tub was a lot of fun, I wish it got a little hotter but I still stayed in it! I love the clementine tree in the front/back yard. Walking to places around the neighborhood was challenging because of the hills, but a good workout and a beautiful view. I have no complaints.", rating: 4.7)

msg1 = Message.create(messageSender_id: u1.id, messageReceiver_id: u2.id, text: "hola como estas?")
msg2 = Message.create(messageSender_id: u2.id, messageReceiver_id: u1.id, text: "bien y tu?")

msg3 = Message.create(messageSender_id: u1.id, messageReceiver_id: u3.id, text: "hola, tengo una consulta...")

r1 = Reservation.create(user: u2, lodging: l1, entry_date: '2021-10-10', departure_date: '2021-10-20', price: 20000)
r2 = Reservation.create(user: u6, lodging: l1, entry_date: '2021-11-10', departure_date: '2021-11-23', price: 25000)
r3 = Reservation.create(user: u4, lodging: l3, entry_date: '2021-12-10', departure_date: '2021-12-20', price: 30000)
r4 = Reservation.create(user: u1, lodging: l4, entry_date: '2022-1-10', departure_date: '2022-1-20', price: 35000)

rep1 = Report.create(reportSender_id: u2.id, reportReceiver_id: u3.id, subject:"No era lo que prometia", text:"al llegar al lugar no era como salia en las fotos y las piezas no eran como se habia conversado", file: "aqui va una foto o evidencia")
rep2 = Report.create(reportSender_id: u3.id, reportReceiver_id: u4.id, subject:"Me mintieron", text:"llegue al lugar y toda la casa estaba desordenada", file: "aqui va una foto ")
rep3 = Report.create(reportSender_id: u4.id, reportReceiver_id: u5.id, subject:"Una estafa", text:"reserve por 5 dias y solo me pude quedar 4", file: "aqui va una evidencia")
rep4 = Report.create(reportSender_id: u5.id, reportReceiver_id: u6.id, subject:"Un grosero", text:"me empezo a decir palabras muy feas", file: "aca va la evidencia")
rep5 = Report.create(reportSender_id: u1.id, reportReceiver_id: u2.id, subject:"Precio equivocado", text:"me cobraron un precio equivocado", file: "aqui va una foto")
