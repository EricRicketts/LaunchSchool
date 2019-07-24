require 'pg'

conn = PG::Connection.new(dbname: 'rb185')
result = conn.exec("SELECT * FROM films;")

puts
result.values.each do |row|
  p row
end
puts

names_and_films = <<SQL_S1
SELECT d.name, string_agg(f.title, ', ') AS "films"
FROM directors AS d
INNER JOIN films AS f
ON d.id = f.director_id
GROUP BY d.name;
SQL_S1

result2 = conn.exec(names_and_films)

result2.each do |row|
  p row
end


