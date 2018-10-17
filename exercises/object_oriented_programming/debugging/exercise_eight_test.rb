require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseEightTest < Minitest::Test
  attr_accessor :task_manager_error, :task_manager

  class TaskManagerError
    attr_reader :owner
    attr_accessor :tasks

    def initialize(owner)
      @owner = owner
      @tasks = []
    end

    def add_task(name, priority=:normal)
      task = Task.new(name, priority)
      tasks.push(task)
    end

    def complete_task(task_name)
      completed_task = nil

      tasks.each do |task|
        completed_task = task if task.name == task_name
      end

      if completed_task
        tasks.delete(completed_task)
        "Task '#{completed_task.name}' complete! Removed from list."
      else
        "Task not found."
      end
    end

    def display_all_tasks
      display(tasks)
    end

    def display_high_priority_tasks
      tasks = tasks.select do |task|
        task.priority == :high
      end

      display(tasks)
    end

    private

    def display(tasks)
      str = "--------\n"
      tasks.each do |task|
        str << task.to_s.concat("\n")
      end
      str.concat("--------")
    end
  end

  class Task
    attr_accessor :name, :priority

    def initialize(name, priority=:normal)
      @name = name
      @priority = priority
    end

    def to_s
      "[" + sprintf("%-6s", priority) + "] #{name}"
    end
  end

  class TaskManager < TaskManagerError
    def display_high_priority_tasks
      high_priority_tasks = tasks.select do |task|
        task.priority == :high
      end

      display(high_priority_tasks)
    end
  end

  def setup
    @task_manager_error = TaskManagerError.new('Valentina')
    @task_manager = TaskManager.new('Valentina')
  end

  def test_one
    # the problem is subtil it occurs in line 42 of TaskManagerError#display_high_priority_tasks
    # since tasks is being assigned in that line, it immediately assumes the status of a local
    # variable, to call the setter would require self.tasks but this would introduce another bug
    # as the instance variable, @tasks, would be reassigned with the filtered version of the orignal
    # task list.
    #
    # since tasks is now a local variable taking assignemnt it will evaluate to nil, so when the
    # statement tasks.select executes, it is called #select on a nil object which has no #select
    #
    # this fix is easy, just rename the tasks local variable to something else, like high_priority_tasks
    # so when tasks.selct is called, and ruby does not find the local variable tasks, it then looks and
    # finds the getter method tasks.
    expected = <<-EXPECTED
--------
[high  ] pay bills
[normal] practice Ruby
[low   ] run 5k
--------
EXPECTED
    task_manager_error.add_task('pay bills', :high)
    task_manager_error.add_task('read OOP book')
    task_manager_error.add_task('practice Ruby')
    task_manager_error.add_task('run 5k', :low)

    task_manager_error.complete_task('read OOP book')

    assert_equal(expected.chomp, task_manager_error.display_all_tasks)
    assert_raises(NoMethodError) { task_manager_error.display_high_priority_tasks }
  end

  def test_two
    expected = <<-EXPECTED
--------
[high  ] pay bills
--------
EXPECTED
    task_manager.add_task('pay bills', :high)
    task_manager.add_task('read OOP book')
    task_manager.add_task('practice Ruby')
    task_manager.add_task('run 5k', :low)

    task_manager_error.complete_task('read OOP book')
    assert_equal(expected.chomp, task_manager.display_high_priority_tasks)
  end
end

=begin
When attempting to invoke the tasks getter method on line 35 in the code tasks.select, we are unintentionally referencing a local variable tasks.
Since it has not yet been assigned a value, its value is nil, as reflected by the error message.

In more detail, what happens is the following. On line 35, Ruby first has to disambiguate the tasks name on the left-hand side of the assignment operator.
It could in principle be either local variable assignment, or an invocation of the setter method. In this case, Ruby interprets it as local variable assignment.
Recall that if we intended to invoke the tasks= setter method, we would need to use self to disambiguate from local variable assignment (self.tasks=).
Next, Ruby must disambiguate the reference to tasks on the right-hand side of the assignment operator, seen in the code tasks.select. At this point, the getter method
tasks is shadowed by the local variable that was just initialized on the left side of the assignment operator. You can see this shadowing at work also in the private
display method, where tasks in the method body refers to the method parameter, not the getter method.

As a result, both references to tasks on line 35 are interpreted as a local variable. This means that we initialize a local variable, and on the same line reference
it via tasks.select, before it has been assigned a value. Invoking the select method on nil caused the error we see.

In order to disambiguate this code so that Ruby will execute it as we intend, we best give our local variable a unique name, such as high_priority_tasks.
This way it does not shadow the getter method. This is also in line with the Ruby style guide, which advises to "avoid shadowing methods with local variables
unless they are both equivalent."
=end