class User < ApplicationRecord
  enum role: { admin: "admin", funcionario: "funcionario", candidato: "candidato", empregador: "empregador" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
