class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :addresses,dependent: :destroy

  validates :first_name, :last_name, :first_name_kana, :last_name_kana,
            :address, :telephone_number, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  validates :telephone_number, numericality: { only_integer: true }


  enum is_deleted: { "in_use": false, "withdrawal": true }

  def full_name #苗字と名前をくっつけるメソッド
    self.first_name + " " + self.last_name
  end

  def full_name_kana #カナ妙とカナ名をくっつけるメソッド
    self.first_name_kana + " " + self.last_name_kana
  end

end
