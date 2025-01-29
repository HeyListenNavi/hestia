abstract class ApiEndpoints {
  static const _baseUrl = 'http://89.116.212.214/api/';
  
  static const singUp = '${_baseUrl}register';
  static const logIn = '${_baseUrl}login';

  static const createCode = '${_baseUrl}code';
  static const accessCode = '${_baseUrl}code';
  static const readCode = '${_baseUrl}code/scan';
}