require './mimic_accessors'

RSpec.describe 'Mimic Accessors' do
  let(:person) { Person.new }
  context '.attribute_reader' do
    it 'defines getters based on the passed attribute names' do
      Person.attribute_reader :name, :age
      person.instance_variable_set('@name', 'Sunny')
      person.instance_variable_set('@age', 24)
      expect(person.name).to eq('Sunny')
      expect(person.age).to eq(24)
    end
  end
  context '.attribute_writer' do
    it 'defines setters based on the passed attributes names' do
      Person.attribute_writer :name, :age
      person.name = 'Sunny'
      person.age = 24
      expect(person.instance_variable_get('@name')).to eq('Sunny')
      expect(person.instance_variable_get('@age')).to eq(24)
    end
  end
  context '.attribute_accessor' do
    it 'defines setters/getters based on the passed attribute names' do
      Person.attribute_accessor :name, :age
      person.name = 'Sunny'
      person.age = 24
      expect(person.name).to eq('Sunny')
      expect(person.age).to eq(24)
    end
  end
end
