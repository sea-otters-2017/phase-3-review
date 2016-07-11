class Post < ActiveRecord::Base
  validates_presence_of :body, :guest_name
end
