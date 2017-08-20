class Buyer < ApplicationRecord
  scope  :by_status,  ->(s){  where( :status  =>  s )  }
  scope  :by_ticket,  ->(t){  where( :ticket_id  =>  t ) }
  
  STATUS  =  ["pending", "confirmed"]
  validates_inclusion_of   :status,  :in  =>  STATUS
  validates_presence_of  :status,  :ticket_id

  belongs_to  :movie
  belongs_to  :ticket
  belongs_to  :user, :optional  =>  true

  before_validation  :generate_uuid,  :on  =>  :create

  def  to_param
    self.uuid
  end

  protected

  def   generate_uuid
    self.uuid  =  SecureRandom.uuid
  end

end
