# Income-Calculator
Simple app build with ASP.NET 4.7 to calculate weekly earnings

## Technologies
  - C#
  - ASP.NET
  - Web Forms
  - CSS

## Application Information
This is an app which can calculate the weekly earnings of an employee.
It will show taxes paid, net income, gross income, and overtime pay.

### Solutions and Architecture

When the app starts up, the user is prompted to enter their credentials:

![Login](Pictures/Login.JPG)

After logging in with the correct credentials, the user is taken to the 
Order Screen where they can order several items and are shown the price based 
on their selections. The prices are updated whenever a change is made.

![Ordering](Pictures/Ordering.JPG)

After selecting items, they can click the view receipt button to view the 
totals of the items purchased

![Receipt](Pictures/Receipt.JPG)

The navigation bar has options to take you to a landing page or change profile
information:

![ProfileInfo](Pictures/ProfileInfo.JPG)

![ChangePassword](Pictures/ChangePassword.JPG)

There is also a navigation menu item to log out of the application which takes you
to a screen that confirms logout and has a button to return to the login screen:

![Logout](Pictures/Logout.JPG)

### Lessons Learned

I learned about managing state and how pages are constructed in webforms. I gained more experience and feel
more comfortable with C# after completing this project. I will certainly be looking into how I can use C#
in a full stack application, the idea being .Net with React.


