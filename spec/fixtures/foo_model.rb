class FooModel
  include MarkAsRead::Readable
  extend ActiveModel::Naming

  attr_accessor :id
end