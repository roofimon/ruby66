require 'spec_helper'
$fizzbuzz = nil
describe 'Fizzbuzz' do
  let(:fizzbuzz) { $fizzbuzz = Fizzbuzz.new }
  it 'should return 1 if input is 1' do
    expect(fizzbuzz.count(1)).to eq '1'
  end
end
