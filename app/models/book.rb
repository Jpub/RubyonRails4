class Book < ActiveRecord::Base
  scope :gihyo, -> { where(publish: '제이펍') }
  scope :newer, -> { order(published: :desc) }
  scope :top10, -> { newer.limit(10) }
  scope :whats_new, ->(pub) {
    where(publish: pub).order(published: :desc).limit(5)
  }
  # default_scope { order(published: :asc) }

  has_many :reviews
  has_and_belongs_to_many :authors
  has_many :users, through: :reviews
  #has_many :memos, as: :memoable



=begin
  validates :isbn,
    presence: true,
    uniqueness: true,
    # uniqueness: { allow_blank: true },
    length: { is: 17 },
    # length: { is: 17 , allow_blank: true },
    format: { with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/ }
    # format: { with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/, allow_blank: true }
    # isbn: true
    # isbn: { allow_old: true }
=end

=begin
  validates :isbn,
    presence: { message: '는 필수입니다.'},
    uniqueness: { allow_blank: true,
      message: '%{value}는 유일한 값이어야 합니다.' },
    length: { is: 17 , allow_blank: true,
      message: '%{value}는 %{count}자리어야 합니다.' },
    format: { with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/,
      allow_blank: true, message: '%{value}는 정확한 형식이 합니다.'}
=end

  # validate :isbn_valid?

=begin
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 100 }
=end

  # validates :title, uniqueness: { scope: :publish }

=begin
  validates :price,
    numericality: { only_integer: true, less_than: 10000 }

  validates :publish,
    inclusion:{ in: ['제이펍', '한빛미디어', '한빛아카데미', '인사이트', '길벗'] }
=end


  # after_destroy :history_book
  # after_destroy :history_book, unless: Proc.new { |b| b.publish == "unknown" }
  # after_destroy BookCallbacks.new

  # after_destroy do |b|
  #   logger.info('deleted: ' + b.inspect)
  # end

  private
  # def history_book
  #   logger.info('deleted: ' + self.inspect)
  # end


  def isbn_valid?
    errors.add(:isbn, '는 정확한 형식이 아닙니다.') unless isbn =~ /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/
  end

end
