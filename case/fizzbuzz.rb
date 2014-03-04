class Fizzbuzz
  def count(number)
    case number
    when 5, 10
      text = "Buzz"
    when 1,2,3,6
      text = "Fizz"  
    else
      text = number.to_s
    end
    text
  end
end
