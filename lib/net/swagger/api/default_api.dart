part of swagger.api;



class DefaultApi {
  final ApiClient apiClient;

  DefaultApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<Forecast> forecastGet(int latitude, int longitud, String current) async {
    Object postBody = null;

    // verify required params are set
    if(latitude == null) {
     throw new ApiException(400, "Missing required param: latitude");
    }
    if(longitud == null) {
     throw new ApiException(400, "Missing required param: longitud");
    }
    if(current == null) {
     throw new ApiException(400, "Missing required param: current");
    }

    // create path and map variables
    String path = "/forecast".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "latitude", latitude));
      queryParams.addAll(_convertParametersForCollectionFormat("", "longitud", longitud));
      queryParams.addAll(_convertParametersForCollectionFormat("", "current", current));
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return
          apiClient.deserialize(response.body, 'Forecast') as Forecast ;
    } else {
      return null;
    }
  }
}
