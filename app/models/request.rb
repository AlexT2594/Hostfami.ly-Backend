class Request < ApplicationRecord
	belongs_to :student
	belongs_to :family, :foreign_key => 'family_id' 
end
