require 'spec_helper'
n_time_value_proc = Proc.new {|n| n**n}
def n_time_value(array)
  array.each_with_index do |n, i|
    array[i] = n**n 
  end
  array
end

class Array 
  def change_each_item_using_proc(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n) 
    end
  end
  
  def change_each_item_using_block
    self.each_with_index do |code_block, i|
      self[i] = yield(code_block) 
    end
  end
end

describe 'Array Manipulation' do
  it 'should return [1, 4, 9, 16] if input [1, 2, 3, 4]' do
   #Given
   array = [1, 2, 3, 4]

   #When
   #new_array = array.change_each_item_using_proc n_time_value_proc 
   #new_array = n_time_value array
   new_array = array.change_each_item_using_block {|n| n**n}
    
   #Then
   new_array.should == [1, 4, 27, 256]
  end
end
