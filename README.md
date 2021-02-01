# Modern Networking

Here we're using Combine framework and Swift UI so the minimum requirement is Xcode 11, iOS 13 and Swift 5.1

Combination of SwiftUI and Combine can decrease the complexity of the application, so it means it will decrease hours spent over the code. Combine framework also handles asynchronicity; using it to process your URL task results simplifies and empowers your code.

We've four module:
* API Client
* API Router
* API Error
* API Constants
* Response Models

### API Client
Client sends requests to backend servers and receives responses using combine. and also, responsible for decoding server responses and producing model objects.

### API Router
The router will present an endpoint using HTTP method, HTTP headers, path and parameters.

### API Error
Where we construct an error.

### API Constants
where we keep all our constants in one place.

### Response Models
It contains data models of our application, reflecting the structure of data received from, or sent to, the backend servers.
