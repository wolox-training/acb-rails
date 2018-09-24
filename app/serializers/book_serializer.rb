class BookSerializer < ActiveModel::Serializer
  attributes :id, :gender, :author, :title
end
