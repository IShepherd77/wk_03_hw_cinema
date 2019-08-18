require_relative("../db/sql_runner")

class Screening

attr_reader :id, :film_id
attr_accessor :show_time, :tickets_remaining

def initialize(options)
  @id = options['id'].to_i if options['id']
  @show_time = options['show_time']
  @film_id = options['film_id']
  @tickets_remaining = ['tickets_remaining'][0].to_i
end


def save()
  sql = "INSERT INTO screenings (show_time, film_id, tickets_remaining) VALUES ($1, $2, $3) RETURNING id"
  values = [@show_time, @film_id, @tickets_remaining]
  screening = SqlRunner.run(sql, values).first
  @id = screening['id'].to_i
end

def update()
  sql = "UPDATE screenings (show_time, film_id, tickets_remaining) = ($1, $2, $3) WHERE id = $4"
  values = [@show_time, @film_id, @tickets_remaining, @id]
end

def delete()
  sql = "DELETE * FROM screenings WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM screenings"
  SqlRunner.run(sql)
end

def self.map_items(data)
  result = data.map{|screening| Screening.new(screening)}
  return result
end

def self.all()
  sql = "SELECT * FROM screenings"
  screening_data = SqlRunner.run(sql)
  return Screening.map_items(screening_data)
end


end
