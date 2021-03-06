require_relative '../spec_helper'

describe 'w_varnish::monit' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'includes recipe monit' do
    expect(chef_run).to include_recipe('monit')
  end

  it 'run resource monit_monitrc' do
    expect(chef_run).to add_monit_config('varnish')
  end

end