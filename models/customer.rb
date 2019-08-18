require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = 'INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id'
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

def update ()
  sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
  values = [@name, @funds, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE * FROM customers WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end

def self.map_items(data)
  result = data.map{|customer| Customer.new(customer)}
  return result
end

def self.all()
  sql = "SELECT * FROM customers"
  customer_data = SqlRunner.run(sql)
  return Customer.map_items(customer_data)
end

def customer_films() #put in customers.rb as customer films.  Values id if from customer.rb so in that file.
  sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1;"
  values = [@id] #is customer id not film id
  film_data = SqlRunner.run(sql, values) #returning film data for customer so why film_data and not customer_data
  return Film.map_items(film_data) #as dealing with film_data, will new new Film
end

#attempting to buy ticket
#Is the customer who is buying a ticket so why I have chosen customer.rb
#end goal is funds - film price when all film prices are different.  Is not ticket price
#no SQL required

def buy_ticket(film) #parameter as we do not know which film will be passed in
  ticket = Ticket.new({'customer_id' => @id, 'film_id' => film.id}) #created new ticket instance with ticket attributes
  ticket.save() #do I need to save new ticket as worked without?
  @funds -= film.price #already in customer.rb so can access funds which deducts from film which I can access via film.price method?
  update()
end

# #chosen customer.rb as searching by customer id in values but again do not know how to return result
# def no_of_tickets_bought_by_customer()
#   sql ="SELECT COUNT(*) FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id
#   WHERE tickets.customer_id = $1"
# values = [@id]
# customer_data = SqlRunner.run(sql, values)
# return Customer.map_items(customer_data)
# end



end
