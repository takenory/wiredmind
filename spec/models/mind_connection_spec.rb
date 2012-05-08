require 'spec_helper'

describe MindConnection do
  describe 'associations' do
    before do
      @mind_count = 5
      @base_mind = Mind.create(name: "base_mind")
      @target_minds = @mind_count.times.collect {|i| Mind.create(name: "mind_#{i}")}
      @mind_connections = @target_minds.collect do |mind|
        connection = MindConnection.new
        connection.base_mind_id = @base_mind.id
        connection.target_mind_id =  mind.id
        connection.save
        connection
      end
    end
    it 'MindConnection#target_mind return an instance of Mind' do
      @mind_connections.each do |mind_connection|
        mind_connection.target_mind.should be_instance_of(Mind)
      end
    end
  end
end
