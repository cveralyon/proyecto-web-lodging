namespace :db do
  task :populate_fake_data => :environment do
    puts "Populating database"
    create_list(:user_with_lodgings_with_reservations_with_reviews, 50)
    create_list(:review_user, 50)
    create_list(:report, 50)
  end
  task :model_queries => :environment do
    puts("<Query 0: Sample query; show the names users available>\n")
    result = User.select(:first_name).distinct.map { |x| x.first_name }
    puts(result)
    puts("------- EOQ -------") # End Of Query -- always add this line after a query.
    puts("<Query 1: Get all lodging created by a user id=1>\n")
    puts Lodging.joins(:user).where('user_id=1').map{ |x|  x.name }
    puts("------- EOQ -------")
    puts("<Query 2: Get all user who haVe stayed in location id=1>\n")
    puts User.joins(:reservations, :lodgings).distinct.where(reservations:{lodging_id:1}).map{ |x|  x.first_name }
    puts("------- EOQ -------")
    puts("<Query 3: Get all user who have stayed in location id=1>\n")
    puts Reservation.joins(:user).select('users.first_name, reservations.entry_date, reservations.departure_date').where(lodging_id:1).map{|x|" Don #{x.first_name} estuvo desde #{x.entry_date} hasta #{x.departure_date} en el lodging de id 1"}
    puts("------- EOQ -------")
    puts("<Query 4: Get all review of a given host, aqui los review tienen un booleando que cuando es hecho por un usuario en calidad de guest osea que es un review hacia un host este es true en caso de que sea desde un host a un guest este sera false, y el receibed se refiere a la fk user_id de quien recibe el review osea a quien se le hace>\n")
    puts ReviewUser.where(is_a_guest:true).where(received_id:1).map{ |x| [x.text, x.rating]}
    puts("------- EOQ -------")
    puts("<Query 5: Get all review of a given guest, aqui es similar a la logica de arriba solo que el bool es false>\n")
    puts ReviewUser.where(is_a_guest:false).where(received_id:2).map{ |x| [x.text, x.rating]}
    puts("------- EOQ -------")
    puts("<Query 6: Get the average rating of a lodging>\n")
    puts ReviewLodging.where(lodging_id:4).average(:rating)
    puts("------- EOQ -------")
    puts("<Query 7: Get all messages in a user's inbox>\n")
    puts Message.where('messageSender_id=1 or messageReceiver_id=1').map{ |x| "el usuario de id: #{x.messageSender_id} le envio el mensaje: #{x.text} a el usuario de id: #{x.messageReceiver_id} "}
    puts("------- EOQ -------")
    puts("<Query 8: Get all message sent by a user to other users>\n")
    puts Message.where(messageSender_id:1).map{ |x| "el usuario de id: #{x.messageSender_id} le envio el mensaje: #{x.text} a el usuario de id: #{x.messageReceiver_id} "}
    puts("------- EOQ -------")
    puts("<Query 9: Get all admins acount>\n")
    puts Admin.distinct.map{ |x| x.email}
    puts("------- EOQ -------")
    puts("<Query 10: email should be unique>\n")
    begin
      inv_u = User.create!(email:'cavera2@miuandes.cl',first_name:'juan',last_name:'camus',rut:'85616625',password:'hola')
    rescue => e
      puts(e.message)
    end
    puts("------- EOQ -------")
    puts("<Query 11: email should be well-formed>\n")
    begin
      inv_u2 = User.create!(email:'epca',first_name:'juan',last_name:'camus',rut:'85616625',password:'hola')
    rescue => e
      puts(e.message)
    end
    puts("------- EOQ -------")

  end

end


=begin
  task :populate_fake_data => :environment do
    # If you are curious, you may check out the file
    # RAILS_ROOT/test/factories.rb to see how fake
    # model data is created using the Faker and
    # FactoryBot gems.
    puts "Populating database"
    create_list(:Lodgings_with_reservations_with_review_lodgings, 50)
    create_list(:user, 100)
    create_list(:review_user, 1000)
  end
=end


