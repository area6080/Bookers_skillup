class Relationship < ApplicationRecord
  
  belongs_to :follower,class_name: "User"
  belongs_to :followed,class_name: "User"
  
end
  # 外部キーとテーブル名は一致していないといけないので