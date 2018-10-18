require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseNineTest < Minitest::Test
  class Mail
    def to_s
      "#{self.class}".gsub(/[[:alnum:]]+::/,'')
    end
  end

  class Email < Mail
    attr_accessor :subject, :body

    def initialize(subject, body)
      @subject = subject
      @body = body
    end
  end

  class Postcard < Mail
    attr_reader :text

    def initialize(text)
      @text = text
    end
  end

  module Mailing
    def receive(mail, sender)
      mailbox << mail unless reject?(sender)
    end

    # Change if there are sources you want to block.
    def reject?(sender)
      false
    end

    def send(destination, mail)
      "Sending #{mail} from #{name} to: #{destination}"
      # Omitting the actual sending.
    end
  end

  class CommunicationsProvider
    attr_reader :name, :account_number

    def initialize(name, account_number=nil)
      @name = name
      @account_number = account_number
    end
  end

  class EmailService < CommunicationsProvider
    include Mailing

    attr_accessor :email_address, :mailbox

    def initialize(name, account_number, email_address)
      super(name, account_number)
      @email_address = email_address
      @mailbox = []
    end

    def empty_inbox
      self.mailbox = []
    end
  end

  class TelephoneService < CommunicationsProvider
    def initialize(name, account_number, phone_number)
      super(name, account_number)
      @phone_number = phone_number
    end
  end

  class PostalService < CommunicationsProvider
    attr_accessor :street_address, :mailbox

    def initialize(name, street_address)
      super(name)
      @street_address = street_address
      @mailbox = []
    end

    def change_address(new_address)
      self.street_address = new_address
    end
  end

  class CommunicationsProviderCorrect
    include Mailing
    attr_reader :name, :account_number

    def initialize(name, account_number=nil)
      @name = name
      @account_number = account_number
    end
  end

  class PostalServiceCorrect < CommunicationsProviderCorrect
    attr_accessor :street_address, :mailbox

    def initialize(name, street_address)
      super(name)
      @street_address = street_address
      @mailbox = []
    end

    def change_address(new_address)
      self.street_address = new_address
    end
  end

  module MailingLS
    def receive(mail, sender)
      mailbox << mail unless reject?(sender)
    end

    # Change if there are sources you want to block.
    def reject?(sender)
      false
    end

    def send_mail(destination, mail)
      "Sending #{mail} from #{name} to: #{destination}"
      # Omitting the actual sending.
    end
  end

  class PostalServiceLS < CommunicationsProvider
    include MailingLS
    attr_accessor :street_address, :mailbox

    def initialize(name, street_address)
      super(name)
      @street_address = street_address
      @mailbox = []
    end

    def change_address(new_address)
      self.street_address = new_address
    end
  end

  def test_one
    rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
    johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
    johns_postal_service  = PostalService.new('John', '47 Sunshine Ave.')
    ellens_postal_service = PostalService.new('Ellen', '860 Blackbird Ln.')

    assert_raises(NoMethodError) { johns_postal_service.send(ellens_postal_service.street_address, Postcard.new('Greetings from Silicon Valley!')) }
  end

  def test_two
    rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
    johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
    johns_postal_service  = PostalServiceCorrect.new('John', '47 Sunshine Ave.')
    ellens_postal_service = PostalServiceCorrect.new('Ellen', '860 Blackbird Ln.')

    expected = "Sending Postcard from John to: 860 Blackbird Ln."
    results = johns_postal_service.send(ellens_postal_service.street_address, Postcard.new('Greetings from Silicon Valley!'))
    assert_equal(expected, results)
  end

  def test_three
    # this is a much better solution because it addresses the accidental override.  Note I am calling a Mailing#send method but this is not
    # good practice because it overrides Object#send so I need to rename it to a name which does not provide name collisions, like Mailing#send_mail.
    # In test one, since Module Mailing was not included in PostalService, but it was incorrectly included in EmailService, thus the method lookup
    # chain took us to Object#send which expects a method as an argument, not a string.

    # so we need to move the include statement from EmailService to PostalService and rename the method to 
    rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
    johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
    johns_postal_service  = PostalServiceLS.new('John', '47 Sunshine Ave.')
    ellens_postal_service = PostalServiceLS.new('Ellen', '860 Blackbird Ln.')

    expected = "Sending Postcard from John to: 860 Blackbird Ln."
    results = johns_postal_service.send_mail(ellens_postal_service.street_address, Postcard.new('Greetings from Silicon Valley!'))
    assert_equal(expected, results)
  end
end