import pandas as pd

# Read the CSV file
df = pd.read_csv('Diet data.csv')

# Clean column names
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

# Remove dollar signs and convert price to float
df['price_per_serving'] = df['price/_serving'].str.replace('$', '').astype(float)

# Function to clean numeric columns
def clean_numeric(x):
    if isinstance(x, str):
        return pd.to_numeric(x.replace(',', ''), errors='coerce')
    return x

# List of numeric columns
numeric_columns = ['calories', 'cholesterol_mg', 'total_fat_g', 'sodium_mg', 'carbohydrates_g', 
                   'dietary_fiber_g', 'protein_g', 'vit_a_iu', 'vit_c_iu', 'calcium_mg', 'iron_mg']

# Apply the cleaning function to numeric columns
for col in numeric_columns:
    df[col] = df[col].apply(clean_numeric)

# Remove rows with all NaN values
df = df.dropna(how='all')

# Reset index
df = df.reset_index(drop=True)

# Print the first few rows of the cleaned dataset
print(df.head())

# Save the cleaned dataset
df.to_csv('cleaned_diet_data.csv', index=False)