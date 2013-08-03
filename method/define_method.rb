require_relative './method_missing.rb'

class BookStore
  [:title, :author].each do |attr|
    define_method "find_by_#{attr}" do |arg|
      @books.select { |book| book[attr] == arg }.first
    end
  end
end
