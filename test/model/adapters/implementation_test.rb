require 'test_helper'

describe Lotus::Model::Adapters::Implementation do
  before do
    TestAdapter = Class.new(Lotus::Model::Adapters::Abstract) do
      include Lotus::Model::Adapters::Implementation
    end

    mapper   = Object.new
    @adapter = TestAdapter.new(mapper)
  end

  after do
    Object.send(:remove_const, :TestAdapter)
  end

  it 'must implement #_collection' do
    -> {
      @adapter.send(:_collection, :x)
    }.must_raise NotImplementedError
  end
end
