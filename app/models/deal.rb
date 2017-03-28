class Deal < ActiveRecord::Base

  before_create :set_defaults

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :publish_date,presence:true, uniqueness: true
  validates :title,presence:true, :uniqueness => {:case_sensitive => false}

  validates_presence_of :price, :discounted_price

  def set_defaults
    self.is_live = false
    true
  end

end
