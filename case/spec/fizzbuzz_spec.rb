require 'spec_helper'
$fizzbuzz = nil
describe 'Fizzbuzz' do
  let(:fizzbuzz) { $fizzbuzz = Fizzbuzz.new }
  it 'should return 1 if input is 1' do
    expect(fizzbuzz.count(1)).to eq 'Fizz'
  end

  it 'should return 2 if input is 2' do
    expect(fizzbuzz.count(2)).to eq 'Fizz'
  end

  it 'should return 3 if input is 3' do
    expect(fizzbuzz.count(3)).to eq 'Fizz'
  end
  
  it 'should return Buzz if input is 5' do
    expect(fizzbuzz.count(5)).to eq 'Buzz'
  end

  it 'should return Fizz if input is 6' do
    expect(fizzbuzz.count(6)).to eq 'Fizz'
  end

  it 'should return Buzz if input is 10' do
    expect(fizzbuzz.count(10)).to eq 'Buzz'
  end

end
