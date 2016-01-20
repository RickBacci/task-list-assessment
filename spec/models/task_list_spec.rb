require 'rails_helper'

RSpec.describe TaskList, type: :model do
  include DatabaseCleaner

  it 'has a title' do
    user = User.new(email: 'test@email.com', password: 'password')
    tasklist = user.task_lists.new(title: 'title', description: 'desc')
    expect(tasklist.title).to eq('title')
  end

  it 'title is not blank' do
    user = User.new(email: 'test@email.com', password: 'password')
    tasklist = user.task_lists.new(title: 'title', description: 'desc')
    tasklist.title = ''

    expect(tasklist.save).to be(false)
  end

  it 'has a unique title' do
    user = User.create!(email: 'test@email.com', password: 'password')
    tasklist  = user.task_lists.create!(title: 'title', description: 'desc')
    tasklist  = user.task_lists.new(title: 'title', description: 'desc')
    expect(tasklist.save).to be(false)
  end

  it 'has a description' do
    user = User.new(email: 'test@email.com', password: 'password')
    tasklist = user.task_lists.new(title: 'title', description: 'desc')
    expect(tasklist.description).to eq('desc')
  end
end

