require_relative './method_missing.rb'

class BookStore
  def method_missing(method_name, *args, &block)
    match = /find_by_(.+)/.match(method_name.to_s)
    if match
      self.class.class_eval do
        define_method method_name do |arg|
          @books.select { |book| book[match[1].to_sym] == arg }.first
        end
      end

      send method_name, *args
    else
      super
    end
  end
end
