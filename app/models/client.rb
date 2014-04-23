class Client < ActiveRecord::Base
	validates :client_name, format: { with: /\A[A-Za-z0-9.&.\s]+\z/  , message: "Client name should contain only charactor or number" }
	validates :entprs_name, format: { with: /\A[a-zA-Z]+\Z/ , message: "Enterprise name should contain only charactor" }
end
