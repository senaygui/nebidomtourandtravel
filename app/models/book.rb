class Book < ApplicationRecord
  belongs_to :package

  before_save :update_subtotal
  before_create :randomize_id


	def total_price
    self.package.price * self.quantity
  end

  
  private

  def update_subtotal
    self[:total_price] = total_price
  end

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Book.where(id: self.id).exists?
  end
end
