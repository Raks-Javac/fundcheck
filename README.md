# Fund Check 

A budget Tracker app.

## Description

This is mainly for tracking your finances and help you in managing your expenses.(Made with flutter and dart)...In progress

## Installation


- To get all the dependences needed for the app

``` flutter pub get -v
```

- To run on your local machine provided you have the  flutter SDK installed

``` flutter run -v
```

- To build an apk and run on your physical devices

```flutter build apk --release
```


## Usage

Track expenses


## App Structure


- lib/src/features

This folder contains the app features as this app is layered by its features basically a domain driven development currently


- lib/src/core

This folder contains the core or skelental reusables for the app functionality such as navigation system, network services ...etc


- lib/src/shared/res

This folder contains the app resources and styling components  such as colors, strings , theme , typography ..etc. 


- lib/src/shared/widgets

This folder contains app level reusable widgets such as button, text fields ...etc.


## Naming convention

Currently all class are named with the prefix on the app name in mind e.g the current app name is Fundcheck so all classes start with the prefix 
"F".

- Example 

- FColors : an abstract class containing all  the app defined colors
- FTypography : an abstract class containing all  the app defined text system

## Contributing

If you would like to contribute to the project, please follow these guidelines:

1. Fork the repository.
2. Create a branch for your feature (e.g. `feature/new-feature`).
3. Make your changes and commit them (with a descriptive commit message).
4. Push the branch to your forked repository.
5. Submit a pull request back to the original repository.

<!-- ## License

The project is licensed under the [Name of License]. Please see the [LICENSE.md](LICENSE.md) file for more information.

## Acknowledgements

- -->
