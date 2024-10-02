% Read the CSV file
data = readtable('cleaned_diet_data.csv');

% Display the size of the original data
disp('Original data size:');
disp(size(data));

% Drop the first 3 rows
data(1:3, :) = [];

% Reset the row names
data.Properties.RowNames = {};

% Display the size of the data after dropping rows
disp('Data size after dropping first 3 rows:');
disp(size(data));

% Display the first few rows of the processed data
disp('First few rows of the processed data:');
disp(head(data));

% Identify numeric columns
numericColumns = varfun(@isnumeric,data,'output','uniform');

% Separate numeric and non-numeric data
numericData = data(:, numericColumns);
nonNumericData = data(:, ~numericColumns);

% Convert numeric data to matrix
matrixData = table2array(numericData);

% Display information about the matrix
disp('Size of the numeric matrix:');
disp(size(matrixData));

disp('First few rows of the numeric matrix:');
disp(matrixData(1:5, :));