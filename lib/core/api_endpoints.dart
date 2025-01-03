abstract class ApiEndpoints {
  static const _baseUrl = 'http://89.116.212.214/api/';
  
  static const singUp = '${_baseUrl}register';
  static const logIn = '${_baseUrl}login';

  static const createCode = '${_baseUrl}codigo';
  static const accessCode = '${_baseUrl}codigo';
  static const readCode = '${_baseUrl}codigo/escanear';
}