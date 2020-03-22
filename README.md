# PLANiT

**3/21/2020:** Implemented forgot password functionality. Added authenticate\password_reset file description below.

**3/19/2020:** Setup email/password authentication methods in Firebase for ***Android*** app. Modified dependecies in build.gradle and pubspec.yaml to connect Firebase authentication with flutter app.
- Make sure to download and use all files in the **android** folder and **pubspec.yaml** to have proper settings that connects Firebase authentication to the flutter app.
  - **android\app\google-services.json:** This is the config file I downloaded from Firebase to enable and connect the Email and Password authentication method.

  
### HOW TO SETUP NEW FLUTTER PROJECT TO COPY THIS BRANCH'S WORKING PLANIT APP WITH WORKING FIREBASE AUTHENTICATION
1. Download ZIP from github and extract
2. Create new flutter project
3. Select Flutter Application > Next
4. Project name: planit_sprint2 > Next
5. Package name: com.cpsc.planit_sprint2
   - Firebase uses the package name '_com.cpsc.planit_sprint2_' so make sure this is the same. Did not test if having a different package name on flutter causes any problems.
6. Finish and open project in new window
7. Copy files from extracted ZIP folder to project root directory
   - This should overwrite the default android\\ folder, pubspec.yaml, and lib\main.dart files
8. Open the pubspec.yaml file and click on "Packages get" to install all the packages in dependencies (this should solve any errors with files that have a red underline)
9. Open Android emulator and run
   - May receive some kind of CloudFirestorePlugin.java error in console during first time running the app, but it will still continue opening the app (delay lasts for at least a minute).
10. App should have a working Create Account, Login, Sign Out, and Forgot Password authentication. (As well as all the other working functions from sprint 1)
    - You can check if an account has been created by going to our [Firebase authentication userbase](https://console.firebase.google.com/u/2/project/planit-573b1/authentication/users)
    - More info about authentication in the file descriptions below. (see authenticate\\ files and services\\auth.dart)
   
**Note:** App will open on login screen because of the user authentication state that was set when I uploaded the files, but if you login and then restart the app without signing out, it should reload back into the homepage screen. If you sign out and restart the app without signing back in, it will reload to the homepage because it checks if a user is still signed in.


## File descriptions (all files below found in lib folder)

***Note: some of the imports in these dart files references a 'package:planit_sprint2/...', if you are getting errors, make sure planit_sprint2 is changed to whatever you named your flutter app.***

**main.dart:** Root of application. Calls Wrapper() from wrapper.dart to decide which screen to display (login screen or homepage) when app is opened for the first time.

**wrapper.dart:** Essentially a "wrapper" for our application - determines the start screen when app is launched based on authentication changes. If a user is not logged in, display the login page, else display the home page.
Referenced [Flutter & Firebase Basic App Structure #3](https://www.youtube.com/watch?v=z05m8nlPRxk&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=3)

App currently following the structure below:
![planit-structure](https://user-images.githubusercontent.com/43505612/77134450-465ba700-6a24-11ea-9228-188ac2cfbc91.png)

**services\auth.dart:** Uses the firebase_auth package to setup firebase authentication instance for login, sign up, sign out, and forgot password functions.

**authenticate\register.dart:** Builds widget for creating an account. Takes input email and password to create an account entry in Firebase. If account is created, user is redirected to app homepage. Referenced [Flutter & Firebase Register With Email & Password #12](https://www.youtube.com/watch?v=jl5E0UfAGVs&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=12)
- You can check if the account has been created in our [Firebase Authentication userbase](https://console.firebase.google.com/u/2/project/planit-573b1/authentication/users).
  - Once the user enters valid information in the Create Account text field and clicks 'Create Account', they are redirected to app's homepage. After you reach the homepage, you can refresh the Firebase Authentication list and you should see the email that was used to sign up.
- **TO DO:** (not actually to do, just ideas to implement for the future) 
  - First name, last name, and username fields do not do anything (they are not stored/recorded in any variable), but the text fields for these items are currently set to be required to fill in for account to be created.
  - Display a brief message (notification style?) that account was successfully created.

**authenticate\login_screen.dart:** Builds widget for login page/authentication. If any fields are empty, or account is not found in Firebase authentication userbase, error messages are displayed in red text. Able to navigate to Create Account page, or home page after successful login. Referenced [Flutter & Firebase Sign in With Email & Password #13](https://www.youtube.com/watch?v=Jy82t4IKJSQ&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=13)

**authenticate\password_reset.dart:** Builds widget for password reset page. If email text field is empty, or account is not found in Firebase, error messages are displayed in red text. When user enters a valid email address and clicks Submit button, yellow dialog should pop up at top of screen notifying the user a password reset link was sent to their email address.
- In the password reset email, user is provided a link to a small reset password screen provided by Firebase.
![forgot_pass](https://user-images.githubusercontent.com/43505612/77240314-b7749900-6ba1-11ea-8266-73061e2662c0.png)
- After changing their password, user should be able to login to app with new password.

**authenticate\user-model.dart:** Defines a user class to set Firebase User ID (UID). Used in auth.dart to set uid from email text fields. Referenced [Flutter & Firebase Custom User Model #6](https://www.youtube.com/watch?v=PS0b2gJ04Bs&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=6)

**home\home_page.dart:** Builds home of app with navigation bar to Home, Classes, and Schedule pages. Made no changes since sprint 1.

**home\home.dart:** Builds homepage of app (when user is on the Home tab of navigation bar). Added a menu button at top right of app bar to sign out and move back to login page. Sign out button authenticates with Firebase to "stream" event of which uid has signed out. 
- Pressing the sign out button changes authentication state for wrapper, so if user restarts app after selecting sign out, they will open the app to the login page. If they did not press the sign out button, then the app will open to homepage with last logged in uid.
- Referenced [Flutter & Firebase Signing Out #9](https://www.youtube.com/watch?v=v3sY3RWciNw&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=9).

**home\task.dart:** Builds task list to create, delete, and check off tasks. Made no changes since sprint 1.
- **TO DO:**
  - Create Firebase database and connect to flutter app.
  - Need to connect tasks to Firebase database to record/save user tasks. Currently, if you create a task then exit the task list, then go back into the task list, it is empty.
  - Recommend to reference: [Flutter & Firebase Database Setup #16](https://www.youtube.com/watch?v=mtNA1neFNVo&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=16) and [Flutter & Firebase User Records #17](https://www.youtube.com/watch?v=EA7973HI93E&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=17) because it is the same tutorial series I followed to setup Firebase authentication.

**home\classes.dart:** Builds class page (when user is on Class tab of navigation bar). Made no changes since sprint 1.
- **TO DO:**
  - Make it work lol
  - Needs to also connect to Firebase database. (see task.dart to-do for database setup references)

**home\schedule.dart:** Builds schedule page. Made no changes since sprint 1.
