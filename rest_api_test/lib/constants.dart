class ApiConstants {
  // * Dart that will hold all your URLs and endpoints.
  // * In our case, we only have one endpoint,
  // * but it’s a good practice to have a separate file.
  // * Here, we have created a class called ApiConstants and two static variables
  // * so that we can access them without creating an instance of the class
  // * like ApiConstants.baseUrl.
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static String usersEndpoint = '/users';
}
