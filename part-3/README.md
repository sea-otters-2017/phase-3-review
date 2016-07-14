# Part 3: Build a CRUD App

## Summary

In Part 3 of the assessment, you'll build a web-stack application:  controllers, views, user authentication, database migrations, model validations, associations, etc.  Even a little bit of CSS.  This is an opportunity to demonstrate your proficiency in the core skills from Phase 2.


### Completing Part 3
Part 3 is the final part of the Phase 2 assessment.  If Parts 1 and 2 are finished, devote the rest of the day to completing as much of this application as possible.  The assessment might end before the entire application is built.  If time is running out and it looks like the app will not be completed, continue to work through the releases in order and make as much progress as you can.  Use your time wisely:  if you're stuck,  ask questions and get help.


### Web Application Overview
We'll be building a simplified version of a blind auction site—in a blind
auction, bidders do not see how much other bidders have bid.  Users will be able to register with the site, list items for auction, bid on items, etc.  We'll build the site one feature at a time.  The requirements for each feature are described in more detail in the *Releases* section.


## Releases
The releases describe features to build out in your web application.  Each release will describe what to build, not how to build it.  Apply best practices.  For example, the releases contain mockups of the application.  In the mockups, the URLs are omitted from the browser's address bar.  You should determine the appropriate path for each page based on the conventions / patterns you've learned in Phase 2.


### Pre-release: Setup
Make sure that everything is set up before we begin working on the application: install any necessary gems and create the database.  From the command line, navigate to the `part-3` directory of the Phase 2 assessment.  Once there, run ...

0. `$ bundle`
0. `$ bundle exec rake db:create`


### Release 0: User Registration
The first feature to build is user registration, which allows users to create new accounts.  What are best practices for user registration?  What routes do you need?  How can you keep user data safe?

On the homepage, add a "register" link.  Clicking the link takes the user to a page with a form for creating a new account.  Users must register with an e-mail address, a username, and a password.  The e-mail address and username must be unique.

If registration is unsuccessful, the user should see the registration form and the associated error messages.  If registration is successful, the user should be considered logged in and redirected to the homepage where the "register" link is replaced with the user's username.  This is demonstrated in Figure 1.

![registration mockup](readme-assets/registration.gif)  
*Figure 1*. Registering unsuccessfully and then successfully.


### Release 1: Login/Logout

#### Login

_Given:_

* There is a previously registered user
* User is not currently logged in:

1. On the home page, create a link to login.
1. When a user clicks on this link they should be taken to a page with a form to
   enter their credentials.

![login home](../part-3/mockups/login.png)

1. If the credentials match, the user should be taken back to the homepage and the
   login link should be replaced with a logout link.

![login error](../part-3/mockups/login_error.png)

1. If the credentials do not match, the user should see the login form and an
   error message stating the credentials were not valid.

#### Logout

Given there is a previously registered user and they are currently logged in:

1. On the home page, create a link to logout.
1. When the user clicks on the logout link they should be taken to the home page
   and the links "Register" and "Login" should both be visible.

### Release 2: CRUD'ing a Resorouce

The user's profile page is where users are able to manage their listed items.
We'll start off by giving them the ability to add an item and then work through
the remaining CRUD actions.

#### Creating Items

_Given:_

* The registered user is signed in:

1. On the home page create a link to the user's profile page.
1. When the user clicks on the profile link they should be taken to their profile page.

![profile 1](../part-3/mockups/profile_1.png)

1. Create a link on this page to add an item to the auction site. The item
   should include things like a name and/or title, description, when the user
   would like the auction to start and when it should stop.

![add auction error](../part-3/mockups/add_auction_error.png)

*Note*: When creating and or editing an item, you'll need to create forms that
allow you to enter dates. The HTML5 datetime input type is tricky to use with
ActiveRecord. Consider using something like `<input type="text"
name="my-date">` in the markup. When filling in the field, use the `YYYY-MM-DD`
or `YYYY-MM-DD HH:MM:SS` format (e.g. 2015-04-01 14:30:00).

After submitting an item, the user should be back on their profile page.

#### Reading Items

_Given:_

* The registered user is signed in
* There exist previously-created items

1. Create a section on the profile page to display all the items. This section
   should _not_ include the long form description of the item.

![add auction error](../part-3/mockups/profile_2.png)

#### Updating Items

_Given:_

* The registered user is signed in
* There exist previously-created items; some owned by the logged-in user,
  others not

1. On the profile page, create an edit link associated to each of the items the
   user has created. This link should only be visible if the user logged in is the
   user that created the item. For example, if Eve is visiting Bob's profile, she
   should not be able to edit Bob's items.
1. When the user clicks the edit link associated to the item, they should be
   taken to a page to edit that item's details. After submitting this information
   the user should be taken back to their profile page and see the item's updates
   should be reflected on the page.

![add auction error](../part-3/mockups/edit_auction.png)

#### Deleting Items

_Given_

* The registered user is signed in
* There exist previously-created items; some owned by the logged-in user,
  others not

1. On the profile page, create a delete button associated to each of the items
   the user has created. Just like in the update section, this button should only be
   visible if the user logged in is the user that created the item.
1. When the user clicks the delete button, the user profile page should reload and
   the item should no longer be visible.

#### Apply Responsible Behavior Per User and Route

Look back on the work you've done in this release. Use your best judgment (and
be prepared to defend your choices!) about what level of security is
appropriate and implement that in the code.

Ask yourself:

* Must a user be logged in to view all items?
* Should an authenticated user be able to view another user's items?
* Who should be able to delete or create an item? Can anyone? Must you be
  logged in?

Make the appropriate code changes to support a responsible set of interactions.

### Release 3: Bidding

Up until now, the home page has largely just contained links to allow the user
to register or login, or if they were logged in, to logout. Now that users have
the ability to create items for others to bid on, let's start filling in the
homepage.

#### Viewing Active Items

_Given_

* The registered user is signed in
* There exist previously-created items; some owned by the logged-in user,
  others not
* There exist items which are active

Create a section on the home page to list the items that are currently
available and active. To clarify, active means the items have start date on or
before today and the end date is on or after today.

#### Creating a Bid

_Given_

* The registered user is signed in
* There exist previously-created items; some owned by the logged-in user,
  others not
* There exist items which are active

1. Make the name or title of the listed items in the home page a link. When the
user clicks on a link for an item, they should be on a page that is displaying
the details of the item. This will include the long form description and add a
section on the page to display the current number of bidders.

1. Add a form to the item detail page that will allow the user to enter a bid
amount. The submit button for the form should say "Place Bid".

![place bids](../part-3/mockups/bid_on_item.png)

1. When the user submits the bidding form, the page should reload. Where the
form was located, there should be the text, "Thank you for your bid. Good luck!"
and the number of bidders section should be incremented by 1.

![place bids](../part-3/mockups/bid_on_item_already_bid.png)

#### Login or Register to Bid

_Given:_

* The current user is not logged in
* The user is on the item details page for a previously-created item

In place of the bidding form, a user should see the text "To place a bid please login or register." Both login and register should be links taking the user to
their respective pages.

![place bids](../part-3/mockups/bid_on_item_logged_out.png)

### Release 4: Bid on Items on the Profile Page

Now that we can bid on items, let's make it easy to keep track of the things we
have bid on.

#### Bid on Items

_Given:_

* The registered user is logged in
* Registered user has previously placed bids on several items
* User is currently on their profile page

Create a section to display the items the user has bid on.

![bid on items](../part-3/mockups/profile_3.png)


#### Won Items

_Given:_

* The registered user is logged in
* The registered user placed the highest bid on several items that are no longer active
* The registered user is currently on their profile page

Create a section to display the items they have won. This is items that are no
longer active (end date is before today) and the bid placed on the item is the
highest of all the bidders.

![bid on items](../part-3/mockups/profile_4.png)

## Conclusion

Part-3 wraps up the assessment.  If you haven't already done so, commit your
changes.  Please wait until the end of the assessment period to submit your
solution.
