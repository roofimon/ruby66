class Fizzbuzz
  def count(number)
    result = number.to_s
    result = "Fizz" if number%3 == 0
    result = "Buzz" if number%5 == 0
    result = "Fizzbuzz" if number%15 == 0
    result
  end
end
