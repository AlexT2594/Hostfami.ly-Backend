class UserSerializer < ActiveModel::Serializer
  attributes :firstname, :lastname, :email, :utype
end
