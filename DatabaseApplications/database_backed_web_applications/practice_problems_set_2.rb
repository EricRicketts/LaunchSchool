# 1.  Why can we call the map method directly on an instance of PG::Result?
result.map do |tuple|
  { id: tuple["id"], name: tuple["name"] }
end

# We can do this because PG::Result includes
# the Enumerable module