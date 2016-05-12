class Post < ActiveRecord::Base
  validates_presence_of :body, :guest_name

  def hometown=(town)
    (!town.kind_of?(String) || town.empty?) ? super("unknown") : super(town)
  end
end
