require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')

require('pry-byebug')

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



            binding.pry
            nil
