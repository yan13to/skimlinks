require 'spec_helper'

describe Skimlinks::ProductApi do
  use_vcr_cassette

  before do
    Skimlinks.configuration.api_key = '85399dc089e6baf58e1d664670f4614e'
  end

  describe '#categories' do
    it 'returns a hash' do
      Skimlinks::ProductApi.categories.should be_an_instance_of(Hash)
    end
  end

  describe '#nested_categories' do
    it 'returns a hash' do
      Skimlinks::ProductApi.nested_categories.should be_an_instance_of(Hash)
    end
  end

  describe '#products' do
    it 'returns an array of Skimlinks::Product objects' do
      products = Skimlinks::ProductApi.products(query: 'justin bieber')
      products.should be_an_instance_of(Array)
      products.should be_all { |product| product.is_a?(Skimlinks::Product) }
    end
  end

  describe '#product_count' do
    it 'returns an integer' do
      Skimlinks::ProductApi.product_count(query: 'justin bieber').should be_an_instance_of(Fixnum)
    end
  end
end