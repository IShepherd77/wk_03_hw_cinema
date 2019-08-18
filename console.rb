require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')
require_relative('models/screening')

require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()
Screening.delete_all()


customer1 = Customer.new({
  'name' => 'Ian Shepherd',
  'funds' => 1000
  })

  customer2 = Customer.new({
    'name' => 'Vic Shepherd',
    'funds' => 500
    })

  customer1.save()
  customer2.save()

  film1 = Film.new({
    'title' => 'Jackie Brown',
    'price' => 7
    })

  film2 = Film.new({
    'title' => 'Avengers 1',
    'price' => 5
    })

  film3 = Film.new({
    'title' => 'Toy Story 1',
    'price' => 4
    })

  film4 = Film.new({
    'title' => 'Jaws',
    'price' => 8
    })

  film1.save()
  film2.save()
  film3.save()
  film4.save()

  ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
  ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
  ticket3 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
  ticket4 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
  ticket5 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})
  ticket6 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id})
  ticket7 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film4.id})
  ticket8 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film4.id})

  ticket1.save()
  ticket2.save()
  ticket3.save()
  ticket4.save()
  ticket5.save()
  ticket6.save()
  ticket7.save()
  ticket8.save()

  tickets = Ticket.all()

  puts customer1.customer_films()[0].title
  puts film1.film_customers().first().name

  jackie_brown_morning = Screening.new({'show_time' => '09:00', 'film_id' => film1.id, 'tickets_remaining' => '100'})
  jackie_brown_afternoon = Screening.new({'show_time' => '15:00', 'film_id' => film1.id, 'tickets_remaining' => '50'})
  avengers_1_morning = Screening.new({'show_time' => '08:00', 'film_id' => film2.id, 'tickets_remaining' => 90})
  avengers_1_afternoon = Screening.new({'show_time' => '16:00', 'film_id' => film2.id, 'tickets_remaining' => 75})
  toy_story_1_morning = Screening.new({'show_time' => '09:00', 'film_id' => film3.id, 'tickets_remaining' => 110})
  toy_story_1_afternoon = Screening.new({'show_time' => '17:00', 'film_id' => film3.id, 'tickets_remaining' => 85})
  jaws_morning = Screening.new({'show_time' => '08:30', 'film_id' => film4.id, 'tickets_remaining' => 110})
  jaws_afternoon = Screening.new({'show_time' => '17:30', 'film_id' => film4.id, 'tickets_remaining' => 85})

  jackie_brown_morning.save()
  jackie_brown_afternoon.save()
  avengers_1_morning.save()
  avengers_1_afternoon.save()
  toy_story_1_morning.save()
  toy_story_1_afternoon.save()
  jaws_morning.save()
  jaws_afternoon.save()

  binding.pry
  nil
