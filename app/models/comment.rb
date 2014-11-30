class Comment < ActiveRecord::Base
  belongs_to :article 
  validates :commenter, presence: true, length: { minimum: 1}
  validates :body, presence: true, length: { minimum: 1}
  # Note: implement feature to show user errors if they
  # cannot create comment!!!
end
