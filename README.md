# PLANiT

### HOW TO SETUP NEW FLUTTER PROJECT TO COPY THIS BRANCH'S WORKING PLANIT APP WITH WORKING FIREBASE SERVICES
1. Download ZIP from github and extract
2. Create new flutter project
3. Select Flutter Application > Next
4. Project name: [Any name] > Next

Choose any project name, e.g. planit or planit_sprint3, and any project location
![flutter_projectname](https://user-images.githubusercontent.com/43505612/80420424-9afa0980-888f-11ea-8fd3-47c30bbf5ff6.png)

5. Package name: com.cpsc.planit_sprint2
   - Firebase uses the package name '_com.cpsc.planit_sprint2_' so make sure this is the same. Did not test if having a different package name on flutter causes any problems.
   ![flutter_packagename](https://user-images.githubusercontent.com/43505612/80420432-9d5c6380-888f-11ea-80e8-4f67b3b42e77.png)
6. Finish and open project in new window
7. Copy files from extracted ZIP folder to project root directory
   - This should overwrite the default android\\ folder, lib\\ folder, and pubspec.yaml
8. Open the pubspec.yaml file and click on "Packages get" or "Pub get" to install all the packages in dependencies (this should solve any errors with files that have a red underline)
![flutter_pubget](https://user-images.githubusercontent.com/43505612/80420783-312e2f80-8890-11ea-9055-d8d69ec03c90.png)

9. Open Android emulator and run
