require 'attr_accessor_with_history'
require 'byebug'

class TestClass1
  attr_accessor_with_history :foo
end
class TestClass2
  attr_accessor_with_history 'foo'
end

describe '#attr_accessor_with_history', :pending => true do
  shared_examples 'all cases' do
    it 'should define getter and setter' do
      @subject.foo = 'xyz'
      expect(@subject.foo).to eq('xyz')
    end
    it 'setter should return value set to xyz' do
      expect(@subject.foo = 'xyz').to eq('xyz')
    end
    it 'should work if getter used first' do
      expect(@subject.foo_history).to be_nil
    end
    it 'should work if setter used first' do
      @subject.foo = 'x'
      @subject.foo = 'y'
      expect(@subject.foo_history).to eq([nil, 'x'])
    end
    it 'should remember values' do
      @subject.foo
      @subject.foo = 3
      @subject.foo = 'x'
      expect(@subject.foo_history).to eq([nil, 3])
    end
  end
  describe 'when a symbol is passed' do
    before(:each) { @subject = TestClass1.new }
    include_examples 'all cases'
  end
  describe 'when a string is passed' do
    before(:each) { @subject = TestClass2.new }
    include_examples 'all cases'
  end
  it 'should remember history separately for each instance' do
    obj1 = TestClass1.new
    obj2 = TestClass1.new
    obj1.foo = :x ; obj1.foo = :y
    obj2.foo = 1  ; obj2.foo = 2
    expect(obj1.foo_history).to eq([nil, :x])
    expect(obj2.foo_history).to eq([nil, 1])
  end
end
