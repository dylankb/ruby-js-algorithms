require_relative 'queue'
require_relative 'node'

describe "Queue" do
  it "should be able to enqueue an item and view the top item" do
    queue = Queue.new
    queue.enqueue(1)
    expect(queue.peek.data).to equal(1)
  end

  it "should be able to enqueue multiple items and return the top item" do
    queue = Queue.new

    queue.enqueue(2)
    queue.enqueue(1)

    expect(queue.peek.data).to equal(2)
  end

  it "should pop off the top item" do
    queue = Queue.new

    queue.enqueue(2)
    queue.enqueue(1)

    expect(queue.dequeue.data).to equal(2)
  end

  it "should return a detached item" do
    queue = Queue.new

    queue.enqueue(1)
    queue.enqueue(2)

    expect(queue.dequeue.next).to be_nil
  end

  it "should be empty once fully dequeued" do
    queue = Queue.new
    queue.enqueue(1)
    queue.dequeue

    expect(queue.empty?).to eq(true)
  end
end
