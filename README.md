# This repository contains: 



1. Contains an Improved BMI Flutter application. In this version I created a new feature that calculates the weight that is missing to user reaches the ideal weight, both for users who need to gain weight and for user who need to lose. 



# The following external packages were used in this project:



1. There is no external packages in this project, all the features and functionalities were developed within the code itself.

   


# In lib's repository you can find the following organization of subrepositories:



1. **pages:** this is the only additionally repository that was create to organize the code and it contains the Homepage( ) widget that by the way is the only page of project. Inside this widget are all the functions and states reponsible for running it. 

   


# In this project you can find the following object models:



1. It was not necessary creates an object model for this project. 



# In this project you can find the following widgets:



1. **MyApp( )**: basic default widget that returns the mainly widget Homepage()

2. **Homepage( ):** here you can find the all the functions and states used to brings up the funcionalities of application. 

   

   


# In this project you can find the following functions:

 


1. **calculatesBMI():** this is the function of the "Calculate" button, it calculates BMI and returns the value on the screen with the following classification:


   1. weight down
   2. ideal weight
   3. slightly overweight
   4. Grau obesity 1
   5. Grau obesity 2
   6. Grau obesity3

2. **howManyKilosMissesForIdealWeight**: this function brings up the new feature that calculates how many Kg misses to the user reachs the ideal weight when he doesn't have it. 

3. **resetController**: this function reset the app to the default page. 

    

# In this project you can find the following variables, lists and getters:



instances

1. **weightController:** instance created to receive the content of the weight field 
2. **heighController:** instance of TextEditingController created to receive height content
3. **_formkey:** instance of GlobalKey<FormState created to set the form used to manage the text fields.



variables



1. **result:** host the result of BMI calculation which will be displayed on screen when the button "Calculate" is pressed. 
2.  **bmi**: receive the formula for calculating BMI
3. **weight:** convert the text of weightController to double number.
4. **height:** convert the text of heightController to double number
5. **weightToPlus:** receive the missing weight to reachs ideal BMI when it's less then ideal
6. **weightToLose**  receive the missing wieght to reachs ideal BMI when it's over then ideal
