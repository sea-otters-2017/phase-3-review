# Part 2:  AJAX

## Summary
In Part 2 we'll take a functioning Sinatra application and enhance the user
experience by adding some AJAX calls.

### User Stories

<a name="current_site">

#### Current Site

The application is a simple hostel guestbook where guests at the hostel can post comments.  If a user wanted to post a comment, here's the process.

User visits the site root.

![](walkthrough/1-start.png)

User fills out and submits the form.

![](walkthrough/2-populatedform.png)

User is taken back to the guest comments page where the saved comment is displayed.

![](walkthrough/3-submittedform.png)

#### Future Site

Our enhancements will make it so the user never leaves the homepage.  All the requests will be AJAX requests, and we'll update the DOM based on the responses.  After the site is updated, here's what the user experience will be.

User visits the site root.

![](walkthrough/2-populatedform.png)

User fills out and submits the form. Details of the saved comment are added to the DOM (without refreshing).

![](walkthrough/4-liked.png)

Note that the form is also reset to allow another comment.

##### Liking
In addition to AJAXifying the site, you should add the ability for users to "like" a comment. This flow will again keep the user on the same page.

1. User visits the site root.
1. User clicks on a like button.
1. The "like" count is incremented on the DOM.

Our enhancements will change the experience so the user never
leaves the homepage.  All the requests will be AJAX requests and we'll update
the DOM based on the responses.

### Design Principle: Graceful Degradation

When applying JavaScript, we should so so in a way that, when JavaScript is
disabled, the basic functionality of the application still works. Try disabling
JavaScript in Chrome and then visit the [http://localhost:9393/posts](http://localhost:9393/posts) again.

As a reminder, you can use the Chrome Developer Tools to temporarily disable JavaScript (Version 51.0.2704.106 shown):

![](readme-assets/disable-javascript.gif)


When you click "Share Your Thoughts" you should experience the workflow
described in the "[Current Site](#current_site)."

## Releases

### Release 0: AJAX

## Conclusion
Once all the tests have passed, you have completed Part 2 of the assessment. If you haven't done so already, commit your changes and move on to Part 3.
