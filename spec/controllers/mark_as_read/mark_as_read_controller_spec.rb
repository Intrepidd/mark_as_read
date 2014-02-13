require 'spec_helper'
require 'fixtures/foo_model'
require 'fixtures/bar_model'

describe MarkAsRead::MarkAsReadController do

  before do
    verifier = ActiveSupport::MessageVerifier.new(Rails.application.config.secret_key_base)
    @id = verifier.generate(42)
  end

  it 'should raise if invalid type is provided' do
    expect {
      get :read, :type => 'notatype', :id => @id
    }.to raise_error(MarkAsRead::UnknownType)
  end

  it 'should raise if not model type is provided' do
    expect {
      get :read, :type => 'Fixnum', :id => @id
    }.to raise_error(MarkAsRead::InvalidType)
  end

  it 'should raise if not mark as read model type is provided' do
    BarModel.stub(:find).and_return(BarModel.new)
    expect {
      get :read, :type => 'BarModel', :id => @id
    }.to raise_error(MarkAsRead::InvalidType)
  end

  it 'should mark the model as read if everything is alright' do
    model = FooModel.new
    model.id = 42

    FooModel.should_receive(:find).with(42).and_return(model)
    proc = lambda { |model| }
    FooModel.class_eval do
      mark_as_read(&proc)
    end

    proc.should_receive(:call).with(model)


    get :read, :type => 'FooModel', :id => @id

  end

  it 'should raise ActiveSupport::MessageVerifier::InvalidSignature if bad message' do
    FooModel.stub(:find).and_return(nil)
    expect {
      get :read, :type => 'FooModel', :id => 'foobar'
      }.to raise_error(ActiveSupport::MessageVerifier::InvalidSignature)
  end

end