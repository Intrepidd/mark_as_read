# mark_as_read

This gem allows you to be notified when one of your users reads an e-mail you sent to him via a tracking gif.
It's compatible with ruby on rails and any ORM that implements ``find`` and has an ``id`` field for its models.

## Installation

Add this line to your application's Gemfile:

    gem 'mark_as_read'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mark_as_read

## Usage

Let's say you have a ``Message`` class, simply add the following to describe the behavior to execute when a message is read:

    class Message < ActiveRecord::Base

      include MarkAsRead::Readable

      mark_as_read do |message|
        message.update_attributes(:read => true)
      end

    end

The read message is yielded to the ``mark_as_read`` function so you can do anything you want on it.


Then, in your mailer view, you just have to add the tracking image, let's assume you have the message in the ``@message`` variable :

    <%= mark_as_read_img(@message) %>
    
## Disclaimer

Tracking email openings with an image is not an exact science, depending on the client, the image may not been displayed unless the user asks for it.

Many clients will cache the image after its first load so it won't be loaded again, this gem is useful for knowing IF an e-mail has been opened, not really for knowing how many times.


## Contributing

1. Fork it ( http://github.com/Intrepidd/mark_as_read/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
