#!/bin/bash


# Description: Calculation of BMI to attain Classification and Health Risks

# Author: Kwasi Boateng




sudo yum -y update
sudo yum -y install bc





# Prompt the user to input their weight in kilograms and convert it to a float
echo "Enter your weight in kg: "
read m


if [ -z ${m} ] ||  ! [[ ${m} =~ ^-?[0-9]+([.][0-9]+)?$ ]] 
then
    echo "Enter a valid number"

    exit 1

fi



# Prompt the user to input their height in meters and convert it to a float
echo "Enter your height in metres: "
read h


if [ -z ${h} ] ||  ! [[ ${h} =~ ^-?[0-9]+([.][0-9]+)?$ ]] 
then
    echo "Enter a valid number"

    exit 1

fi




# Calculate BMI using the formula weight (kg) / (height (m)^2)
# scale puts the number in 2 decimal places

BMI=$(echo "scale=2; $m / $h^2" | bc)

echo $BMI


# List of BMI classifications
c=("Underweight" "Normal Weight" "Overweight" "Obese Class I" "Obese Class II" "Obese Class III")


# Corresponding list of health risk levels
r=("increased" "least" "increased" "high" "very high" "extremely high")

c=("Underweight" "Normal Weight" "Overweight" "Obese Class I" "Obese Class II" "Obese Class III")

# Corresponding list of health risk levels
r=("increased" "least" "increased" "high" "very high" "extremely high")

# Determine the BMI classification and associated health risk
if [ $(echo "$BMI <= 18.5" | bc -l) -eq 1 ]
then
    # BMI is less than 18.5, classify as Underweight with increased health risk
    echo "Your BMI is ${BMI}. Your classification is ${c[0]} and the risk of developing health problems is ${r[0]}"

elif [ $(echo "$BMI <= 24.9" | bc -l) -eq 1 ]
then
    # BMI is between 18.5 and 24.9, classify as Normal Weight with the least health risk
    echo "Your BMI is ${BMI}. Your classification is ${c[1]} and the risk of developing health problems is ${r[1]}"

elif [ $(echo "$BMI <= 29.9" | bc -l) -eq 1 ]
then
    # BMI is between 25.0 and 29.9, classify as Overweight with increased health risk
    echo "Your BMI is ${BMI}. Your classification is ${c[2]} and the risk of developing health problems is ${r[2]}"

elif [ $(echo "$BMI <= 34.9" | bc -l) -eq 1 ]
then
    # BMI is between 30.0 and 34.9, classify as Obese Class I with high health risk
    echo "Your BMI is ${BMI}. Your classification is ${c[3]} and the risk of developing health problems is ${r[3]}"

elif [ $(echo "$BMI <= 39.9" | bc -l) -eq 1 ]
then
    # BMI is between 35.0 and 39.9, classify as Obese Class II with very high health risk
    echo "Your BMI is ${BMI}. Your classification is ${c[4]} and the risk of developing health problems is ${r[4]}"

else
    # BMI is 40.0 or higher, classify as Obese Class III with extremely high health risk
    echo "Your BMI is ${BMI}. Your classification is ${c[5]} and the risk of developing health problems is ${r[5]}"
