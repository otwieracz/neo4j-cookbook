require_relative '../spec_helper.rb'

describe 'neo4j::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes the neo4j::java recipe' do
    expect(chef_run).to include_recipe('neo4j::java')
  end

  it 'creates neo4j log directory' do
    expect(chef_run).to create_directory('/var/log/neo4j')
  end

  context 'rhel package install' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe)
    end

    it 'creates neo4j auth file directory' do
      expect(chef_run).to create_directory('/usr/share/neo4j/data/dbms')
    end

    it 'creates neo4j data directory' do
      expect(chef_run).to create_directory('/var/lib/neo4j')
    end
  end

  context 'rhel tarball install' do
    it 'creates neo4j auth file directory' do
      expect(chef_run).to create_directory('/usr/local/neo4j/neo4j/data/dbms')
    end

    it 'creates neo4j data directory' do
      expect(chef_run).to create_directory('/var/lib/neo4j')
    end
  end

  context 'ubuntu package install' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
    end

    it 'creates neo4j auth file directory' do
      expect(chef_run).to create_directory('/var/lib/neo4j/data/dbms')
    end

    it 'creates neo4j data directory' do
      expect(chef_run).to create_directory('/var/lib/neo4j/data/graph.db')
    end
  end

  context 'ubuntu tarball install' do
    it 'creates neo4j auth file directory' do
      expect(chef_run).to create_directory('/usr/local/neo4j/neo4j/data/dbms')
    end

    it 'creates neo4j data directory' do
      expect(chef_run).to create_directory('/usr/local/neo4j/neo4j/data/graph.db')
    end
  end

end
