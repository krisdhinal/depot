Product.delete_all
puts "===== data has been deleted all. ====="

Product.create(
    title: 'Ruby on Rails Paradigm',
    description:
        %{<p>
            <em>Responsive, Intuitive Interfaces with Ruby</em>
            The next step in the evolution of user interfaces is here.
            Chatbots let your users interact with your service in their
            own natural language. Use free and open source tools along
            with Ruby to build creative, useful, and unexpected interactions
            for users. Take advantage of the Lita framework’s step-by-step
            implementation strategy to simplify bot development and testing.
            From novices to experts, chatbots are an area in which everyone
            can participate. Exercise your creativity by creating chatbot
            skills for communicating, information, and fun.
        </p>},
    image_url: 'ruby.jpg',
    price: 20.00
)

puts "==== the data has been created ===="