class Team < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :slug, uniqueness: { case_sensitive: false }

  after_validation :set_slug, only: [:create, :update]

  def to_param
    slug
  end

  private
    def set_slug
      self.slug = name.to_s.parameterize
    end 
end
