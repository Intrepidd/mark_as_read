require 'spec_helper'
require 'fixtures/foo_model'

describe MarkAsRead::Readable do

  describe '#mark_as_read' do
    it 'should store the proc' do
      proc = lambda { puts "Hello world" }
      FooModel.class_eval do
        mark_as_read(&proc)
      end

      FooModel.mark_as_read_proc.should == proc
    end
  end

  describe '#mark_as_read!' do
    it 'should call the proc' do
      proc = lambda { puts "Hello world" }
      FooModel.class_eval do
        mark_as_read(&proc)
      end

      instance = FooModel.new
      proc.should_receive(:call).with(instance)
      instance.mark_as_read!
    end
  end

end