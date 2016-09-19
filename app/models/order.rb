class Order < ActiveRecord::Base
	validates :delivery_date, presence: true

end