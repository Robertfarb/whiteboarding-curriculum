# Google Analytics Walkthrough

## What is Google Analytics? Why should I spend 5 minutes to set it up?
* It is a web traffic tracking system built by Google that is completely <b>FREE</b>
* Just create an account and put a piece of Javascript tracking code into your site and it will run with every page of your site
* Once inserted into your code, the code records how long they were on your site, what device type they used, the number of page views, where they came from, etc.

## The ABCs of Google Analytics. You should be able to determine:
<b>A:</b> How many companies/recruiters/hiring managers are visiting my site?<br>
<b>B:</b> Am I creating content that is aesthetically appealing and easy to use for recruiters? <br>
<b>C:</b> Do I need to improve my site to increase callbacks from recruiters?

## Comparing Full Stack Projects
For 6 weeks, we tracked students’ full stack projects and these were the results…
* The more applications a student sent out, the more website views it had that week
* Visitors are looking at your sites and staying on them for an average of 30-90 seconds
* Sites with easy guest login, awake dynos, and visually appealing sites have longer session durations (2 min+) and lower bounce rates (50%, which is a good thing!).  We’ve found correlation to shorter job search duration (limited data so far suggests ~23 days)
* Sites that are harder to navigate and take longer to load (dyno asleep, ~10 second page load) have a higher bounce rate (90%) and have a longer job search duration (60+ days)
* As of October 2016, we do not know why a large number of 0 second sessions show up in the data, skewing the bounce rates to appear higher than expected.  Also, keep in mind that your own visits to the site may affect the data.    

## How to Install and Set Up Google Analytics for your FSP/Javascript/Flex:
* [Watch This Video](https://www.youtube.com/watch?v=Va-b-K5oqYs) (Only watch up to 3:00)  
* After registering your site, copy and paste Google Analytics snippets to the bottom of the body. On Github, you can insert snippet at end of body on the view application.html.erb
* Screenshots of students' projects with Google analytics inserted into the code: [Example 1](http://imgur.com/a/QuERY) and [Example 2](http://imgur.com/a/PXwI4)

#### Note: After you start sending out applications, recruiters and hiring managers should be clicking on your material. If you notice no one is visiting your site, you may have the code snippet in an invalid location in your code.

## Analyzing your web traffic
### Audience overview, Acquisition overview, Behavior overview
* [Watch This Video](https://www.youtube.com/watch?v=xZbd_yEN5nE) (9:16)  
* As you start seeing numbers increase, it is important to know what these numbers mean:
    * Sessions- a group of interactions that take place on your website within a given time frame. For example a single session may contain multiple screen or page views.
    * Users- a user is a combination of a unique random number and the first time stamp. The first timestamp is the time of the first visit by a user or the time when the Google Analytics cookie was first set for the user.
    * Pageviews- A pageview is defined as a view of a page on your site that is being tracked by the Analytics tracking code.          * If a user clicks reload after reaching the page, this is counted as an additional pageview.
    * Pages/session- total duration of all sessions (in seconds) / number of sessions. Individual session duration is calculated differently depending on whether there are engagement hits on the last page of a session.
    * Bounce rate- the percentage of single page visits (or web sessions). It is the number of visits in which a person leaves your website from the landing page without browsing any further.
    * % new sessions- first time users visiting your website compared to visitors who have previously visited your site

## Case Study:
* A student added google analytics on her flex project during the time period of July 27-August 18, 2016.
* Her project was a video game stats website for Destiny. She shared the link on Reddit and it gained a lot of traction in the video game community resulting in the numbers you see below!
* Since her website gained such popularity, she was able to track many things about visitors to the website, where they were coming from, and how long they stayed on the site. She was even featured on GameRant. Check out her flex project [here] (https://destiny-data.herokuapp.com/#/?_k=jy5wf6).  
* Although most projects don’t attract this high a volume of users, this data may be useful to demonstrate how Google analytics is useful.

[Screenshot of her Google Analytics](http://imgur.com/a/KWL3h)

