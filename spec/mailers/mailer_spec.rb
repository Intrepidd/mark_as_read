require 'spec_helper'
require 'fixtures/foo_model'

describe FooMailer do
  it 'should include a link to the image' do
    model = FooModel.new
    model.id = 42
    FooModel.stub(:first).and_return model
    verifier = ActiveSupport::MessageVerifier.new(Rails.application.config.secret_key_base)
    FooMailer.foo.body.to_s.should include("example.com/mark_as_read/FooModel/#{verifier.generate(model.id)}.gif")
  end
end