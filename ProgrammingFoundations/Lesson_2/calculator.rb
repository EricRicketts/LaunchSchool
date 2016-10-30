def get_input
  Kernel.puts("Please input two numbers: ")
  numbers = Kernel.gets.chomp.split.map {|c| c.to_f}
  Kernel.puts("Please input the arithmetic operation (+, -, *, /): ")
  operation = Kernel.gets().chomp()
  return numbers, operation
end

def perform_operation(numbers, operation)
  numbers[0].send(operation, numbers[1])
end

numbers, operation = get_input()
Kernel.puts(perform_operation(numbers, operation))