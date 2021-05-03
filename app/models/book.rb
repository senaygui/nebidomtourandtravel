class Book < ApplicationRecord
  belongs_to :package

  before_save :update_subtotal

	def total_price
    self.package.price * self.quantity
  end

  
  private

  def update_subtotal
    self[:total_price] = total_price
  end
end
