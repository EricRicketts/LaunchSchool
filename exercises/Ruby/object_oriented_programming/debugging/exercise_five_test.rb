require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseFiveTest < Minitest::Test
class FileBroken
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{FORMAT}"
  end
end

class MarkdownFileBroken < FileBroken
  FORMAT = :md
end

class VectorGraphicsFileBroken < FileBroken
  FORMAT = :svg
end

class MP3FileBroken < FileBroken
  FORMAT = :mp3
end

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

  def test_one
    blog_post = MarkdownFileBroken.new('Adventures_in_OOP_Land')
    blog_post.write('Content will be added soon!'.bytes)

    copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

    assert_instance_of(MarkdownFileBroken, copy_of_blog_post)
    assert(copy_of_blog_post.read == blog_post.read)

    # the problem we have here is that the constant FORMAT is
    # being called from the superclass, since FORMAT is not defined
    # in the superclass it not known the constant/method lookup starts
    # with FileBroken and moves up from there to Object, Kernel, BasicObject
    assert_raises(NameError) { blog_post.to_s }
  end

  def test_two
    blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
    blog_post.write('Content will be added soon!'.bytes)

    copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

    assert_instance_of(MarkdownFile, copy_of_blog_post)
    assert(copy_of_blog_post.read == blog_post.read)

    assert_equal("Adventures_in_OOP_Land.md", blog_post.to_s)
  end

end