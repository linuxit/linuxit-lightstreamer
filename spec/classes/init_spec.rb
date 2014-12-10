require 'spec_helper'
describe 'lightstreamer' do

  context 'with defaults for all parameters' do
    it { should contain_class('lightstreamer') }
  end
end
