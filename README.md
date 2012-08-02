# A Web Application for Avdi and Uncle Bob

Inspired by [Avdi Grimm's Objects on Rails](http://dev.blog.avdi.org), and further inspired by [Bob Martin's](http://cleancoders.com) impressive keynote at Ruby Midwest 2011,
entitled [Architecture the Lost Years](http://support.iawriter.com/help/kb/frequently-asked-questions-in-general/markdown-syntax-reference-guide),
I undertook to develop a web appliction (a freaking blog) based upon Avdi's book, but with an eye toward putting the application architecture at the highest
level, and reducing the communication and persistence layers to "mere details."

The idea is that virtually any mode of persistence and any mode of web communication (or heck even a console applicaiton) should be plugged in with minimal
difficulty.  In this way, the business elements can be specified, developed and tested in isolation.

# Other Inspiration

I acknowledge and draw inspiration from many sources. I am grateful to the works of [Corey Haines](http://coreyhaines.com), [Gary Bernhardt](https://www.destroyallsoftware.com) who got me on this path. As mentioned, Uncle Bob's prolific writing, lecturing and advocacy has been a particular inspiriation.  [Clean Code](http://cleancoders.com)

Two particular experiments in this area informed my thoughts and work:

* [Jason Roelofs' **Raidit**](https://github.com/jasonroelofs/raidit)
  
Raidit is a reasonably complex application built within a rails app, adding an interactors folder and placing entities in the Rails model directory.  Entities are built out in some cases as ActiveModel objects.
    
* ** [Piotr 'Qertoip' Włodarek's **Guru Watch**](https://github.com/qertoip/guru_watch)
  
The application is more modest than Raidit, but the extraction from rails is a tour de force.  He uses UseCases in lieu of Interactors, and some other terminology, but the application builds nicely in rails and runs in memory as well.  He retains ActiveSupport and also uses ActiveModel (actually ActiveAttr) in his mainline.  Also expressly separates pieces of rails, using ActiveRecord on the repository side, and ActionPack on the "Web" side.  He seems to be building up a more elaborate persistence framework akin to a full DDD repository.

# General Approach

Happily, most ruby-based communication frameworks based on the web are implemented using rack.  Thus, we can completely develop our business objects at the top level of the application folder.  Conventionally, I define a top level "application.rb" for require-ing the application objects, and then place the ENTIRE web framework in a top-level folder, denominated <z_[framework]>.  A rackup file with a corresponding name <z_[framework].ru> runs a rack object defined in main.rb, a file at the top level of the framework folder.  main.rb, in turn, requires the application and then whatever is required by the framework to respond to a web request, performing application-specfic configuration and wiring.

In this way, the framework depends upon the application, rather than the other way around.  Likewise, the application should be refactored so that an arbitratry persistence solution can be wired in much the same way.

# Plea for Guidance

Please, please, please, communicate if you are interested in this approach -- its time we started organizing our thoughts to see if this makes any sense at all.  I'm emotionally committed to this approach as, at least in Greenfield, the initial app development (and TDD!) goes SOOOOO smoothly.

Andrew Greenberg (wizardwerdna@gmail.com)
