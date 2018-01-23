class User < ApplicationRecord
  has_many :apps_tokens, dependent: :destroy
  has_many :groups_users, dependent: :destroy
  has_many :coalitions_users, dependent: :destroy
  has_many :campus_users, dependent: :destroy
  has_many :cursus_users, dependent: :destroy
  has_many :projects_users, dependent: :destroy
  has_many :friends_users, foreign_key: :owner_id, dependent: :destroy
  has_many :friends_groups, foreign_key: :owner_id, dependent: :destroy

  has_many :apps, through: :apps_tokens
  has_many :groups, through: :groups_users
  has_many :campus, through: :campus_users
  has_many :cursus, through: :cursus_users
  has_many :projects, through: :projects_users
  has_many :friends, through: :friends_users
  has_many :logs, through: :apps_tokens

  rails_admin do
    object_label_method :login
  end
end
