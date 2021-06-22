class Store < ActiveRecord::Base
  has_many :employees

  validates :name, length: { minimum: 3}
  validates :annual_revenue, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def carries_mens_or_womens_apparel
    if !mens_apparel.present? && !womens_apparel.present?
      errors.add(:mens_apparel, 'either mens or womens apparel must be present')
      errors.add(:womens_apparel, 'either mens or womens apparel must be present')
    end
  end
end
