require 'rails_helper'

RSpec.describe Task, type: :model do
  include DatabaseCleaner

  it 'must have a title' do
    task = Task.new(title: 'hello', notes: 'none', start: Date.new, due:Date.new + 1)

    expect(task.save)
    task.title = ''
    expect(task.save).to be(false)
  end

  it 'has a status' do
    task = Task.new(title: 'hello', notes: 'none', start: Date.new, due:Date.new + 1)

    expect(task.status).to eq('incomplete')
  end

  it 'has a note field' do
    task = Task.new(title: 'hello', notes: 'none', start: Date.new, due:Date.new + 1)

    expect(task.notes).to eql('none')
  end

  it 'has a start date' do
    start_date = Date.new
    due_date   = Date.tomorrow

    task       = Task.new(title: 'hello',
                          notes: 'none',
                          start: start_date,
                          due: due_date)

    expect(task.start).to be_instance_of(Date)
    expect(task.due).to be_instance_of(Date)
    expect(task.start).to eq(start_date)
    expect(task.due).to eq(due_date)
  end

  it 'has a start date in the present' do
    start_date = Date.today + 1
    due_date   = Date.today + 2

    task       = Task.new(title: 'test',
                          notes: 'none',
                          start: start_date,
                          due: due_date)

    expect(task.save!).to eq(true)

    task.start = Date.today - 2

    expect(task.save).to eq(false)
  end

  it 'has a due date' do
    start_date = Date.today
    due_date   = Date.today + 2

    task       = Task.new(title: 'hello',
                          notes: 'none',
                          start: start_date,
                          due: due_date)

    expect(task.due).to be_instance_of(Date)
    expect(task.due).to eq(due_date)
  end

  it 'has a due date after the start date' do
    start_date = Date.today
    due_date   = Date.tomorrow

    task       = Task.new(title: 'hello',
                          notes: 'none',
                          start: start_date,
                          due: due_date)

    expect(task.save!).to eq(true)
  end

  it 'status is complete or incomplete' do
    start_date = Date.today
    due_date   = Date.today + 2
    task       = Task.create(title: 'hello', notes: 'none', start: start_date, due: due_date)

    expect(task.status).to eq('incomplete')

    task.complete!

    expect(task.complete?)
  end

end

