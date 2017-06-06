class UserSerializer < ActiveModel::Serializer
  attributes :type, :firstname, :lastname, :email, :birthday, :state, :city, :address, :gender
end
