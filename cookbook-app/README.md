# Cookbook Application Database

Here are some SQL files which result in a simple cookbook app which supports the creation and tagging of recipes by category.

## Entities:

+ Recipe
+ User
+ Pic (for associating URLs with recipes)
+ Category (for associating a category with many recipes)
+ Tag (for associating many categories with many recipes)

## Usage:

On a running MySQL installation, from the interactive shell, execute:

		source setup.sql
		source dummy_data.sql
