class User < ApplicationRecord
  # Include devise modules. Others available are: :omniauthable, :confirmable, :lockable, :timeoutable
  devise(
    :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  )
end
