import ballerina/http;
import ballerina/log;

service / on new http:Listener(8090) {

    resource function post iptocountry(http:Caller caller, http:Request request) returns error? {
        // Log the received request for debugging
        log:printInfo("Received request: " + request.getTextPayload());
        
        // Assuming a static country response for simplification
        json responsePayload = { "country": "USA" };

        http:Response response = new;
        response.statusCode = http:STATUS_OK;
        response.setJsonPayload(responsePayload);

        // Send the response back to the caller
        check caller->respond(response);
    }
}
