# README


## Welcome to your Who's Who in the 116th Congress!

NOTE: this app has two Github repositories. This one is for the Rails API (back_end); the other repo is for the React-Redux front_end. (Link in instructions below.)

You can use this web app to search and sort all 542 members of the 116th United States Congress.

Just click on House or Senate, and then use the sort buttons or search field. It's fun to check out who missed the most votes!

Each member's card shows her full contact information, including social media accounts and a website link.

Future versions of this app will include information on who belongs to what committee, and which bills they are sponsoring. I would also like to add a quiz element. For instance, I can I can remove the senator's name from the front of the card and see if you can guess who's who!

I hope you can use this free app to learn more about Congress.


## Blog Posts



## Videos

Here is a walkthrough video



## Usage

To run this program,
1. clone this repo, then run 'bundle install'.
2. run rails db:create, rails db:migrate and rails db:seed to seed the database.

3. After the database is set up, run 'rails s' in terminal to start the rails server.

4. Navigate to http://localhost:3000/ in your browser. You should see a JSON-formatted list of all Congress members.

5. clone the front-end from here: https://github.com/joanrig/congress_front_end.

6. Run npm install and npm start to run the front_end.
You will be asked if you would like to run the program on another server. Type "Y" for Yes.

Your browser will automatically launch the Who's Who in Congress app to its home page.

You can shut down both servers by typing Control C in the terminal window where they are running.



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/space_missions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The web app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## Code of Conduct

Everyone interacting in the SpaceMissions project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/space_missions/blob/master/CODE_OF_CONDUCT.md).
