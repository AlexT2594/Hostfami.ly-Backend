class UserSerializer < ActiveModel::Serializer
  attributes :firstname, :lastname, :email, :type
end
