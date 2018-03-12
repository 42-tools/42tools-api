class FriendsUser < ApplicationRecord
  belongs_to :owner,  class_name: 'FortyTwo::User'
  belongs_to :friend, class_name: 'FortyTwo::User'

  has_and_belongs_to_many :friends_groups, dependent: :destroy

  rails_admin do
    object_label_method :rails_admin_friend
  end

  private

  def rails_admin_friend
    friend.login
  end
end
