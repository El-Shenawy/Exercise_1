This is a Dart program that reads a CSV file containing data and produces two output CSV files summarizing the data.

Input Format
The input CSV file should have the following format:


ID,Location,Product Name,Quantity,Brand
ID: A unique identifier for the order.
Location: The location where the order was placed.
Product Name: The name of the product that was ordered.
Quantity: The quantity of the product that was ordered.
Brand: The brand of the product that was ordered.
The first line of the file should be a header line containing the names of the columns.

Output Format
The program produces two output CSV files:

0_inputFileName
This file contains the average quantity of each product that was ordered, rounded to two decimal places. The file has the following format:


Product Name,Average Quantity
Product Name: The name of the product.
Average Quantity: The average quantity of the product that was ordered.
1_inputFileName
This file contains the most popular brand for each product that was ordered. If there are multiple brands with the same number of orders, the brand with the lowest lexicographic order is selected. The file has the following format:


Product Name,Most Popular Brand
Product Name: The name of the product.
Most Popular Brand: The most popular brand of the product that was ordered.
Running the Program
To run the program, execute the following command in a terminal:


dart exercise1.dart
The program will prompt you to enter the name of the input CSV file. Enter the name of the file (including the .csv extension) and press Enter (Make sure you are at the right directory where the csv file is located).

The program will then generate the output CSV files in the same directory as the input file.

Example Usage
Suppose you have a CSV file called order_log00.csv with the following contents:


ID,Location,Product Name,Quantity,Brand
ID944806,Willard Vista,Intelligent Copper Knife,3,Hill-Groczany
ID644525,Roger Centers,Intelligent Copper Knife,1,Kunze-Bernhard
ID348204,Roger Centers,Small Granite Shoes,4,Rowe and Legros
ID710139,Roger Centers,Intelligent Copper Knife,4,Hill-Groczany
ID426632,Willa Hollow,Intelligent Copper Knife,4,Hill-Groczany

To run the program on this file open a terminal in the directory containing the file, and execute the following command:


dart exercise1.dart
When prompted, enter order_log00.csv and press Enter.

The program will generate two output files: 0_order_log00.csv and 1_order_log00.csv. The contents of these files will be as follows:


0_order_log00.csv:
Product Name,Average Quantity
Intelligent Coppe	2.25
Small Granite Shoes	1


1_order_log00.csv
Product Name,Most Popular Brand
Intelligent Coppe	Hill-Groczany
Small Granite Shoes	Rowe and Legros


These files summarize thedata in order_log00.csv.