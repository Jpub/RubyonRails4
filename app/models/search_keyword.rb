class SearchKeyword
  include ActiveModel::Model

  attr_accessor :keyword

  validates :keyword, presence: true
end
