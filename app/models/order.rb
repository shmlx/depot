class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  #PAYMENT_TYPES = ['Check', 'Credit card', 'Purchase order']
  #validates :pay_type, :inclusion => PAYMENT_TYPES

  PAYMENT_TYPES = [
    # Displayed                                     stored in db
    [ I18n.t("order.payment_types.cheque"),         "check" ],
    [ I18n.t("order.payment_types.credit_card"),    "cc" ],
    [ I18n.t("order.payment_types.purchase_order"), "po" ]
  ]

  validates :name, :address, :email, :pay_type, :presence => true
#  validates :pay_type, :inclusion => [ "check" , "cc" , "po" ]
  validate :pay_type, :pay_type_exists

  def pay_type_exists
      errors.add(:base, "Payment type must exist #{self.pay_type}") unless PayType.find_by_name(self.pay_type)
  end


  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
