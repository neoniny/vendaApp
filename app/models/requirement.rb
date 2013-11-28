class Requirement < ActiveRecord::Base
  has_many :item_defs , :dependent => :destroy
  has_one :client
  #accepts_nested_attributes_for :item_defs, :allow_destroy => true, :reject_if => lambda { |a| a[:batch] != "price" }
  #accepts_nested_attributes_for :item_defs, :allow_destroy => true, :reject_if => previous_step
  attr_writer :current_step, :previous_step

  accepts_nested_attributes_for :item_defs, :allow_destroy => true

  def current_step
    @current_step || steps.first
  end
  
  def steps
   # %w[client batch standard itemdef confirm ]
    %w[client batch standard itemdef confirm ]
  end
    
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def item?
    current_step == "item"
  end

  # def check_array(attributed)
  #   attributed['transpot_type'] == session[:temp]
  # end
end
