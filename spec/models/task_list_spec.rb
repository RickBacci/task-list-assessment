require 'rails_helper'

RSpec.describe TaskList, type: :model do
  include DatabaseCleaner

  it 'has a title' do
    task = TaskList.new(title: 'title', description: 'description')
    expect(task.title).to be_eql('title')
  end
  it 'is required to have a title' do
    task = TaskList.new(title: '', description: 'description')

    expect(task.save).to be false
  end


  it 'has a description' do
    task = TaskList.new(title: 'test task list', description: 'description')

    expect(task.description).to eql('description')
  end


end

