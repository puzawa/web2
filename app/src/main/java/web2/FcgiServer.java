package web2;

import com.fastcgi.FCGIInterface;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Locale;

import java.math.BigDecimal;

import com.google.gson.Gson;

public class FcgiServer {
    private final FCGIInterface fcgi;
    private static final String HTTP_RESPONSE = """
            Content-Type: application/json
            Content-Length: %d
            
            %s
            """;

    public FcgiServer() {
        this.fcgi = new FCGIInterface();
        Locale.setDefault(Locale.US);
    }

    private void sendResponse(String jsonResponse) {
        var response = String.format(HTTP_RESPONSE, jsonResponse.getBytes(StandardCharsets.UTF_8).length, jsonResponse);
        System.out.println(response);
    }

    private HashMap<String, String> parseRequest(String requestBody) throws IllegalArgumentException {
        if (requestBody == null || requestBody.isEmpty()) {
            throw new IllegalArgumentException("Request body is empty");
        }

        try {
            Gson gson = new Gson();

            // Parse JSON directly into HashMap<String, String>
            HashMap<String, String> parsedValues = gson.fromJson(requestBody, HashMap.class);

            // Optional: check that all required keys are present
            if (!parsedValues.containsKey("x") ||
                    !parsedValues.containsKey("y") ||
                    !parsedValues.containsKey("r")) {
                throw new IllegalArgumentException("Missing required parameters");
            }

            return parsedValues;
        } catch (Exception e) {
            throw new IllegalArgumentException("Invalid JSON: " + e.getMessage());
        }
    }

    private String readPostBody() throws Exception {
        FCGIInterface.request.inStream.fill();
        int contentLength = FCGIInterface.request.inStream.available();
        ByteBuffer buffer = ByteBuffer.allocate(contentLength);
        int readBytes = FCGIInterface.request.inStream.read(buffer.array(), 0, contentLength);
        byte[] requestBodyRaw = new byte[readBytes];
        buffer.get(requestBodyRaw);
        buffer.clear();
        return new String(requestBodyRaw, StandardCharsets.UTF_8).intern();
    }

    public void run() {

        System.out.println("on FCGIaccept()");

        while (fcgi.FCGIaccept() >= 0) {
            var executionStart = System.nanoTime();
            String method = FCGIInterface.request.params.getProperty("REQUEST_METHOD");

            // Accept POST instead of GET
            if (!method.equalsIgnoreCase("POST")) {
                sendResponse("""
                        {
                        "error": "invalid request method"
                        }
                        """);
                continue;
            }

            String request;
            try {
                request = readPostBody();
            } catch (Exception e) {
                sendResponse("{\"error\": \"Failed to read request body\"}");
                continue;
            }

            HashMap<String, String> valuesMap;
            try {
                valuesMap = parseRequest(request);
                if (valuesMap.get("x").isEmpty() || valuesMap.get("y").isEmpty() || valuesMap.get("r").isEmpty())
                    throw new ArrayIndexOutOfBoundsException();

                var x = new BigDecimal(valuesMap.get("x"));
                var y = new BigDecimal(valuesMap.get("y"));
                var r = new BigDecimal(valuesMap.get("r"));

                if (Validator.checkX(x)) sendResponse("{\"error\": \"X is invalid\"}");
                if (Validator.checkY(y)) sendResponse("{\"error\": \"Y is invalid\"}");
                if (Validator.checkR(r)) sendResponse("{\"error\": \"R is invalid\"}");


                if (!MathFunctions.hitCheck(x, y, r)) {
                    sendResponse("""
                            {
                            "x": %d,
                            "y": %.2f,
                            "r": %.2f,
                            "execution_time": "%tS",
                            "result": "Miss"
                            }
                            """.formatted(x.toBigInteger().intValue(), y.doubleValue(), r.doubleValue(), System.nanoTime() - executionStart));

                } else {
                    sendResponse("""
                            {
                            "x": %d,
                            "y": %.2f,
                            "r": %.2f,
                            "execution_time": "%tS",
                            "result": "Hit"
                            }
                            """.formatted(x.toBigInteger().intValue(), y.doubleValue(), r.doubleValue(), System.nanoTime() - executionStart));
                }

            } catch (NumberFormatException e) {
                sendResponse("{\"error\": \"Some of values are not a numbers\"}");
            } catch (IllegalArgumentException e) {
                sendResponse("{\"error\": \"Request illegal values: " + e.getMessage() + "\"}");
                // sendResponse("{\"error\": \"Request contains more than 3 values\"}");
            } catch (ArrayIndexOutOfBoundsException e) {
                sendResponse("{\"error\": \"Request contains empty values\"}");
            }
        }
    }
}
