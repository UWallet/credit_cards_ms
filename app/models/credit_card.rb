class CreditCard < ApplicationRecord
  #default_scope {order("CreditCard.created_at ASC")}
  scope :order_by_name, -> (type) {order("CreditCard.user_id  #{type}")}
  validates :number, :amount, :expiration_year, :expiration_month, :user_id, presence: {message: "Este atributo no puede estar vacio"}
  validates :number, uniqueness: {message: "La tarjeta ya se encuentra registrada"}
  validates :amount, numericality: {:greater_than => -1,message: "El valor tiene que ser mayor a 0"}
  #{ with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :number, format: { with: /[0-9]+/,  message: "El numero de la tarjeta no puede tener letras" }
  #validates_format_of :number, :with =>  /[0-9]+/ {message: "El numero de la tarjeta no puede tener letras"}
  validates :number, length: { in: 14..20, message: "El numero de la tarjeta debe tener entre 15 y 20 caracteres"}
  validates :expiration_month, numericality: {:greater_than => 0, :less_than => 13, message: "Numero de mes invalido"}
  validates :expiration_year, numericality: {:greater_than => 2016, :less_than => 2101, message: "Año invalido"}

  #validates :number, numericality: {:greater_than => 99999999999999, :less_than => 10000000000000000000, message: "Must have at least 15 digits and lest than 20"}

  #def self.load_credit_cards(page = 1, per_page = 10)
  #  includes()
  #    .paginate(:page => page, :per_page => per_page)
  #end
  #def self.credit_cards_by_id(id,columns)
  #  columns=columns ? columns+",credit_cards.*"
  #  .select(columns)
  #    .find_by_id(id)
  #end
  def self.credit_cards_by_user_id(user)
    #CreditCard.find_by user_id: user
    CreditCard.all.where(user_id: user.to_i)
  end
  #def self.credit_cards_by_number(number)
  #  columns=columns ? columns+"credit_cards.*"
    #load_credit_cards(page,per_page)
  #  .select(columns)
  #    .where('credit_cards.number = ?', number)
  #end

end
