<a name="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]




<br />
<div align="center">
  <a href="https://github.com/pantry-wizard/pantry_wizard_be">
    <img src="https://user-images.githubusercontent.com/117066950/231888243-b836b725-b848-4151-a449-6564fd7d4e5e.png" alt="Logo" width="582" height="404">
  </a>

<h3 align="center">Pantry Wizard</h3>

  <p align="center">
    An application that allows a user to create meal plans based on their Dietary Restrictions, Intolerances, and Cusine Preferences. 
    <br>
    This is the backend service of the application.
    <br />
    <!-- <a href="https://github.com/github_username/repo_name"><strong>Explore the docs »</strong></a> -->
    <!-- <br /> -->
    <!-- <br /> -->
    <!-- <a href="https://github.com/github_username/repo_name">View Demo</a> -->
    <!-- · -->
    <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Report Bug</a>
    ·
    <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Request Feature</a>
    ·
    <a href="https://github.com/pantry-wizard/pantry_wizard_fe">Front End Repo</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#api-key-setup">API Key Setup</a></li>
        <li><a href="#testing-with-rspec">Testing With RSpec</a></li>
        <li><a href="#local-server-setup">Local Server Setup</a></li>
      </ul>
    </li>
    <li><a href="#how-to-use-walkthrough">How to Use (Walkthrough)</a></li>
    <ul>
        <li><a href="#login">Login</a></li>
        <li><a href="#user-preferences">User Preferences</a></li>
        <li><a href="#Day Plans">Day Plans</a></li>
        <li><a href="#recipes">Recipes</a></li>
      </ul>
    <li><a href="#goals">Goals</a></li>
    <li><a href="#contributors">Contributors</a></li>
  </ol>
</details>

<br>

<!-- ABOUT THE PROJECT -->
## About The Project
<br>

At Pantry Wizard, we believe that everyone deserves access to healthy, delicious food. We're on a mission to reduce food waste and alleviate food insecurity by providing personalized meal planning that simplifies the decision-making process and empowers individuals to take control of their nutrition. Our app is designed to meet the needs of neurodivergent individuals, picky eaters, and anyone facing time or resource constraints, so they can focus on what really matters in their lives. Join us in making a positive impact on our communities, one meal at a time.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With:

* [![Ruby]][Ruby-url] **3.1.1**
* [![Rails]][Rails-url] **7.0.4**
* [![Postgresql]][Postgresql-url]
* [![Heroku]][Heroku-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is a Ruby on Rails application that's used together with the <a href="https://github.com/pantry-wizard/pantry_wizard_be"> `pantry_wizard_be` </a> repository. To run the application locally, both front-end and back-end repositories will need to be cloned and set up fully with required gems and environment variables.

<br>

### Installation

1. Clone the repo:
   ```bash
   git clone git@github.com:pantry-wizard/pantry_wizard_be.git
   ```

1. Install gems:
   ```bash
   bundle install
   ```

<!-- 1. ==ADD SPECIFIC INSTRUCTIONS TO INSTALL FIGARO== -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

### API Key Setup
In order to use this application you will API keys from both <a href="https://rapidapi.com/spoonacular/api/recipe-food-nutrition/"> `RapidAPI` </a> and <a href="https://developers.google.com/maps"> `Google Maps Platform` </a>.

Once you have these keys, they will be stored in files that you create.

1. Create a `.env` file within the app. This file should appear next to the .gitattributes foler and should not be nested. Add your `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` to this file.
    ```
    GOOGLE_CLIENT_ID=xxxxxxxxxxxxxxx-xxxxxxxxxxxxxxx.apps.googleusercontent.com
    GOOGLE_CLIENT_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    ```

1. Run `bundle exec figaro install`, then open the `application.yml` file. Here you'll add your `X-RapidAPI-Key`.
    ```
    X-RapidAPI-Key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    ```

<br>

To establish a Postgres database, run:

    `rails db:{create,migrate}`

Note: This frontend is build in Rails, which is not traditionally used as a frontend language. Because of this, it requires an established database in order to function.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

### Testing with RSpec

Once `pantry_wizard_fe` is correctly installed, run tests locally to ensure the repository works as intended.

<br>

  To test the entire RSpec suite, run:
   ```bash
   bundle exec rspec
   ```

   <p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

All tests should be passing if the installation was successful. 

If any tests are not passing, please report which tests are not passing <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Here</a>. We will issue an update/fix as soon as possible!


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>


### Local Server Setup
To use PantryWizard locally, run `rails s` on both `pantry_wizard_be` and `pantry_wizard_fe`. The backend will be hosted on `localhost:4000` while the front end will use `localhost:3000`


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

## How to Use (Walkthrough)
<!-- INSERT DAWSONS WONDERFUL OATMEAL GIF(T)S -->

### Login
- Using your preferred internet browser (chrome), visit `localhost:3000`.
  - You'll be asked to sign-in using Google OAuth, so a Google account is required.
  - Once logged in, you'll be redirected to the `/dashboard`
  <!-- is there a mealplan prepopulated upon creation? are they actually directed to /preferences? -->

  <br>

### User Preferences
- Select all food `Intolerances` you have from the avaliable list.
- Select up to one `Dietary Restriction` if you have one.
- Next to each cuisine type there is a drop down menu, which you can select your `Likes and Dislikes`
- When the form looks right to you, press submit at the bottom of the page. You can change these preferences later if you want.

### Meal Plans
1. Select `Create Meal Plan`
    - 

<!-- 1. Login (Google)
1. Dashboard
1. User Preferences
1. Meal Plans
    1. New Meal Plan
    1. Modify Meal Plan
    1. Get New Recipes -->


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

## Goals

Pantry Wizard was crafted to satisfy the requirements for The Turing Back-End Mod 3 group project, **Consultancy**. 

See the official project requirements [here](https://backend.turing.edu/module3/projects/consultancy/).

<br>

### Learning Goals
- Impliment Google OAuth so users can log in easily.
- Impliment CircleCI for continuous integration.
- Utilize Service Oriented Architecture by creating an API with Rails.
- Interact with two unique external API's.
- Deploy both the frontend and backend on Heroku.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Future Goals
- Add google calendar so meals can be scheduled in advance.
- Integrating Swagger.
- Integrating HoneyBadger for observability of backend queries.
- Integrating Swagger to make endpoint testing easier.

### Known Issues
<!-- - INSERT KNOWN ISSUES HERE -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>


## Contributors
<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/116330317?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/88596340?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/104170346?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/71752551?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/117066950?s=120&v=4"></td>
  </tr>
  <tr>
    <td>Chris Crane</td>
    <td>Conner Van Loan</td>
    <td>Caleb Thomas</td>
    <td>Brian Hayes</td>
    <td>Dawson Timmons</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/GreenGogh47">GitHub</a><br>
      <a href="https://www.linkedin.com/in/chris-crane-16106814/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/C-V-L">GitHub</a><br>
      <a href="https://www.linkedin.com/in/conner-van-loan/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/cjthomas00">GitHub</a><br>
      <a href="https://www.linkedin.com/in/calebjthomas/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Bphayes1200">GitHub</a><br>
      <a href="https://www.linkedin.com/in/brian-hayes-363812204/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/DMTimmons1">GitHub</a><br>
      <a href="https://www.linkedin.com/in/dawson-timmons/">LinkedIn</a>
    </td>
  </tr>
</table>


<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[contributors-url]: https://github.com/pantry-wizard/pantry_wizard_be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[forks-url]: https://github.com/pantry-wizard/pantry_wizard_be/network/members
[stars-shield]: https://img.shields.io/github/stars/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[stars-url]: https://github.com/pantry-wizard/pantry_wizard_be/stargazers
[issues-shield]: https://img.shields.io/github/issues/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[issues-url]: https://github.com/pantry-wizard/pantry_wizard_be/issues
[license-shield]: https://img.shields.io/github/license/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[license-url]: https://github.com/pantry-wizard/pantry_wizard_be/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Ruby]: https://img.shields.io/badge/ruby-000000?style=for-the-badge&logo=ruby&logoColor=red
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/rails-red?style=for-the-badge&logo=rubyonrails&logoColor=white&color=red
[Rails-url]: https://rubyonrails.org/
[Postgresql]: https://img.shields.io/badge/postgresql-3386FF?style=for-the-badge&logo=postgresql&logoColor=FFFFFF
[Postgresql-url]: https://www.postgresql.org/
[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://www.heroku.com/