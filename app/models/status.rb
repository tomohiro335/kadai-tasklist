class Status < ActiveRecord::Base
  def self.status_choices
    [["未着手","not yet"], 
      ["進行中","now work"], 
      ["完了","completed"]]
  end
end
