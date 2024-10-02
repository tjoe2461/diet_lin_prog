% Read the CSV file
data = readtable('cleaned_diet_data.csv');

% Drop the first 3 rows
data(1:3, :) = [];

% Reset the row names
data.Properties.RowNames = {};

% Identify numeric columns
numericColumns = varfun(@isnumeric,data,'output','uniform');

% Separate numeric and non-numeric data
numericData = data(:, numericColumns);
nonNumericData = data(:, ~numericColumns);