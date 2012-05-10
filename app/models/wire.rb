class Wire < ActiveRecord::Base
  belongs_to :target_mind, foreign_key: 'target_mind_id', class_name: 'Mind'
  attr_accessible :caption, :cpx, :cpy
end
