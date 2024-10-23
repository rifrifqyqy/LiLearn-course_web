# README

# LILEARNV COURSES ARTICLES

Rails 7 E-Course Application
This is a fullstack e-course management application built using Rails 7 and MongoDB for storing data. The application allows users to create, edit, and manage courses with multiple materials, where each material contains rich content (text, images) using CKEditor.

## Technologies

![Ruby](https://img.shields.io/badge/ruby-d21203.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/ruby%20on%20RAILS-d21203.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white) 
![MongoDB](https://img.shields.io/badge/MongoID-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white) 

Table of Contents

- Features
- Requirements
- Installation
- Usage
- Testing
- Contributing
- License

## Features

- Login with 2 user role #admin and default #user
- CRUD functionality for managing courses and materials.
- Rich text editor integration using CKEditor for creating content with text and images.
- MongoDB integration for managing the backend database with Rails.
- Dynamic material management with the ability to add multiple materials for each course.
- Tailwind CSS for styling.
- File upload functionality for course thumbnails and material images.
- JavaScript for handling dynamic form inputs (adding/removing materials).

## Requirements

Ruby >= 3.1
Rails >= 7.2
MongoDB
Node.js and Yarn (for JavaScript dependency management)
ImageMagick (for image processing)

## Installation

Follow these steps to set up the project locally:

Clone the repository:
```bash
git clone https://github.com/your-username/your-repo-name.git
```
```bash
cd your-repo-name
```
Install required gems: Run the following command to install all the Ruby dependencies.
```bash
bundle install
```
Install JavaScript dependencies: Ensure that you have Node.js and Yarn installed. Then, run:
```bash
yarn install
```
Set up MongoDB: Make sure you have MongoDB installed and running on your system. Configure the MongoDB connection in config/mongoid.yml.

Set up the database: Since we are using MongoDB with Mongoid, the database is automatically created on first interaction, but you can create it with:
```bash
rails db:seed
```
Precompile assets (optional for production):
```bash
rails assets:precompile
```
Start the Rails server: Run the following command to start the development server:
```bash
rails server
```
You can access the application at http://localhost:3000.

## Usage

Adding Courses
Navigate to /courses/new.
Fill in the course details including title, description, and thumbnail image.
Add multiple materials, each with a title, description, and rich content using CKEditor.
Save the course, and it will be stored in MongoDB.
Managing Materials
You can dynamically add and remove materials using the "Add Material" button. The materials can be edited inline within the course form.
Testing
This project uses RSpec for testing. To run the tests, use the following command:
```bash
bundle exec rspec
```
You can also write feature and integration tests to ensure the application's behavior is correct.

## Contributing

We welcome contributions! If you'd like to contribute to the project, here's how you can get started:

Fork the repository.
Create a new feature branch: git checkout -b my-new-feature.
Commit your changes: 
```bash
git commit -am 'Add some feature'
```
Push to the branch: 
```bash
git push origin my-new-feature 
```
Submit a pull request.
Please ensure your code adheres to the coding standards and includes relevant tests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
