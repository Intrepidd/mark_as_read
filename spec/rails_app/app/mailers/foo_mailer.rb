class FooMailer < ActionMailer::Base
  def foo
    @model = FooModel.first
    mail :to => 'foo@bar.com'
  end
end